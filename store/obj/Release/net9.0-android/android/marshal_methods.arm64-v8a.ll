; ModuleID = 'marshal_methods.arm64-v8a.ll'
source_filename = "marshal_methods.arm64-v8a.ll"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [191 x ptr] zeroinitializer, align 8

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [573 x i64] [
	i64 u0x0071cf2d27b7d61e, ; 0: lib_Xamarin.AndroidX.SwipeRefreshLayout.dll.so => 107
	i64 u0x01109b0e4d99e61f, ; 1: System.ComponentModel.Annotations.dll => 126
	i64 u0x01af0bd6467d518e, ; 2: lib_ZXing.Net.MAUI.dll.so => 116
	i64 u0x02123411c4e01926, ; 3: lib_Xamarin.AndroidX.Navigation.Runtime.dll.so => 103
	i64 u0x022e81ea9c46e03a, ; 4: lib_CommunityToolkit.Maui.Core.dll.so => 36
	i64 u0x02a4c5a44384f885, ; 5: Microsoft.Extensions.Caching.Memory => 48
	i64 u0x02abedc11addc1ed, ; 6: lib_Mono.Android.Runtime.dll.so => 189
	i64 u0x032267b2a94db371, ; 7: lib_Xamarin.AndroidX.AppCompat.dll.so => 81
	i64 u0x0363ac97a4cb84e6, ; 8: SQLitePCLRaw.provider.e_sqlite3.dll => 72
	i64 u0x043032f1d071fae0, ; 9: ru/Microsoft.Maui.Controls.resources => 24
	i64 u0x044440a55165631e, ; 10: lib-cs-Microsoft.Maui.Controls.resources.dll.so => 2
	i64 u0x046eb1581a80c6b0, ; 11: vi/Microsoft.Maui.Controls.resources => 30
	i64 u0x0517ef04e06e9f76, ; 12: System.Net.Primitives => 150
	i64 u0x0565d18c6da3de38, ; 13: Xamarin.AndroidX.RecyclerView => 105
	i64 u0x057bf9fa9fb09f7c, ; 14: Microsoft.Data.Sqlite.dll => 42
	i64 u0x0581db89237110e9, ; 15: lib_System.Collections.dll.so => 125
	i64 u0x05989cb940b225a9, ; 16: Microsoft.Maui.dll => 61
	i64 u0x05a0cd02a6c1cd3c, ; 17: Svg.Skia.dll => 75
	i64 u0x05ef98b6a1db882c, ; 18: lib_Microsoft.Data.Sqlite.dll.so => 42
	i64 u0x0600544dd3961080, ; 19: HarfBuzzSharp => 40
	i64 u0x06076b5d2b581f08, ; 20: zh-HK/Microsoft.Maui.Controls.resources => 31
	i64 u0x06388ffe9f6c161a, ; 21: System.Xml.Linq.dll => 182
	i64 u0x0680a433c781bb3d, ; 22: Xamarin.AndroidX.Collection.Jvm => 88
	i64 u0x07c57877c7ba78ad, ; 23: ru/Microsoft.Maui.Controls.resources.dll => 24
	i64 u0x07dcdc7460a0c5e4, ; 24: System.Collections.NonGeneric => 123
	i64 u0x08a7c865576bbde7, ; 25: System.Reflection.Primitives => 162
	i64 u0x08f3c9788ee2153c, ; 26: Xamarin.AndroidX.DrawerLayout => 93
	i64 u0x09138715c92dba90, ; 27: lib_System.ComponentModel.Annotations.dll.so => 126
	i64 u0x0919c28b89381a0b, ; 28: lib_Microsoft.Extensions.Options.dll.so => 56
	i64 u0x092266563089ae3e, ; 29: lib_System.Collections.NonGeneric.dll.so => 123
	i64 u0x09d144a7e214d457, ; 30: System.Security.Cryptography => 170
	i64 u0x0a4ff7e2ead194a4, ; 31: lib_SkiaSharp.HarfBuzz.dll.so => 68
	i64 u0x0a805f95d98f597b, ; 32: lib_Microsoft.Extensions.Caching.Abstractions.dll.so => 47
	i64 u0x0abb3e2b271edc45, ; 33: System.Threading.Channels.dll => 175
	i64 u0x0b3b632c3bbee20c, ; 34: sk/Microsoft.Maui.Controls.resources => 25
	i64 u0x0b6aff547b84fbe9, ; 35: Xamarin.KotlinX.Serialization.Core.Jvm => 114
	i64 u0x0be2e1f8ce4064ed, ; 36: Xamarin.AndroidX.ViewPager => 108
	i64 u0x0c3ca6cc978e2aae, ; 37: pt-BR/Microsoft.Maui.Controls.resources => 21
	i64 u0x0c3d7adcdb333bf0, ; 38: Xamarin.AndroidX.Camera.Lifecycle => 85
	i64 u0x0c59ad9fbbd43abe, ; 39: Mono.Android => 190
	i64 u0x0c7790f60165fc06, ; 40: lib_Microsoft.Maui.Essentials.dll.so => 62
	i64 u0x0cfd116e78cbc305, ; 41: lib_ShimSkiaSharp.dll.so => 66
	i64 u0x0d5c95da1348bb1c, ; 42: Svg.Model => 74
	i64 u0x0e14e73a54dda68e, ; 43: lib_System.Net.NameResolution.dll.so => 148
	i64 u0x102a31b45304b1da, ; 44: Xamarin.AndroidX.CustomView => 92
	i64 u0x10f6cfcbcf801616, ; 45: System.IO.Compression.Brotli => 139
	i64 u0x123639456fb056da, ; 46: System.Reflection.Emit.Lightweight.dll => 161
	i64 u0x125b7f94acb989db, ; 47: Xamarin.AndroidX.RecyclerView.dll => 105
	i64 u0x138567fa954faa55, ; 48: Xamarin.AndroidX.Browser => 83
	i64 u0x13a01de0cbc3f06c, ; 49: lib-fr-Microsoft.Maui.Controls.resources.dll.so => 8
	i64 u0x13f1e5e209e91af4, ; 50: lib_Java.Interop.dll.so => 188
	i64 u0x13f1e880c25d96d1, ; 51: he/Microsoft.Maui.Controls.resources => 9
	i64 u0x143d8ea60a6a4011, ; 52: Microsoft.Extensions.DependencyInjection.Abstractions => 52
	i64 u0x152a448bd1e745a7, ; 53: Microsoft.Win32.Primitives => 120
	i64 u0x16054fdcb6b3098b, ; 54: Microsoft.Extensions.DependencyModel.dll => 53
	i64 u0x16bf2a22df043a09, ; 55: System.IO.Pipes.dll => 142
	i64 u0x17125c9a85b4929f, ; 56: lib_netstandard.dll.so => 186
	i64 u0x17b56e25558a5d36, ; 57: lib-hu-Microsoft.Maui.Controls.resources.dll.so => 12
	i64 u0x17f9358913beb16a, ; 58: System.Text.Encodings.Web => 173
	i64 u0x18402a709e357f3b, ; 59: lib_Xamarin.KotlinX.Serialization.Core.Jvm.dll.so => 114
	i64 u0x18f0ce884e87d89a, ; 60: nb/Microsoft.Maui.Controls.resources.dll => 18
	i64 u0x1a040febb58bf51e, ; 61: lib_Xamarin.AndroidX.Camera.View.dll.so => 86
	i64 u0x1a21ad8fb8814a23, ; 62: lib_UraniumUI.dll.so => 78
	i64 u0x1a91866a319e9259, ; 63: lib_System.Collections.Concurrent.dll.so => 121
	i64 u0x1aac34d1917ba5d3, ; 64: lib_System.dll.so => 185
	i64 u0x1aad60783ffa3e5b, ; 65: lib-th-Microsoft.Maui.Controls.resources.dll.so => 27
	i64 u0x1c753b5ff15bce1b, ; 66: Mono.Android.Runtime.dll => 189
	i64 u0x1d4c109ca6e27ed8, ; 67: lib_Microsoft.Maui.Controls.Compatibility.dll.so => 58
	i64 u0x1e3d87657e9659bc, ; 68: Xamarin.AndroidX.Navigation.UI => 104
	i64 u0x1e71143913d56c10, ; 69: lib-ko-Microsoft.Maui.Controls.resources.dll.so => 16
	i64 u0x1e7c31185e2fb266, ; 70: lib_System.Threading.Tasks.Parallel.dll.so => 176
	i64 u0x1ed8fcce5e9b50a0, ; 71: Microsoft.Extensions.Options.dll => 56
	i64 u0x209375905fcc1bad, ; 72: lib_System.IO.Compression.Brotli.dll.so => 139
	i64 u0x20fab3cf2dfbc8df, ; 73: lib_System.Diagnostics.Process.dll.so => 133
	i64 u0x2174319c0d835bc9, ; 74: System.Runtime => 169
	i64 u0x21cc7e445dcd5469, ; 75: System.Reflection.Emit.ILGeneration => 160
	i64 u0x220fd4f2e7c48170, ; 76: th/Microsoft.Maui.Controls.resources => 27
	i64 u0x224538d85ed15a82, ; 77: System.IO.Pipes => 142
	i64 u0x237be844f1f812c7, ; 78: System.Threading.Thread.dll => 177
	i64 u0x23807c59646ec4f3, ; 79: lib_Microsoft.EntityFrameworkCore.dll.so => 43
	i64 u0x2407aef2bbe8fadf, ; 80: System.Console => 130
	i64 u0x240abe014b27e7d3, ; 81: Xamarin.AndroidX.Core.dll => 90
	i64 u0x247619fe4413f8bf, ; 82: System.Runtime.Serialization.Primitives.dll => 168
	i64 u0x252073cc3caa62c2, ; 83: fr/Microsoft.Maui.Controls.resources.dll => 8
	i64 u0x25a0a7eff76ea08e, ; 84: SQLitePCLRaw.batteries_v2.dll => 69
	i64 u0x2662c629b96b0b30, ; 85: lib_Xamarin.Kotlin.StdLib.dll.so => 112
	i64 u0x268c1439f13bcc29, ; 86: lib_Microsoft.Extensions.Primitives.dll.so => 57
	i64 u0x268f1dca6d06d437, ; 87: Xamarin.AndroidX.Camera.Core => 84
	i64 u0x273f3515de5faf0d, ; 88: id/Microsoft.Maui.Controls.resources.dll => 13
	i64 u0x2742545f9094896d, ; 89: hr/Microsoft.Maui.Controls.resources => 11
	i64 u0x27b410442fad6cf1, ; 90: Java.Interop.dll => 188
	i64 u0x2801845a2c71fbfb, ; 91: System.Net.Primitives.dll => 150
	i64 u0x2927d345f3daec35, ; 92: SkiaSharp.dll => 67
	i64 u0x2a128783efe70ba0, ; 93: uk/Microsoft.Maui.Controls.resources.dll => 29
	i64 u0x2a3b095612184159, ; 94: lib_System.Net.NetworkInformation.dll.so => 149
	i64 u0x2a45e6c17076bfbd, ; 95: SkiaSharp.HarfBuzz.dll => 68
	i64 u0x2a6507a5ffabdf28, ; 96: System.Diagnostics.TraceSource.dll => 134
	i64 u0x2ad156c8e1354139, ; 97: fi/Microsoft.Maui.Controls.resources => 7
	i64 u0x2af298f63581d886, ; 98: System.Text.RegularExpressions.dll => 174
	i64 u0x2afc1c4f898552ee, ; 99: lib_System.Formats.Asn1.dll.so => 138
	i64 u0x2b148910ed40fbf9, ; 100: zh-Hant/Microsoft.Maui.Controls.resources.dll => 33
	i64 u0x2c8bd14bb93a7d82, ; 101: lib-pl-Microsoft.Maui.Controls.resources.dll.so => 20
	i64 u0x2cbd9262ca785540, ; 102: lib_System.Text.Encoding.CodePages.dll.so => 171
	i64 u0x2cc9e1fed6257257, ; 103: lib_System.Reflection.Emit.Lightweight.dll.so => 161
	i64 u0x2cd723e9fe623c7c, ; 104: lib_System.Private.Xml.Linq.dll.so => 158
	i64 u0x2d169d318a968379, ; 105: System.Threading.dll => 179
	i64 u0x2d47774b7d993f59, ; 106: sv/Microsoft.Maui.Controls.resources.dll => 26
	i64 u0x2db915caf23548d2, ; 107: System.Text.Json.dll => 77
	i64 u0x2e6f1f226821322a, ; 108: el/Microsoft.Maui.Controls.resources.dll => 5
	i64 u0x2f02f94df3200fe5, ; 109: System.Diagnostics.Process => 133
	i64 u0x2f2e98e1c89b1aff, ; 110: System.Xml.ReaderWriter => 183
	i64 u0x2f5911d9ba814e4e, ; 111: System.Diagnostics.Tracing => 135
	i64 u0x2feb4d2fcda05cfd, ; 112: Microsoft.Extensions.Caching.Abstractions.dll => 47
	i64 u0x309ee9eeec09a71e, ; 113: lib_Xamarin.AndroidX.Fragment.dll.so => 94
	i64 u0x31195fef5d8fb552, ; 114: _Microsoft.Android.Resource.Designer.dll => 34
	i64 u0x32243413e774362a, ; 115: Xamarin.AndroidX.CardView.dll => 87
	i64 u0x3235427f8d12dae1, ; 116: lib_System.Drawing.Primitives.dll.so => 136
	i64 u0x329753a17a517811, ; 117: fr/Microsoft.Maui.Controls.resources => 8
	i64 u0x32aa989ff07a84ff, ; 118: lib_System.Xml.ReaderWriter.dll.so => 183
	i64 u0x33829542f112d59b, ; 119: System.Collections.Immutable => 122
	i64 u0x33a31443733849fe, ; 120: lib-es-Microsoft.Maui.Controls.resources.dll.so => 6
	i64 u0x341abc357fbb4ebf, ; 121: lib_System.Net.Sockets.dll.so => 153
	i64 u0x34c492cef793bb77, ; 122: lib_InputKit.Maui.dll.so => 41
	i64 u0x34dfd74fe2afcf37, ; 123: Microsoft.Maui => 61
	i64 u0x34e292762d9615df, ; 124: cs/Microsoft.Maui.Controls.resources.dll => 2
	i64 u0x3508234247f48404, ; 125: Microsoft.Maui.Controls => 59
	i64 u0x353590da528c9d22, ; 126: System.ComponentModel.Annotations => 126
	i64 u0x3549870798b4cd30, ; 127: lib_Xamarin.AndroidX.ViewPager2.dll.so => 109
	i64 u0x355282fc1c909694, ; 128: Microsoft.Extensions.Configuration => 49
	i64 u0x360a66b9f4afb47e, ; 129: ShimSkiaSharp => 66
	i64 u0x36b2b50fdf589ae2, ; 130: System.Reflection.Emit.Lightweight => 161
	i64 u0x36d2129305806e75, ; 131: UraniumUI => 78
	i64 u0x374ef46b06791af6, ; 132: System.Reflection.Primitives.dll => 162
	i64 u0x380134e03b1e160a, ; 133: System.Collections.Immutable.dll => 122
	i64 u0x385c17636bb6fe6e, ; 134: Xamarin.AndroidX.CustomView.dll => 92
	i64 u0x38869c811d74050e, ; 135: System.Net.NameResolution.dll => 148
	i64 u0x393c226616977fdb, ; 136: lib_Xamarin.AndroidX.ViewPager.dll.so => 108
	i64 u0x395e37c3334cf82a, ; 137: lib-ca-Microsoft.Maui.Controls.resources.dll.so => 1
	i64 u0x39aa39fda111d9d3, ; 138: Newtonsoft.Json => 64
	i64 u0x39d48361041cb258, ; 139: store.dll => 118
	i64 u0x3b860f9932505633, ; 140: lib_System.Text.Encoding.Extensions.dll.so => 172
	i64 u0x3c7c495f58ac5ee9, ; 141: Xamarin.Kotlin.StdLib => 112
	i64 u0x3cd9d281d402eb9b, ; 142: Xamarin.AndroidX.Browser.dll => 83
	i64 u0x3ced6a4f3010aa96, ; 143: ZXing.Net.MAUI.Controls => 117
	i64 u0x3d196e782ed8c01a, ; 144: System.Data.SqlClient => 76
	i64 u0x3d1c50cc001a991e, ; 145: Xamarin.Google.Guava.ListenableFuture.dll => 111
	i64 u0x3d2b1913edfc08d7, ; 146: lib_System.Threading.ThreadPool.dll.so => 178
	i64 u0x3d46f0b995082740, ; 147: System.Xml.Linq => 182
	i64 u0x3d9c2a242b040a50, ; 148: lib_Xamarin.AndroidX.Core.dll.so => 90
	i64 u0x3da7781d6333a8fe, ; 149: SQLitePCLRaw.batteries_v2 => 69
	i64 u0x407a10bb4bf95829, ; 150: lib_Xamarin.AndroidX.Navigation.Common.dll.so => 101
	i64 u0x41cab042be111c34, ; 151: lib_Xamarin.AndroidX.AppCompat.AppCompatResources.dll.so => 82
	i64 u0x43375950ec7c1b6a, ; 152: netstandard.dll => 186
	i64 u0x434c4e1d9284cdae, ; 153: Mono.Android.dll => 190
	i64 u0x4394150249e83099, ; 154: lib_store.dll.so => 118
	i64 u0x43950f84de7cc79a, ; 155: pl/Microsoft.Maui.Controls.resources.dll => 20
	i64 u0x448bd33429269b19, ; 156: Microsoft.CSharp => 119
	i64 u0x4499fa3c8e494654, ; 157: lib_System.Runtime.Serialization.Primitives.dll.so => 168
	i64 u0x4515080865a951a5, ; 158: Xamarin.Kotlin.StdLib.dll => 112
	i64 u0x453c1277f85cf368, ; 159: lib_Microsoft.EntityFrameworkCore.Abstractions.dll.so => 44
	i64 u0x45aceb3561dbf4e7, ; 160: Svg.Custom => 73
	i64 u0x45c40276a42e283e, ; 161: System.Diagnostics.TraceSource => 134
	i64 u0x45d124f3a617a7d2, ; 162: lib_Svg.Custom.dll.so => 73
	i64 u0x45fcc9fd66f25095, ; 163: Microsoft.Extensions.DependencyModel => 53
	i64 u0x46a4213bc97fe5ae, ; 164: lib-ru-Microsoft.Maui.Controls.resources.dll.so => 24
	i64 u0x47358bd471172e1d, ; 165: lib_System.Xml.Linq.dll.so => 182
	i64 u0x47daf4e1afbada10, ; 166: pt/Microsoft.Maui.Controls.resources => 22
	i64 u0x49e952f19a4e2022, ; 167: System.ObjectModel => 156
	i64 u0x4a5667b2462a664b, ; 168: lib_Xamarin.AndroidX.Navigation.UI.dll.so => 104
	i64 u0x4b7b6532ded934b7, ; 169: System.Text.Json => 77
	i64 u0x4ca014ceac582c86, ; 170: Microsoft.EntityFrameworkCore.Relational.dll => 45
	i64 u0x4cc5f15266470798, ; 171: lib_Xamarin.AndroidX.Loader.dll.so => 100
	i64 u0x4cf6f67dc77aacd2, ; 172: System.Net.NetworkInformation.dll => 149
	i64 u0x4d447523346ce7e7, ; 173: lib_Svg.Skia.dll.so => 75
	i64 u0x4d479f968a05e504, ; 174: System.Linq.Expressions.dll => 143
	i64 u0x4d55a010ffc4faff, ; 175: System.Private.Xml => 159
	i64 u0x4d91e5c949c8f5e5, ; 176: InputKit.Maui.dll => 41
	i64 u0x4d95fccc1f67c7ca, ; 177: System.Runtime.Loader.dll => 165
	i64 u0x4da4a8f0f6a70fdc, ; 178: Microsoft.Maui.Controls.Compatibility.dll => 58
	i64 u0x4dcf44c3c9b076a2, ; 179: it/Microsoft.Maui.Controls.resources.dll => 14
	i64 u0x4dd9247f1d2c3235, ; 180: Xamarin.AndroidX.Loader.dll => 100
	i64 u0x4e32f00cb0937401, ; 181: Mono.Android.Runtime => 189
	i64 u0x4e5eea4668ac2b18, ; 182: System.Text.Encoding.CodePages => 171
	i64 u0x4ebd0c4b82c5eefc, ; 183: lib_System.Threading.Channels.dll.so => 175
	i64 u0x4f21ee6ef9eb527e, ; 184: ca/Microsoft.Maui.Controls.resources => 1
	i64 u0x4fd5f3ee53d0a4f0, ; 185: SQLitePCLRaw.lib.e_sqlite3.android => 71
	i64 u0x5037f0be3c28c7a3, ; 186: lib_Microsoft.Maui.Controls.dll.so => 59
	i64 u0x5112ed116d87baf8, ; 187: CommunityToolkit.Mvvm => 37
	i64 u0x5131bbe80989093f, ; 188: Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll => 98
	i64 u0x51bb8a2afe774e32, ; 189: System.Drawing => 137
	i64 u0x526ce79eb8e90527, ; 190: lib_System.Net.Primitives.dll.so => 150
	i64 u0x52829f00b4467c38, ; 191: lib_System.Data.Common.dll.so => 131
	i64 u0x529ffe06f39ab8db, ; 192: Xamarin.AndroidX.Core => 90
	i64 u0x52ff996554dbf352, ; 193: Microsoft.Maui.Graphics => 63
	i64 u0x535f7e40e8fef8af, ; 194: lib-sk-Microsoft.Maui.Controls.resources.dll.so => 25
	i64 u0x53a96d5c86c9e194, ; 195: System.Net.NetworkInformation => 149
	i64 u0x53be1038a61e8d44, ; 196: System.Runtime.InteropServices.RuntimeInformation.dll => 163
	i64 u0x53c3014b9437e684, ; 197: lib-zh-HK-Microsoft.Maui.Controls.resources.dll.so => 31
	i64 u0x54795225dd1587af, ; 198: lib_System.Runtime.dll.so => 169
	i64 u0x547a34f14e5f6210, ; 199: Xamarin.AndroidX.Lifecycle.Common.dll => 95
	i64 u0x556e8b63b660ab8b, ; 200: Xamarin.AndroidX.Lifecycle.Common.Jvm.dll => 96
	i64 u0x5588627c9a108ec9, ; 201: System.Collections.Specialized => 124
	i64 u0x571c5cfbec5ae8e2, ; 202: System.Private.Uri => 157
	i64 u0x578cd35c91d7b347, ; 203: lib_SQLitePCLRaw.core.dll.so => 70
	i64 u0x579a06fed6eec900, ; 204: System.Private.CoreLib.dll => 187
	i64 u0x57c542c14049b66d, ; 205: System.Diagnostics.DiagnosticSource => 132
	i64 u0x58601b2dda4a27b9, ; 206: lib-ja-Microsoft.Maui.Controls.resources.dll.so => 15
	i64 u0x58688d9af496b168, ; 207: Microsoft.Extensions.DependencyInjection.dll => 51
	i64 u0x595a356d23e8da9a, ; 208: lib_Microsoft.CSharp.dll.so => 119
	i64 u0x5a89a886ae30258d, ; 209: lib_Xamarin.AndroidX.CoordinatorLayout.dll.so => 89
	i64 u0x5a8f6699f4a1caa9, ; 210: lib_System.Threading.dll.so => 179
	i64 u0x5ae9cd33b15841bf, ; 211: System.ComponentModel => 129
	i64 u0x5b1cb319d4710457, ; 212: lib_FFImageLoading.Maui.dll.so => 39
	i64 u0x5b5f0e240a06a2a2, ; 213: da/Microsoft.Maui.Controls.resources.dll => 3
	i64 u0x5bf46208bead7b18, ; 214: ShimSkiaSharp.dll => 66
	i64 u0x5bf46332cc09e9b2, ; 215: lib_System.Data.SqlClient.dll.so => 76
	i64 u0x5c393624b8176517, ; 216: lib_Microsoft.Extensions.Logging.dll.so => 54
	i64 u0x5d0a4a29b02d9d3c, ; 217: System.Net.WebHeaderCollection.dll => 154
	i64 u0x5d1b514fc45c92d4, ; 218: ZXing.Net.MAUI => 116
	i64 u0x5d7ec76c1c703055, ; 219: System.Threading.Tasks.Parallel => 176
	i64 u0x5db0cbbd1028510e, ; 220: lib_System.Runtime.InteropServices.dll.so => 164
	i64 u0x5db30905d3e5013b, ; 221: Xamarin.AndroidX.Collection.Jvm.dll => 88
	i64 u0x5e467bc8f09ad026, ; 222: System.Collections.Specialized.dll => 124
	i64 u0x5ea92fdb19ec8c4c, ; 223: System.Text.Encodings.Web.dll => 173
	i64 u0x5eb8046dd40e9ac3, ; 224: System.ComponentModel.Primitives => 127
	i64 u0x5f36ccf5c6a57e24, ; 225: System.Xml.ReaderWriter.dll => 183
	i64 u0x5f3bce5c22261fd2, ; 226: ExCSS.dll => 38
	i64 u0x5f4294b9b63cb842, ; 227: System.Data.Common => 131
	i64 u0x5f7399e166075632, ; 228: lib_SQLitePCLRaw.lib.e_sqlite3.android.dll.so => 71
	i64 u0x5f9a2d823f664957, ; 229: lib-el-Microsoft.Maui.Controls.resources.dll.so => 5
	i64 u0x609f4b7b63d802d4, ; 230: lib_Microsoft.Extensions.DependencyInjection.dll.so => 51
	i64 u0x60cd4e33d7e60134, ; 231: Xamarin.KotlinX.Coroutines.Core.Jvm => 113
	i64 u0x60f62d786afcf130, ; 232: System.Memory => 146
	i64 u0x61be8d1299194243, ; 233: Microsoft.Maui.Controls.Xaml => 60
	i64 u0x61d2cba29557038f, ; 234: de/Microsoft.Maui.Controls.resources => 4
	i64 u0x61d88f399afb2f45, ; 235: lib_System.Runtime.Loader.dll.so => 165
	i64 u0x622eef6f9e59068d, ; 236: System.Private.CoreLib => 187
	i64 u0x63f1f6883c1e23c2, ; 237: lib_System.Collections.Immutable.dll.so => 122
	i64 u0x6400f68068c1e9f1, ; 238: Xamarin.Google.Android.Material.dll => 110
	i64 u0x658f524e4aba7dad, ; 239: CommunityToolkit.Maui.dll => 35
	i64 u0x65ecac39144dd3cc, ; 240: Microsoft.Maui.Controls.dll => 59
	i64 u0x65ece51227bfa724, ; 241: lib_System.Runtime.Numerics.dll.so => 166
	i64 u0x6692e924eade1b29, ; 242: lib_System.Console.dll.so => 130
	i64 u0x66a4e5c6a3fb0bae, ; 243: lib_Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll.so => 98
	i64 u0x66d13304ce1a3efa, ; 244: Xamarin.AndroidX.CursorAdapter => 91
	i64 u0x68558ec653afa616, ; 245: lib-da-Microsoft.Maui.Controls.resources.dll.so => 3
	i64 u0x6872ec7a2e36b1ac, ; 246: System.Drawing.Primitives.dll => 136
	i64 u0x68fbbbe2eb455198, ; 247: System.Formats.Asn1 => 138
	i64 u0x69063fc0ba8e6bdd, ; 248: he/Microsoft.Maui.Controls.resources.dll => 9
	i64 u0x699dffb2427a2d71, ; 249: SQLitePCLRaw.lib.e_sqlite3.android.dll => 71
	i64 u0x6a4d7577b2317255, ; 250: System.Runtime.InteropServices.dll => 164
	i64 u0x6ace3b74b15ee4a4, ; 251: nb/Microsoft.Maui.Controls.resources => 18
	i64 u0x6d12bfaa99c72b1f, ; 252: lib_Microsoft.Maui.Graphics.dll.so => 63
	i64 u0x6d79993361e10ef2, ; 253: Microsoft.Extensions.Primitives => 57
	i64 u0x6d86d56b84c8eb71, ; 254: lib_Xamarin.AndroidX.CursorAdapter.dll.so => 91
	i64 u0x6d9bea6b3e895cf7, ; 255: Microsoft.Extensions.Primitives.dll => 57
	i64 u0x6e25a02c3833319a, ; 256: lib_Xamarin.AndroidX.Navigation.Fragment.dll.so => 102
	i64 u0x6fd2265da78b93a4, ; 257: lib_Microsoft.Maui.dll.so => 61
	i64 u0x6fdfc7de82c33008, ; 258: cs/Microsoft.Maui.Controls.resources => 2
	i64 u0x706442eb8d0ca9f8, ; 259: Plainer.Maui.dll => 65
	i64 u0x70e99f48c05cb921, ; 260: tr/Microsoft.Maui.Controls.resources.dll => 28
	i64 u0x70fd3deda22442d2, ; 261: lib-nb-Microsoft.Maui.Controls.resources.dll.so => 18
	i64 u0x71a495ea3761dde8, ; 262: lib-it-Microsoft.Maui.Controls.resources.dll.so => 14
	i64 u0x71ad672adbe48f35, ; 263: System.ComponentModel.Primitives.dll => 127
	i64 u0x72b1fb4109e08d7b, ; 264: lib-hr-Microsoft.Maui.Controls.resources.dll.so => 11
	i64 u0x73e4ce94e2eb6ffc, ; 265: lib_System.Memory.dll.so => 146
	i64 u0x73f2645914262879, ; 266: lib_Microsoft.EntityFrameworkCore.Sqlite.dll.so => 46
	i64 u0x755a91767330b3d4, ; 267: lib_Microsoft.Extensions.Configuration.dll.so => 49
	i64 u0x76012e7334db86e5, ; 268: lib_Xamarin.AndroidX.SavedState.dll.so => 106
	i64 u0x76ca07b878f44da0, ; 269: System.Runtime.Numerics.dll => 166
	i64 u0x780bc73597a503a9, ; 270: lib-ms-Microsoft.Maui.Controls.resources.dll.so => 17
	i64 u0x783606d1e53e7a1a, ; 271: th/Microsoft.Maui.Controls.resources.dll => 27
	i64 u0x78a45e51311409b6, ; 272: Xamarin.AndroidX.Fragment.dll => 94
	i64 u0x7adb8da2ac89b647, ; 273: fi/Microsoft.Maui.Controls.resources.dll => 7
	i64 u0x7b150145c0a9058c, ; 274: Microsoft.Data.Sqlite => 42
	i64 u0x7bef86a4335c4870, ; 275: System.ComponentModel.TypeConverter => 128
	i64 u0x7c0820144cd34d6a, ; 276: sk/Microsoft.Maui.Controls.resources.dll => 25
	i64 u0x7c2a0bd1e0f988fc, ; 277: lib-de-Microsoft.Maui.Controls.resources.dll.so => 4
	i64 u0x7cc637f941f716d0, ; 278: CommunityToolkit.Maui.Core => 36
	i64 u0x7d649b75d580bb42, ; 279: ms/Microsoft.Maui.Controls.resources.dll => 17
	i64 u0x7d8ee2bdc8e3aad1, ; 280: System.Numerics.Vectors => 155
	i64 u0x7dfc3d6d9d8d7b70, ; 281: System.Collections => 125
	i64 u0x7e2e564fa2f76c65, ; 282: lib_System.Diagnostics.Tracing.dll.so => 135
	i64 u0x7e946809d6008ef2, ; 283: lib_System.ObjectModel.dll.so => 156
	i64 u0x7ecc13347c8fd849, ; 284: lib_System.ComponentModel.dll.so => 129
	i64 u0x7f00ddd9b9ca5a13, ; 285: Xamarin.AndroidX.ViewPager.dll => 108
	i64 u0x7f9351cd44b1273f, ; 286: Microsoft.Extensions.Configuration.Abstractions => 50
	i64 u0x7fbd557c99b3ce6f, ; 287: lib_Xamarin.AndroidX.Lifecycle.LiveData.Core.dll.so => 97
	i64 u0x80fa55b6d1b0be99, ; 288: SQLitePCLRaw.provider.e_sqlite3 => 72
	i64 u0x812c069d5cdecc17, ; 289: System.dll => 185
	i64 u0x81ab745f6c0f5ce6, ; 290: zh-Hant/Microsoft.Maui.Controls.resources => 33
	i64 u0x8277f2be6b5ce05f, ; 291: Xamarin.AndroidX.AppCompat => 81
	i64 u0x828f06563b30bc50, ; 292: lib_Xamarin.AndroidX.CardView.dll.so => 87
	i64 u0x82df8f5532a10c59, ; 293: lib_System.Drawing.dll.so => 137
	i64 u0x82f6403342e12049, ; 294: uk/Microsoft.Maui.Controls.resources => 29
	i64 u0x83c14ba66c8e2b8c, ; 295: zh-Hans/Microsoft.Maui.Controls.resources => 32
	i64 u0x844ac8f64fd78edc, ; 296: Xamarin.AndroidX.Camera.View.dll => 86
	i64 u0x846ce984efea52c7, ; 297: System.Threading.Tasks.Parallel.dll => 176
	i64 u0x84ae73148a4557d2, ; 298: lib_System.IO.Pipes.dll.so => 142
	i64 u0x84cd5cdec0f54bcc, ; 299: lib_Microsoft.EntityFrameworkCore.Relational.dll.so => 45
	i64 u0x84f9060cc4a93c8f, ; 300: lib_SkiaSharp.dll.so => 67
	i64 u0x8690556019b686eb, ; 301: Svg.Custom.dll => 73
	i64 u0x86a909228dc7657b, ; 302: lib-zh-Hant-Microsoft.Maui.Controls.resources.dll.so => 33
	i64 u0x86b3e00c36b84509, ; 303: Microsoft.Extensions.Configuration.dll => 49
	i64 u0x86b5381885cbbb52, ; 304: lib_Svg.Model.dll.so => 74
	i64 u0x87c4b8a492b176ad, ; 305: Microsoft.EntityFrameworkCore.Abstractions => 44
	i64 u0x87c69b87d9283884, ; 306: lib_System.Threading.Thread.dll.so => 177
	i64 u0x87f6569b25707834, ; 307: System.IO.Compression.Brotli.dll => 139
	i64 u0x8808a9d7c53dc4c0, ; 308: lib_HarfBuzzSharp.dll.so => 40
	i64 u0x8842b3a5d2d3fb36, ; 309: Microsoft.Maui.Essentials => 62
	i64 u0x88bda98e0cffb7a9, ; 310: lib_Xamarin.KotlinX.Coroutines.Core.Jvm.dll.so => 113
	i64 u0x8930322c7bd8f768, ; 311: netstandard => 186
	i64 u0x894dbdd1ac38f4e1, ; 312: Plainer.Maui => 65
	i64 u0x897a606c9e39c75f, ; 313: lib_System.ComponentModel.Primitives.dll.so => 127
	i64 u0x89c5188089ec2cd5, ; 314: lib_System.Runtime.InteropServices.RuntimeInformation.dll.so => 163
	i64 u0x8a399a706fcbce4b, ; 315: Microsoft.Extensions.Caching.Abstractions => 47
	i64 u0x8ad229ea26432ee2, ; 316: Xamarin.AndroidX.Loader => 100
	i64 u0x8b4ff5d0fdd5faa1, ; 317: lib_System.Diagnostics.DiagnosticSource.dll.so => 132
	i64 u0x8b8d01333a96d0b5, ; 318: System.Diagnostics.Process.dll => 133
	i64 u0x8b9ceca7acae3451, ; 319: lib-he-Microsoft.Maui.Controls.resources.dll.so => 9
	i64 u0x8d0f420977c2c1c7, ; 320: Xamarin.AndroidX.CursorAdapter.dll => 91
	i64 u0x8d2551476f2e2ef7, ; 321: lib_UraniumUI.Material.dll.so => 79
	i64 u0x8d52a25632e81824, ; 322: Microsoft.EntityFrameworkCore.Sqlite.dll => 46
	i64 u0x8d7b8ab4b3310ead, ; 323: System.Threading => 179
	i64 u0x8da188285aadfe8e, ; 324: System.Collections.Concurrent => 121
	i64 u0x8ebba9258a550f92, ; 325: lib_Plainer.Maui.dll.so => 65
	i64 u0x8ec6e06a61c1baeb, ; 326: lib_Newtonsoft.Json.dll.so => 64
	i64 u0x8ed807bfe9858dfc, ; 327: Xamarin.AndroidX.Navigation.Common => 101
	i64 u0x8ee08b8194a30f48, ; 328: lib-hi-Microsoft.Maui.Controls.resources.dll.so => 10
	i64 u0x8ef7601039857a44, ; 329: lib-ro-Microsoft.Maui.Controls.resources.dll.so => 23
	i64 u0x8ef9414937d93a0a, ; 330: SQLitePCLRaw.core.dll => 70
	i64 u0x8f32c6f611f6ffab, ; 331: pt/Microsoft.Maui.Controls.resources.dll => 22
	i64 u0x8f8829d21c8985a4, ; 332: lib-pt-BR-Microsoft.Maui.Controls.resources.dll.so => 21
	i64 u0x8fd27d934d7b3a55, ; 333: SQLitePCLRaw.core => 70
	i64 u0x90263f8448b8f572, ; 334: lib_System.Diagnostics.TraceSource.dll.so => 134
	i64 u0x902d31dbd7d7d78e, ; 335: InputKit.Maui => 41
	i64 u0x903101b46fb73a04, ; 336: _Microsoft.Android.Resource.Designer => 34
	i64 u0x90393bd4865292f3, ; 337: lib_System.IO.Compression.dll.so => 140
	i64 u0x90634f86c5ebe2b5, ; 338: Xamarin.AndroidX.Lifecycle.ViewModel.Android => 98
	i64 u0x907b636704ad79ef, ; 339: lib_Microsoft.Maui.Controls.Xaml.dll.so => 60
	i64 u0x91418dc638b29e68, ; 340: lib_Xamarin.AndroidX.CustomView.dll.so => 92
	i64 u0x9157bd523cd7ed36, ; 341: lib_System.Text.Json.dll.so => 77
	i64 u0x91a74f07b30d37e2, ; 342: System.Linq.dll => 145
	i64 u0x91fa41a87223399f, ; 343: ca/Microsoft.Maui.Controls.resources.dll => 1
	i64 u0x937d210d0d24c5b0, ; 344: FFImageLoading.Maui.dll => 39
	i64 u0x9388aad9b7ae40ce, ; 345: lib_Xamarin.AndroidX.Lifecycle.Common.dll.so => 95
	i64 u0x93cfa73ab28d6e35, ; 346: ms/Microsoft.Maui.Controls.resources => 17
	i64 u0x944077d8ca3c6580, ; 347: System.IO.Compression.dll => 140
	i64 u0x95d757769563d0d3, ; 348: Xamarin.AndroidX.Camera.Lifecycle.dll => 85
	i64 u0x967fc325e09bfa8c, ; 349: es/Microsoft.Maui.Controls.resources => 6
	i64 u0x9732d8dbddea3d9a, ; 350: id/Microsoft.Maui.Controls.resources => 13
	i64 u0x978be80e5210d31b, ; 351: Microsoft.Maui.Graphics.dll => 63
	i64 u0x97b8c771ea3e4220, ; 352: System.ComponentModel.dll => 129
	i64 u0x97e144c9d3c6976e, ; 353: System.Collections.Concurrent.dll => 121
	i64 u0x99052c1297204af4, ; 354: lib_Xamarin.AndroidX.Camera.Core.dll.so => 84
	i64 u0x991d510397f92d9d, ; 355: System.Linq.Expressions => 143
	i64 u0x993cc632e821c001, ; 356: Microsoft.Maui.Controls.Compatibility => 58
	i64 u0x999cb19e1a04ffd3, ; 357: CommunityToolkit.Mvvm.dll => 37
	i64 u0x99a00ca5270c6878, ; 358: Xamarin.AndroidX.Navigation.Runtime => 103
	i64 u0x99cdc6d1f2d3a72f, ; 359: ko/Microsoft.Maui.Controls.resources.dll => 16
	i64 u0x9ad5de27dc51bdf6, ; 360: FFImageLoading.Maui => 39
	i64 u0x9b211a749105beac, ; 361: System.Transactions.Local => 180
	i64 u0x9d5dbcf5a48583fe, ; 362: lib_Xamarin.AndroidX.Activity.dll.so => 80
	i64 u0x9d74dee1a7725f34, ; 363: Microsoft.Extensions.Configuration.Abstractions.dll => 50
	i64 u0x9da48bf5f6df6c80, ; 364: UraniumUI.dll => 78
	i64 u0x9e4534b6adaf6e84, ; 365: nl/Microsoft.Maui.Controls.resources => 19
	i64 u0x9eaf1efdf6f7267e, ; 366: Xamarin.AndroidX.Navigation.Common.dll => 101
	i64 u0x9ef542cf1f78c506, ; 367: Xamarin.AndroidX.Lifecycle.LiveData.Core => 97
	i64 u0x9ff334e3cf272fd6, ; 368: lib_Xamarin.AndroidX.Camera.Lifecycle.dll.so => 85
	i64 u0xa0d8259f4cc284ec, ; 369: lib_System.Security.Cryptography.dll.so => 170
	i64 u0xa13763df740e071e, ; 370: store => 118
	i64 u0xa1440773ee9d341e, ; 371: Xamarin.Google.Android.Material => 110
	i64 u0xa1b9d7c27f47219f, ; 372: Xamarin.AndroidX.Navigation.UI.dll => 104
	i64 u0xa2572680829d2c7c, ; 373: System.IO.Pipelines.dll => 141
	i64 u0xa46aa1eaa214539b, ; 374: ko/Microsoft.Maui.Controls.resources => 16
	i64 u0xa4d20d2ff0563d26, ; 375: lib_CommunityToolkit.Mvvm.dll.so => 37
	i64 u0xa4edc8f2ceae241a, ; 376: System.Data.Common.dll => 131
	i64 u0xa5494f40f128ce6a, ; 377: System.Runtime.Serialization.Formatters.dll => 167
	i64 u0xa5e599d1e0524750, ; 378: System.Numerics.Vectors.dll => 155
	i64 u0xa5f1ba49b85dd355, ; 379: System.Security.Cryptography.dll => 170
	i64 u0xa6645e3d03867094, ; 380: Svg.Skia => 75
	i64 u0xa67dbee13e1df9ca, ; 381: Xamarin.AndroidX.SavedState.dll => 106
	i64 u0xa68a420042bb9b1f, ; 382: Xamarin.AndroidX.DrawerLayout.dll => 93
	i64 u0xa763fbb98df8d9fb, ; 383: lib_Microsoft.Win32.Primitives.dll.so => 120
	i64 u0xa78ce3745383236a, ; 384: Xamarin.AndroidX.Lifecycle.Common.Jvm => 96
	i64 u0xa7c31b56b4dc7b33, ; 385: hu/Microsoft.Maui.Controls.resources => 12
	i64 u0xa964304b5631e28a, ; 386: CommunityToolkit.Maui.Core.dll => 36
	i64 u0xaa2219c8e3449ff5, ; 387: Microsoft.Extensions.Logging.Abstractions => 55
	i64 u0xaa443ac34067eeef, ; 388: System.Private.Xml.dll => 159
	i64 u0xaa52de307ef5d1dd, ; 389: System.Net.Http => 147
	i64 u0xaaaf86367285a918, ; 390: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 52
	i64 u0xaaf84bb3f052a265, ; 391: el/Microsoft.Maui.Controls.resources => 5
	i64 u0xab9c1b2687d86b0b, ; 392: lib_System.Linq.Expressions.dll.so => 143
	i64 u0xac2af3fa195a15ce, ; 393: System.Runtime.Numerics => 166
	i64 u0xac5376a2a538dc10, ; 394: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 97
	i64 u0xac98d31068e24591, ; 395: System.Xml.XDocument => 184
	i64 u0xacd46e002c3ccb97, ; 396: ro/Microsoft.Maui.Controls.resources => 23
	i64 u0xacf42eea7ef9cd12, ; 397: System.Threading.Channels => 175
	i64 u0xad89c07347f1bad6, ; 398: nl/Microsoft.Maui.Controls.resources.dll => 19
	i64 u0xadbb53caf78a79d2, ; 399: System.Web.HttpUtility => 181
	i64 u0xadc90ab061a9e6e4, ; 400: System.ComponentModel.TypeConverter.dll => 128
	i64 u0xadf511667bef3595, ; 401: System.Net.Security => 152
	i64 u0xae282bcd03739de7, ; 402: Java.Interop => 188
	i64 u0xae53579c90db1107, ; 403: System.ObjectModel.dll => 156
	i64 u0xaf12fb8133ac3fbb, ; 404: Microsoft.EntityFrameworkCore.Sqlite => 46
	i64 u0xafe29f45095518e7, ; 405: lib_Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll.so => 99
	i64 u0xb05cc42cd94c6d9d, ; 406: lib-sv-Microsoft.Maui.Controls.resources.dll.so => 26
	i64 u0xb0bb43dc52ea59f9, ; 407: System.Diagnostics.Tracing.dll => 135
	i64 u0xb220631954820169, ; 408: System.Text.RegularExpressions => 174
	i64 u0xb24e06ce97f7b2bf, ; 409: Svg.Model.dll => 74
	i64 u0xb2a3f67f3bf29fce, ; 410: da/Microsoft.Maui.Controls.resources => 3
	i64 u0xb2d3ad98fce223fd, ; 411: UraniumUI.Material => 79
	i64 u0xb3f0a0fcda8d3ebc, ; 412: Xamarin.AndroidX.CardView => 87
	i64 u0xb46be1aa6d4fff93, ; 413: hi/Microsoft.Maui.Controls.resources => 10
	i64 u0xb477491be13109d8, ; 414: ar/Microsoft.Maui.Controls.resources => 0
	i64 u0xb4bd7015ecee9d86, ; 415: System.IO.Pipelines => 141
	i64 u0xb5c7fcdafbc67ee4, ; 416: Microsoft.Extensions.Logging.Abstractions.dll => 55
	i64 u0xb5ea31d5244c6626, ; 417: System.Threading.ThreadPool.dll => 178
	i64 u0xb7212c4683a94afe, ; 418: System.Drawing.Primitives => 136
	i64 u0xb7b7753d1f319409, ; 419: sv/Microsoft.Maui.Controls.resources => 26
	i64 u0xb81a2c6e0aee50fe, ; 420: lib_System.Private.CoreLib.dll.so => 187
	i64 u0xb9185c33a1643eed, ; 421: Microsoft.CSharp.dll => 119
	i64 u0xb9f64d3b230def68, ; 422: lib-pt-Microsoft.Maui.Controls.resources.dll.so => 22
	i64 u0xb9fc3c8a556e3691, ; 423: ja/Microsoft.Maui.Controls.resources => 15
	i64 u0xba4670aa94a2b3c6, ; 424: lib_System.Xml.XDocument.dll.so => 184
	i64 u0xba48785529705af9, ; 425: System.Collections.dll => 125
	i64 u0xbb65706fde942ce3, ; 426: System.Net.Sockets => 153
	i64 u0xbb6dc0b35452c1a0, ; 427: ZXing.Net.MAUI.dll => 116
	i64 u0xbbd180354b67271a, ; 428: System.Runtime.Serialization.Formatters => 167
	i64 u0xbc22a245dab70cb4, ; 429: lib_SQLitePCLRaw.provider.e_sqlite3.dll.so => 72
	i64 u0xbd0e2c0d55246576, ; 430: System.Net.Http.dll => 147
	i64 u0xbd437a2cdb333d0d, ; 431: Xamarin.AndroidX.ViewPager2 => 109
	i64 u0xbd5d0b88d3d647a5, ; 432: lib_Xamarin.AndroidX.Browser.dll.so => 83
	i64 u0xbe08e3083025c53d, ; 433: ZXing.Net.MAUI.Controls.dll => 117
	i64 u0xbe532a80075c3dc8, ; 434: Xamarin.AndroidX.Camera.Core.dll => 84
	i64 u0xbee38d4a88835966, ; 435: Xamarin.AndroidX.AppCompat.AppCompatResources => 82
	i64 u0xc040a4ab55817f58, ; 436: ar/Microsoft.Maui.Controls.resources.dll => 0
	i64 u0xc0d928351ab5ca77, ; 437: System.Console.dll => 130
	i64 u0xc12b8b3afa48329c, ; 438: lib_System.Linq.dll.so => 145
	i64 u0xc1c2cb7af77b8858, ; 439: Microsoft.EntityFrameworkCore => 43
	i64 u0xc1ff9ae3cdb6e1e6, ; 440: Xamarin.AndroidX.Activity.dll => 80
	i64 u0xc28c50f32f81cc73, ; 441: ja/Microsoft.Maui.Controls.resources.dll => 15
	i64 u0xc2bcfec99f69365e, ; 442: Xamarin.AndroidX.ViewPager2.dll => 109
	i64 u0xc3492f8f90f96ce4, ; 443: lib_Microsoft.Extensions.DependencyModel.dll.so => 53
	i64 u0xc3f0e03e56ce7b69, ; 444: zxing => 115
	i64 u0xc472ce300460ccb6, ; 445: Microsoft.EntityFrameworkCore.dll => 43
	i64 u0xc4d3858ed4d08512, ; 446: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 99
	i64 u0xc4d69851fe06342f, ; 447: lib_Microsoft.Extensions.Caching.Memory.dll.so => 48
	i64 u0xc50fded0ded1418c, ; 448: lib_System.ComponentModel.TypeConverter.dll.so => 128
	i64 u0xc519125d6bc8fb11, ; 449: lib_System.Net.Requests.dll.so => 151
	i64 u0xc5293b19e4dc230e, ; 450: Xamarin.AndroidX.Navigation.Fragment => 102
	i64 u0xc5325b2fcb37446f, ; 451: lib_System.Private.Xml.dll.so => 159
	i64 u0xc5a0f4b95a699af7, ; 452: lib_System.Private.Uri.dll.so => 157
	i64 u0xc7c01e7d7c93a110, ; 453: System.Text.Encoding.Extensions.dll => 172
	i64 u0xc7ce851898a4548e, ; 454: lib_System.Web.HttpUtility.dll.so => 181
	i64 u0xc858a28d9ee5a6c5, ; 455: lib_System.Collections.Specialized.dll.so => 124
	i64 u0xc9e54b32fc19baf3, ; 456: lib_CommunityToolkit.Maui.dll.so => 35
	i64 u0xca32340d8d54dcd5, ; 457: Microsoft.Extensions.Caching.Memory.dll => 48
	i64 u0xca3a723e7342c5b6, ; 458: lib-tr-Microsoft.Maui.Controls.resources.dll.so => 28
	i64 u0xcab3493c70141c2d, ; 459: pl/Microsoft.Maui.Controls.resources => 20
	i64 u0xcacfddc9f7c6de76, ; 460: ro/Microsoft.Maui.Controls.resources.dll => 23
	i64 u0xcb45618372c47127, ; 461: Microsoft.EntityFrameworkCore.Relational => 45
	i64 u0xcbd4fdd9cef4a294, ; 462: lib__Microsoft.Android.Resource.Designer.dll.so => 34
	i64 u0xcc2876b32ef2794c, ; 463: lib_System.Text.RegularExpressions.dll.so => 174
	i64 u0xcc5c3bb714c4561e, ; 464: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 113
	i64 u0xcc76886e09b88260, ; 465: Xamarin.KotlinX.Serialization.Core.Jvm.dll => 114
	i64 u0xccf25c4b634ccd3a, ; 466: zh-Hans/Microsoft.Maui.Controls.resources.dll => 32
	i64 u0xcd10a42808629144, ; 467: System.Net.Requests => 151
	i64 u0xcdd0c48b6937b21c, ; 468: Xamarin.AndroidX.SwipeRefreshLayout => 107
	i64 u0xcf23d8093f3ceadf, ; 469: System.Diagnostics.DiagnosticSource.dll => 132
	i64 u0xcf8fc898f98b0d34, ; 470: System.Private.Xml.Linq => 158
	i64 u0xd1194e1d8a8de83c, ; 471: lib_Xamarin.AndroidX.Lifecycle.Common.Jvm.dll.so => 96
	i64 u0xd3144156a3727ebe, ; 472: Xamarin.Google.Guava.ListenableFuture => 111
	i64 u0xd333d0af9e423810, ; 473: System.Runtime.InteropServices => 164
	i64 u0xd3426d966bb704f5, ; 474: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 82
	i64 u0xd3651b6fc3125825, ; 475: System.Private.Uri.dll => 157
	i64 u0xd373685349b1fe8b, ; 476: Microsoft.Extensions.Logging.dll => 54
	i64 u0xd3e4c8d6a2d5d470, ; 477: it/Microsoft.Maui.Controls.resources => 14
	i64 u0xd42655883bb8c19f, ; 478: Microsoft.EntityFrameworkCore.Abstractions.dll => 44
	i64 u0xd4645626dffec99d, ; 479: lib_Microsoft.Extensions.DependencyInjection.Abstractions.dll.so => 52
	i64 u0xd5507e11a2b2839f, ; 480: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 99
	i64 u0xd567f168deeeaf3c, ; 481: lib_zxing.dll.so => 115
	i64 u0xd63b432ec9306914, ; 482: zxing.dll => 115
	i64 u0xd6694f8359737e4e, ; 483: Xamarin.AndroidX.SavedState => 106
	i64 u0xd6d21782156bc35b, ; 484: Xamarin.AndroidX.SwipeRefreshLayout.dll => 107
	i64 u0xd72329819cbbbc44, ; 485: lib_Microsoft.Extensions.Configuration.Abstractions.dll.so => 50
	i64 u0xd7b3764ada9d341d, ; 486: lib_Microsoft.Extensions.Logging.Abstractions.dll.so => 55
	i64 u0xd9d04d95a2671e29, ; 487: lib_ZXing.Net.MAUI.Controls.dll.so => 117
	i64 u0xda1dfa4c534a9251, ; 488: Microsoft.Extensions.DependencyInjection => 51
	i64 u0xdad05a11827959a3, ; 489: System.Collections.NonGeneric.dll => 123
	i64 u0xdb5383ab5865c007, ; 490: lib-vi-Microsoft.Maui.Controls.resources.dll.so => 30
	i64 u0xdb58816721c02a59, ; 491: lib_System.Reflection.Emit.ILGeneration.dll.so => 160
	i64 u0xdbeda89f832aa805, ; 492: vi/Microsoft.Maui.Controls.resources.dll => 30
	i64 u0xdbf2a779fbc3ac31, ; 493: System.Transactions.Local.dll => 180
	i64 u0xdbf9607a441b4505, ; 494: System.Linq => 145
	i64 u0xdc75032002d1a212, ; 495: lib_System.Transactions.Local.dll.so => 180
	i64 u0xdca8be7403f92d4f, ; 496: lib_System.Linq.Queryable.dll.so => 144
	i64 u0xdce2c53525640bf3, ; 497: Microsoft.Extensions.Logging => 54
	i64 u0xdd2b722d78ef5f43, ; 498: System.Runtime.dll => 169
	i64 u0xdd67031857c72f96, ; 499: lib_System.Text.Encodings.Web.dll.so => 173
	i64 u0xdde30e6b77aa6f6c, ; 500: lib-zh-Hans-Microsoft.Maui.Controls.resources.dll.so => 32
	i64 u0xddf8227337aa0462, ; 501: SkiaSharp.HarfBuzz => 68
	i64 u0xde110ae80fa7c2e2, ; 502: System.Xml.XDocument.dll => 184
	i64 u0xde8769ebda7d8647, ; 503: hr/Microsoft.Maui.Controls.resources.dll => 11
	i64 u0xe0142572c095a480, ; 504: Xamarin.AndroidX.AppCompat.dll => 81
	i64 u0xe02f89350ec78051, ; 505: Xamarin.AndroidX.CoordinatorLayout.dll => 89
	i64 u0xe192a588d4410686, ; 506: lib_System.IO.Pipelines.dll.so => 141
	i64 u0xe1a08bd3fa539e0d, ; 507: System.Runtime.Loader => 165
	i64 u0xe1b52f9f816c70ef, ; 508: System.Private.Xml.Linq.dll => 158
	i64 u0xe1ecfdb7fff86067, ; 509: System.Net.Security.dll => 152
	i64 u0xe2420585aeceb728, ; 510: System.Net.Requests.dll => 151
	i64 u0xe29b73bc11392966, ; 511: lib-id-Microsoft.Maui.Controls.resources.dll.so => 13
	i64 u0xe2e426c7714fa0bc, ; 512: Microsoft.Win32.Primitives.dll => 120
	i64 u0xe3811d68d4fe8463, ; 513: pt-BR/Microsoft.Maui.Controls.resources.dll => 21
	i64 u0xe494f7ced4ecd10a, ; 514: hu/Microsoft.Maui.Controls.resources.dll => 12
	i64 u0xe4a9b1e40d1e8917, ; 515: lib-fi-Microsoft.Maui.Controls.resources.dll.so => 7
	i64 u0xe4f74a0b5bf9703f, ; 516: System.Runtime.Serialization.Primitives => 168
	i64 u0xe5434e8a119ceb69, ; 517: lib_Mono.Android.dll.so => 190
	i64 u0xe89a2a9ef110899b, ; 518: System.Drawing.dll => 137
	i64 u0xe93e919ce2b08636, ; 519: lib_ExCSS.dll.so => 38
	i64 u0xeae68e81c894c13d, ; 520: UraniumUI.Material.dll => 79
	i64 u0xedc4817167106c23, ; 521: System.Net.Sockets.dll => 153
	i64 u0xedc632067fb20ff3, ; 522: System.Memory.dll => 146
	i64 u0xedc8e4ca71a02a8b, ; 523: Xamarin.AndroidX.Navigation.Runtime.dll => 103
	i64 u0xee81f5b3f1c4f83b, ; 524: System.Threading.ThreadPool => 178
	i64 u0xeeb7ebb80150501b, ; 525: lib_Xamarin.AndroidX.Collection.Jvm.dll.so => 88
	i64 u0xef03b1b5a04e9709, ; 526: System.Text.Encoding.CodePages.dll => 171
	i64 u0xef602c523fe2e87a, ; 527: lib_Xamarin.Google.Guava.ListenableFuture.dll.so => 111
	i64 u0xef72742e1bcca27a, ; 528: Microsoft.Maui.Essentials.dll => 62
	i64 u0xefec0b7fdc57ec42, ; 529: Xamarin.AndroidX.Activity => 80
	i64 u0xf00c29406ea45e19, ; 530: es/Microsoft.Maui.Controls.resources.dll => 6
	i64 u0xf09e47b6ae914f6e, ; 531: System.Net.NameResolution => 148
	i64 u0xf0de2537ee19c6ca, ; 532: lib_System.Net.WebHeaderCollection.dll.so => 154
	i64 u0xf11b621fc87b983f, ; 533: Microsoft.Maui.Controls.Xaml.dll => 60
	i64 u0xf1c4b4005493d871, ; 534: System.Formats.Asn1.dll => 138
	i64 u0xf238bd79489d3a96, ; 535: lib-nl-Microsoft.Maui.Controls.resources.dll.so => 19
	i64 u0xf37221fda4ef8830, ; 536: lib_Xamarin.Google.Android.Material.dll.so => 110
	i64 u0xf3ddfe05336abf29, ; 537: System => 185
	i64 u0xf408654b2a135055, ; 538: System.Reflection.Emit.ILGeneration.dll => 160
	i64 u0xf4103170a1de5bd0, ; 539: System.Linq.Queryable.dll => 144
	i64 u0xf4727d423e5d26f3, ; 540: SkiaSharp => 67
	i64 u0xf4c1dd70a5496a17, ; 541: System.IO.Compression => 140
	i64 u0xf5fc7602fe27b333, ; 542: System.Net.WebHeaderCollection => 154
	i64 u0xf6077741019d7428, ; 543: Xamarin.AndroidX.CoordinatorLayout => 89
	i64 u0xf77b20923f07c667, ; 544: de/Microsoft.Maui.Controls.resources.dll => 4
	i64 u0xf7e2cac4c45067b3, ; 545: lib_System.Numerics.Vectors.dll.so => 155
	i64 u0xf7e74930e0e3d214, ; 546: zh-HK/Microsoft.Maui.Controls.resources.dll => 31
	i64 u0xf7fa0bf77fe677cc, ; 547: Newtonsoft.Json.dll => 64
	i64 u0xf84773b5c81e3cef, ; 548: lib-uk-Microsoft.Maui.Controls.resources.dll.so => 29
	i64 u0xf8aac5ea82de1348, ; 549: System.Linq.Queryable => 144
	i64 u0xf8abd63acd77d37b, ; 550: Xamarin.AndroidX.Camera.View => 86
	i64 u0xf8b77539b362d3ba, ; 551: lib_System.Reflection.Primitives.dll.so => 162
	i64 u0xf8e045dc345b2ea3, ; 552: lib_Xamarin.AndroidX.RecyclerView.dll.so => 105
	i64 u0xf915dc29808193a1, ; 553: System.Web.HttpUtility.dll => 181
	i64 u0xf96c777a2a0686f4, ; 554: hi/Microsoft.Maui.Controls.resources.dll => 10
	i64 u0xf9eec5bb3a6aedc6, ; 555: Microsoft.Extensions.Options => 56
	i64 u0xfa3f278f288b0e84, ; 556: lib_System.Net.Security.dll.so => 152
	i64 u0xfa5ed7226d978949, ; 557: lib-ar-Microsoft.Maui.Controls.resources.dll.so => 0
	i64 u0xfa645d91e9fc4cba, ; 558: System.Threading.Thread => 177
	i64 u0xfb022853d73b7fa5, ; 559: lib_SQLitePCLRaw.batteries_v2.dll.so => 69
	i64 u0xfbf0a31c9fc34bc4, ; 560: lib_System.Net.Http.dll.so => 147
	i64 u0xfc0ee5ac47a00750, ; 561: ExCSS => 38
	i64 u0xfc6b7527cc280b3f, ; 562: lib_System.Runtime.Serialization.Formatters.dll.so => 167
	i64 u0xfc719aec26adf9d9, ; 563: Xamarin.AndroidX.Navigation.Fragment.dll => 102
	i64 u0xfcd5b90cf101e36b, ; 564: System.Data.SqlClient.dll => 76
	i64 u0xfd22f00870e40ae0, ; 565: lib_Xamarin.AndroidX.DrawerLayout.dll.so => 93
	i64 u0xfd49b3c1a76e2748, ; 566: System.Runtime.InteropServices.RuntimeInformation => 163
	i64 u0xfd536c702f64dc47, ; 567: System.Text.Encoding.Extensions => 172
	i64 u0xfd583f7657b6a1cb, ; 568: Xamarin.AndroidX.Fragment => 94
	i64 u0xfdbe4710aa9beeff, ; 569: CommunityToolkit.Maui => 35
	i64 u0xfddbe9695626a7f5, ; 570: Xamarin.AndroidX.Lifecycle.Common => 95
	i64 u0xfeae9952cf03b8cb, ; 571: tr/Microsoft.Maui.Controls.resources => 28
	i64 u0xfeca84fe7f34860b ; 572: HarfBuzzSharp.dll => 40
], align 8

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [573 x i32] [
	i32 107, i32 126, i32 116, i32 103, i32 36, i32 48, i32 189, i32 81,
	i32 72, i32 24, i32 2, i32 30, i32 150, i32 105, i32 42, i32 125,
	i32 61, i32 75, i32 42, i32 40, i32 31, i32 182, i32 88, i32 24,
	i32 123, i32 162, i32 93, i32 126, i32 56, i32 123, i32 170, i32 68,
	i32 47, i32 175, i32 25, i32 114, i32 108, i32 21, i32 85, i32 190,
	i32 62, i32 66, i32 74, i32 148, i32 92, i32 139, i32 161, i32 105,
	i32 83, i32 8, i32 188, i32 9, i32 52, i32 120, i32 53, i32 142,
	i32 186, i32 12, i32 173, i32 114, i32 18, i32 86, i32 78, i32 121,
	i32 185, i32 27, i32 189, i32 58, i32 104, i32 16, i32 176, i32 56,
	i32 139, i32 133, i32 169, i32 160, i32 27, i32 142, i32 177, i32 43,
	i32 130, i32 90, i32 168, i32 8, i32 69, i32 112, i32 57, i32 84,
	i32 13, i32 11, i32 188, i32 150, i32 67, i32 29, i32 149, i32 68,
	i32 134, i32 7, i32 174, i32 138, i32 33, i32 20, i32 171, i32 161,
	i32 158, i32 179, i32 26, i32 77, i32 5, i32 133, i32 183, i32 135,
	i32 47, i32 94, i32 34, i32 87, i32 136, i32 8, i32 183, i32 122,
	i32 6, i32 153, i32 41, i32 61, i32 2, i32 59, i32 126, i32 109,
	i32 49, i32 66, i32 161, i32 78, i32 162, i32 122, i32 92, i32 148,
	i32 108, i32 1, i32 64, i32 118, i32 172, i32 112, i32 83, i32 117,
	i32 76, i32 111, i32 178, i32 182, i32 90, i32 69, i32 101, i32 82,
	i32 186, i32 190, i32 118, i32 20, i32 119, i32 168, i32 112, i32 44,
	i32 73, i32 134, i32 73, i32 53, i32 24, i32 182, i32 22, i32 156,
	i32 104, i32 77, i32 45, i32 100, i32 149, i32 75, i32 143, i32 159,
	i32 41, i32 165, i32 58, i32 14, i32 100, i32 189, i32 171, i32 175,
	i32 1, i32 71, i32 59, i32 37, i32 98, i32 137, i32 150, i32 131,
	i32 90, i32 63, i32 25, i32 149, i32 163, i32 31, i32 169, i32 95,
	i32 96, i32 124, i32 157, i32 70, i32 187, i32 132, i32 15, i32 51,
	i32 119, i32 89, i32 179, i32 129, i32 39, i32 3, i32 66, i32 76,
	i32 54, i32 154, i32 116, i32 176, i32 164, i32 88, i32 124, i32 173,
	i32 127, i32 183, i32 38, i32 131, i32 71, i32 5, i32 51, i32 113,
	i32 146, i32 60, i32 4, i32 165, i32 187, i32 122, i32 110, i32 35,
	i32 59, i32 166, i32 130, i32 98, i32 91, i32 3, i32 136, i32 138,
	i32 9, i32 71, i32 164, i32 18, i32 63, i32 57, i32 91, i32 57,
	i32 102, i32 61, i32 2, i32 65, i32 28, i32 18, i32 14, i32 127,
	i32 11, i32 146, i32 46, i32 49, i32 106, i32 166, i32 17, i32 27,
	i32 94, i32 7, i32 42, i32 128, i32 25, i32 4, i32 36, i32 17,
	i32 155, i32 125, i32 135, i32 156, i32 129, i32 108, i32 50, i32 97,
	i32 72, i32 185, i32 33, i32 81, i32 87, i32 137, i32 29, i32 32,
	i32 86, i32 176, i32 142, i32 45, i32 67, i32 73, i32 33, i32 49,
	i32 74, i32 44, i32 177, i32 139, i32 40, i32 62, i32 113, i32 186,
	i32 65, i32 127, i32 163, i32 47, i32 100, i32 132, i32 133, i32 9,
	i32 91, i32 79, i32 46, i32 179, i32 121, i32 65, i32 64, i32 101,
	i32 10, i32 23, i32 70, i32 22, i32 21, i32 70, i32 134, i32 41,
	i32 34, i32 140, i32 98, i32 60, i32 92, i32 77, i32 145, i32 1,
	i32 39, i32 95, i32 17, i32 140, i32 85, i32 6, i32 13, i32 63,
	i32 129, i32 121, i32 84, i32 143, i32 58, i32 37, i32 103, i32 16,
	i32 39, i32 180, i32 80, i32 50, i32 78, i32 19, i32 101, i32 97,
	i32 85, i32 170, i32 118, i32 110, i32 104, i32 141, i32 16, i32 37,
	i32 131, i32 167, i32 155, i32 170, i32 75, i32 106, i32 93, i32 120,
	i32 96, i32 12, i32 36, i32 55, i32 159, i32 147, i32 52, i32 5,
	i32 143, i32 166, i32 97, i32 184, i32 23, i32 175, i32 19, i32 181,
	i32 128, i32 152, i32 188, i32 156, i32 46, i32 99, i32 26, i32 135,
	i32 174, i32 74, i32 3, i32 79, i32 87, i32 10, i32 0, i32 141,
	i32 55, i32 178, i32 136, i32 26, i32 187, i32 119, i32 22, i32 15,
	i32 184, i32 125, i32 153, i32 116, i32 167, i32 72, i32 147, i32 109,
	i32 83, i32 117, i32 84, i32 82, i32 0, i32 130, i32 145, i32 43,
	i32 80, i32 15, i32 109, i32 53, i32 115, i32 43, i32 99, i32 48,
	i32 128, i32 151, i32 102, i32 159, i32 157, i32 172, i32 181, i32 124,
	i32 35, i32 48, i32 28, i32 20, i32 23, i32 45, i32 34, i32 174,
	i32 113, i32 114, i32 32, i32 151, i32 107, i32 132, i32 158, i32 96,
	i32 111, i32 164, i32 82, i32 157, i32 54, i32 14, i32 44, i32 52,
	i32 99, i32 115, i32 115, i32 106, i32 107, i32 50, i32 55, i32 117,
	i32 51, i32 123, i32 30, i32 160, i32 30, i32 180, i32 145, i32 180,
	i32 144, i32 54, i32 169, i32 173, i32 32, i32 68, i32 184, i32 11,
	i32 81, i32 89, i32 141, i32 165, i32 158, i32 152, i32 151, i32 13,
	i32 120, i32 21, i32 12, i32 7, i32 168, i32 190, i32 137, i32 38,
	i32 79, i32 153, i32 146, i32 103, i32 178, i32 88, i32 171, i32 111,
	i32 62, i32 80, i32 6, i32 148, i32 154, i32 60, i32 138, i32 19,
	i32 110, i32 185, i32 160, i32 144, i32 67, i32 140, i32 154, i32 89,
	i32 4, i32 155, i32 31, i32 64, i32 29, i32 144, i32 86, i32 162,
	i32 105, i32 181, i32 10, i32 56, i32 152, i32 0, i32 177, i32 69,
	i32 147, i32 38, i32 167, i32 102, i32 76, i32 93, i32 163, i32 172,
	i32 94, i32 35, i32 95, i32 28, i32 40
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 u0x0000000000000000, ; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

; Functions

; Function attributes: memory(write, argmem: none, inaccessiblemem: none) "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { memory(write, argmem: none, inaccessiblemem: none) "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" }

; Metadata
!llvm.module.flags = !{!0, !1, !7, !8, !9, !10}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!".NET for Android remotes/origin/release/9.0.1xx @ 4b20432d95ea8965a41cc73997e459d7fa561233"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"branch-target-enforcement", i32 0}
!8 = !{i32 1, !"sign-return-address", i32 0}
!9 = !{i32 1, !"sign-return-address-all", i32 0}
!10 = !{i32 1, !"sign-return-address-with-bkey", i32 0}
