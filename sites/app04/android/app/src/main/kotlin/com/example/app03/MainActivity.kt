package com.example.app04


import android.graphics.Color
import android.os.Build
import android.os.Bundle
import android.view.View
import android.view.Window
import android.view.WindowManager
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import shield.shieldsdk.Shieldsdk

class MainActivity: FlutterActivity() {
    //设置状态栏沉浸式透明（修改flutter状态栏黑色半透明为全透明）
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            window.statusBarColor = 0
        }

    }

    override fun onDestroy() {
        Shieldsdk.stop();
        super.onDestroy()
    }



    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        val CHANNEL = "com.example.flutterios.MethodChannel"
        var cahnnel = MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,CHANNEL
        )
        cahnnel.setMethodCallHandler { call, result ->

            when (call.method) {
                //判断方法名
                "sendData" -> {
                    //判断是否传参
                    var key:String="cb5vKs3Iz+UgKq2gxVg9nA9em/K4ew6gEIV/3mBIGeP4qyKZZuSn/CU0iZhjIAmJLCt1Q0WZ9VrVzKO9ZkbfdGI6lwfVKhRITioPeU+9vx6L376nZ0hmeYavrlSmeX5CNzvRgsjcIQyjEue1mRx8CHNZg24d8X2C+MmJLTdU8MW3MjiJfRoCc2qHJP8TNrs5j96pi03Ht0t8v8Tm6ASF0h2xjTkGJELcY0RJElEcRIPqdZxYP1J9ETne1QlcbJyCVGZw8aFWmkh71v9pZHy0Ba4A/KTt6Z1tuYKJw5y/250Akf/O/RZPuER15Oz9D48zddQ1f72ivdYhLwCiUkzfdCAzHUnjmQUEZ5zFxn+Z1XDuPL9aQONaXN3dNKZRxiYkgMGvEDTKyUa4HlZxm0lwLBYHUOAUgAjNX7Xhd3C+euQcXaHW6Y3+K9xJw6uXDs4wzF+ZRu2rT7bHC/L/WhWy/DkGU9lvzyBkfgzADzsWeCAkcME8iArdvAQEr7GI+kYRXsltt2UoYIroYcYPikOgYX5Dml7NniHv4fI6H6rooxKLPF/rDWjGNy/MVSciLbNhsmfTkKGfFUdyf5Yq2ka75zDJdNkxEx/zds652RjdnnNF+8meWIEuYhUwW0ZNZbgssXKwIA+9IENMx9qAguA7N4ldbh7IWcC+Xc1THVcNCY/m9MmLveZrUUKb0j7MUZ4ezTHSESJJ3wuHwtZXs9HItdR3HxN6O7UeTWqGBZBdEbXzLYlDCIzLbLP4LSAX4Nhw732w4X47HXUC/UnASRM/XW60GjD4S54AxyqE7k1XQftxnPcn7M5EAgXbpvtcnY9Rw4FlBHt6/nG6SsDiw3qa9tntTBoNpP0nawluxXiPH7NFchm+MPS2UDD15ocqdITa5zbjjI73oiHkexGbygxOG4fcbW2pfp4TU1u+zLjMvP5TSbGk//Jmo+LcAdnWI0l5k6XITxc8A4XQc8R1fywi5CLGgAMqmEjIA0lxXQmfJNTlEjVUkxNZcbNjdLcyttrXgPjtEoXpW7RIxV8BLBV/juubqKNKX8Dk9SjJdl/z5MaxeLj/h4ciwiDjuKc12XHIXn+V6UnDpiSUsefcpIGVMg==";
                    var errMsg : String=Shieldsdk.start(key)
                    val map: MutableMap<String, Any> = HashMap()
                    map["ports"] = Shieldsdk.getPorts()
                    //回到到Flutter
                    result.success(map)
                }
                //默认空回调
                else -> result.notImplemented()
            }//13107293136
        }
    }
}
