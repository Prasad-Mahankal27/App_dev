package com.example.arthavya.components

import androidx.compose.animation.core.LinearOutSlowInEasing
import androidx.compose.animation.core.animateFloatAsState
import androidx.compose.animation.core.tween
import androidx.compose.foundation.Canvas
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.lazy.grid.GridCells
import androidx.compose.foundation.lazy.grid.GridItemSpan
import androidx.compose.foundation.lazy.grid.LazyVerticalGrid
import androidx.compose.foundation.lazy.grid.items
import androidx.compose.foundation.lazy.grid.itemsIndexed
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.rotate
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.StrokeCap
import androidx.compose.ui.graphics.drawscope.DrawStyle
import androidx.compose.ui.graphics.drawscope.Stroke
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.Dp
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp

@Composable
fun PieChart(data:Map<String,Int>, radiusOuter:Dp = 120.dp, chartBarWidth: Dp = 20.dp, animDuration:Int = 1000)
{
    val totalSum = data.values.sum()
    val floatValue = mutableListOf<Float>()

    data.values.forEachIndexed{index,values->
        floatValue.add(index,360*values.toFloat()/totalSum.toFloat())
    }

//    val colors = mutableListOf<androidx.compose.ui.graphics.Color>()
//    floatValue.forEach{i->
//        colors.add(Color(i.toInt()))
//    }
    val colors = listOf(
        Color.Gray,
        Color.Cyan,
        Color.Green,
        Color.Magenta
    )
    var animationPlayed by remember {
        mutableStateOf(false)
    }

    var lastValue = 0f

    val animateSize by animateFloatAsState(
        targetValue = if(animationPlayed) radiusOuter.value * 2f else 0f,
        animationSpec = tween(
            durationMillis = animDuration,
            delayMillis = 0,
            easing = LinearOutSlowInEasing
        ), label = ""
    )

    val animateRotation by animateFloatAsState(
        targetValue = if(animationPlayed) 90f * 11f else 0f,
        animationSpec = tween(
            durationMillis = animDuration,
            delayMillis = 0,
            easing = LinearOutSlowInEasing
        ), label = ""
    )

    LaunchedEffect(key1 = true){
        animationPlayed = true
    }

    Column(
        modifier = Modifier.fillMaxSize(),
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        Box(
            modifier = Modifier
                .size(animateSize.dp)
                .padding(50.dp),
            contentAlignment = Alignment.Center
        ){
            Canvas(
                modifier = Modifier
                    .size(radiusOuter * 2f)
                    .rotate(animateRotation)
            ){
                floatValue.forEachIndexed{index,value ->
                    drawArc(
                        color=colors[index],
                        lastValue,
                        value,
                        useCenter = false,
                        style = Stroke(chartBarWidth.toPx(),cap = StrokeCap.Butt)
                    )
                    lastValue += value
                }
            }
        }
        DetailsPieChart(data = data, colors = colors)
    }

}

@Composable
fun DetailsPieChart(data:Map<String,Int>,colors:List<Color>)
{
    LazyVerticalGrid(
        columns = GridCells.Fixed(2)
    ){
        items(data.values.toList()) { value ->
            val index = data.values.indexOf(value)
            DetailedPieChartItem(
                data = Pair(data.keys.elementAt(index), value),
                color = colors[index]
            )
        }
    }
//    Column(
//        modifier = Modifier
//            .padding(top = 60.dp)
//            .fillMaxWidth()
//    ){
//        data.values.forEachIndexed{index,value->
//            DetailedPieChartItem(
//                data = Pair(data.keys.elementAt(index),value),
//                color = colors[index]
//            )
//        }
//    }
}

@Composable
fun DetailedPieChartItem(data:Pair<String,Int>,height:Dp = 30.dp,color:Color)
{
    Surface(
        modifier = Modifier.padding(vertical = 10.dp, horizontal = 30.dp),
        color = Color.Transparent
    ) {
        Row(
            modifier = Modifier.fillMaxWidth(),
            verticalAlignment = Alignment.CenterVertically
        ){
            Box(
                modifier= Modifier
                    .background(color = color, shape = RoundedCornerShape(10.dp))
                    .size(height)
            )

            Column(
                modifier = Modifier.fillMaxWidth()
            ) {
                Text(
                    text = data.first,
                    modifier = Modifier.padding(start = 15.dp),
                    fontWeight = FontWeight.Medium,
                    fontSize = 15.sp,
                    color = Color.White
                )

                Text(
                    text = data.second.toString(),
                    modifier = Modifier.padding(start = 15.dp),
                    fontWeight = FontWeight.Medium,
                    fontSize = 15.sp,
                    color = Color.White
                )
            }
        }
    }
}