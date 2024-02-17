package com.example.arthavya

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import com.example.arthavya.components.PieChart
import com.example.arthavya.ui.theme.ArthavyaTheme

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            ArthavyaTheme {
                val data: Map<String,Int> = mapOf(
                    Pair("Food",550),
                    Pair("Travel",100),
                    Pair("Grocery",400),
                    Pair("Gift", 500),
                )
                Column(
                    modifier = Modifier.fillMaxSize().background(Color.Black),
                    verticalArrangement = Arrangement.Center
                ) {
                    PieChart(data=data)
                    new()
                    //Welcome()
                    //MyImg()
                }

            }
            }
        }
    }

//@Composable
//fun Welcome() {
//    Column(
//        modifier = Modifier.fillMaxHeight(),
//        verticalArrangement = Arrangement.Center,
//        horizontalAlignment = Alignment.CenterHorizontally
//    ) {
//        MyImg()
//        Spacer(modifier = Modifier.height(height = Dp(16.0F))) // Adding space between Text and Image
//        Text(text = "Prasad", style = TextStyle(Color.Blue))
//        Spacer(modifier = Modifier.height(height = Dp(16.0F)))
//        Text(text = "SY C", style = TextStyle(Color.Blue))
//    }
//}
//@Preview(showSystemUi = true)
//@Composable
//fun MyImg(){
//    Image(painter = painterResource(id = R.drawable.download),
//        contentDescription = "", Modifier.size(Dp(400.0F)))
//}
/*
//@Preview(showSystemUi = true)
@Composable
fun Welcome()
{
    Text(text = "Prasad", style = TextStyle(Color.Blue))
//    Spacer(modifier = Modifier.height(height = Dp(5.0F)))
//    Text(text = "Hello", style = TextStyle(Color.Green))
}


@Composable
fun Greeting(name: String, modifier: Modifier = Modifier) {
    Text(
            text = "Hello $name!",
            modifier = modifier
    )
}
@Preview(showBackground = true)
@Composable
fun GreetingPreview() {
    ArthavyaTheme {
        Greeting("Android")
    }
}
*/