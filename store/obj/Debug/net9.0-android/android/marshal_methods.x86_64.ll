; ModuleID = 'marshal_methods.x86_64.ll'
source_filename = "marshal_methods.x86_64.ll"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [459 x ptr] zeroinitializer, align 16

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [1377 x i64] [
	i64 u0x0010bf7088f76c5f, ; 0: Google.Cloud.Firestore.V1 => 194
	i64 u0x001e58127c546039, ; 1: lib_System.Globalization.dll.so => 42
	i64 u0x0024d0f62dee05bd, ; 2: Xamarin.KotlinX.Coroutines.Core.dll => 390
	i64 u0x004df92dbfbd34f0, ; 3: lib_NetTopologySuite.dll.so => 258
	i64 u0x006b9d7c1c7e1c42, ; 4: de/Microsoft.Data.SqlClient.resources => 399
	i64 u0x0071cf2d27b7d61e, ; 5: lib_Xamarin.AndroidX.SwipeRefreshLayout.dll.so => 357
	i64 u0x00c57621600ce92e, ; 6: Microsoft.SqlServer.Types.dll => 257
	i64 u0x01109b0e4d99e61f, ; 7: System.ComponentModel.Annotations.dll => 13
	i64 u0x01af0bd6467d518e, ; 8: lib_ZXing.Net.MAUI.dll.so => 396
	i64 u0x020f428300334897, ; 9: Grpc.Net.Client.dll => 201
	i64 u0x02123411c4e01926, ; 10: lib_Xamarin.AndroidX.Navigation.Runtime.dll.so => 346
	i64 u0x022e81ea9c46e03a, ; 11: lib_CommunityToolkit.Maui.Core.dll.so => 178
	i64 u0x02827b47e97f2378, ; 12: System.Security.Cryptography.Pkcs.dll => 283
	i64 u0x0284512fad379f7e, ; 13: System.Runtime.Handles => 105
	i64 u0x029b2c18aaa0996c, ; 14: lib-ko-Microsoft.Data.SqlClient.resources.dll.so => 404
	i64 u0x02a4c5a44384f885, ; 15: Microsoft.Extensions.Caching.Memory => 231
	i64 u0x02abedc11addc1ed, ; 16: lib_Mono.Android.Runtime.dll.so => 171
	i64 u0x02f55bf70672f5c8, ; 17: lib_System.IO.FileSystem.DriveInfo.dll.so => 48
	i64 u0x032267b2a94db371, ; 18: lib_Xamarin.AndroidX.AppCompat.dll.so => 296
	i64 u0x03621c804933a890, ; 19: System.Buffers => 7
	i64 u0x0363ac97a4cb84e6, ; 20: SQLitePCLRaw.provider.e_sqlite3.dll => 271
	i64 u0x0399610510a38a38, ; 21: lib_System.Private.DataContractSerialization.dll.so => 86
	i64 u0x043032f1d071fae0, ; 22: ru/Microsoft.Maui.Controls.resources => 435
	i64 u0x044440a55165631e, ; 23: lib-cs-Microsoft.Maui.Controls.resources.dll.so => 413
	i64 u0x046eb1581a80c6b0, ; 24: vi/Microsoft.Maui.Controls.resources => 441
	i64 u0x0470607fd33c32db, ; 25: Microsoft.IdentityModel.Abstractions.dll => 244
	i64 u0x047408741db2431a, ; 26: Xamarin.AndroidX.DynamicAnimation => 320
	i64 u0x0517ef04e06e9f76, ; 27: System.Net.Primitives => 71
	i64 u0x051a3be159e4ef99, ; 28: Xamarin.GooglePlayServices.Tasks => 381
	i64 u0x0531da14b48c1e10, ; 29: ja/Microsoft.SqlServer.Types.resources.dll => 449
	i64 u0x0565d18c6da3de38, ; 30: Xamarin.AndroidX.RecyclerView => 350
	i64 u0x057bf9fa9fb09f7c, ; 31: Microsoft.Data.Sqlite.dll => 221
	i64 u0x0581db89237110e9, ; 32: lib_System.Collections.dll.so => 12
	i64 u0x05989cb940b225a9, ; 33: Microsoft.Maui.dll => 253
	i64 u0x05a1c25e78e22d87, ; 34: lib_System.Runtime.CompilerServices.Unsafe.dll.so => 102
	i64 u0x05c6334bc4836f1a, ; 35: Microsoft.SqlServer.Types => 257
	i64 u0x05d8ca8ee551619f, ; 36: zh-Hant/Microsoft.Data.SqlClient.resources => 410
	i64 u0x05ef98b6a1db882c, ; 37: lib_Microsoft.Data.Sqlite.dll.so => 221
	i64 u0x06073ed944b92dc4, ; 38: lib-tr-Microsoft.Data.SqlClient.resources.dll.so => 408
	i64 u0x06076b5d2b581f08, ; 39: zh-HK/Microsoft.Maui.Controls.resources => 442
	i64 u0x06388ffe9f6c161a, ; 40: System.Xml.Linq.dll => 156
	i64 u0x06600c4c124cb358, ; 41: System.Configuration.dll => 19
	i64 u0x067f95c5ddab55b3, ; 42: lib_Xamarin.AndroidX.Fragment.Ktx.dll.so => 325
	i64 u0x0680a433c781bb3d, ; 43: Xamarin.AndroidX.Collection.Jvm => 307
	i64 u0x069fff96ec92a91d, ; 44: System.Xml.XPath.dll => 161
	i64 u0x070b0847e18dab68, ; 45: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 322
	i64 u0x0739448d84d3b016, ; 46: lib_Xamarin.AndroidX.VectorDrawable.dll.so => 360
	i64 u0x07469f2eecce9e85, ; 47: mscorlib.dll => 167
	i64 u0x07c57877c7ba78ad, ; 48: ru/Microsoft.Maui.Controls.resources.dll => 435
	i64 u0x07dcdc7460a0c5e4, ; 49: System.Collections.NonGeneric => 10
	i64 u0x08015600dcbf6dc7, ; 50: it/Microsoft.Data.SqlClient.resources.dll => 402
	i64 u0x08122e52765333c8, ; 51: lib_Microsoft.Extensions.Logging.Debug.dll.so => 239
	i64 u0x088610fc2509f69e, ; 52: lib_Xamarin.AndroidX.VectorDrawable.Animated.dll.so => 361
	i64 u0x08881a0a9768df86, ; 53: lib_Azure.Core.dll.so => 174
	i64 u0x08a7c865576bbde7, ; 54: System.Reflection.Primitives => 96
	i64 u0x08c9d051a4a817e5, ; 55: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 317
	i64 u0x08d348803591587f, ; 56: lib-zh-Hant-Microsoft.SqlServer.Types.resources.dll.so => 454
	i64 u0x08f3c9788ee2153c, ; 57: Xamarin.AndroidX.DrawerLayout => 319
	i64 u0x090a04c5180cf016, ; 58: itext.styledxmlparser => 213
	i64 u0x09138715c92dba90, ; 59: lib_System.ComponentModel.Annotations.dll.so => 13
	i64 u0x0919c28b89381a0b, ; 60: lib_Microsoft.Extensions.Options.dll.so => 240
	i64 u0x092266563089ae3e, ; 61: lib_System.Collections.NonGeneric.dll.so => 10
	i64 u0x095cacaf6b6a32e4, ; 62: System.Memory.Data => 282
	i64 u0x098b50f911ccea8d, ; 63: lib_Xamarin.GooglePlayServices.Basement.dll.so => 380
	i64 u0x09d144a7e214d457, ; 64: System.Security.Cryptography => 127
	i64 u0x09da6dfc3439e851, ; 65: lib_Xamarin.Firebase.Components.dll.so => 370
	i64 u0x09e2b9f743db21a8, ; 66: lib_System.Reflection.Metadata.dll.so => 95
	i64 u0x0a805f95d98f597b, ; 67: lib_Microsoft.Extensions.Caching.Abstractions.dll.so => 230
	i64 u0x0abb3e2b271edc45, ; 68: System.Threading.Channels.dll => 140
	i64 u0x0adeb6c0f5699d33, ; 69: Microsoft.Data.SqlClient.dll => 220
	i64 u0x0af14ac472d816c7, ; 70: EFCore.BulkExtensions.Sqlite.dll => 183
	i64 u0x0b06b1feab070143, ; 71: System.Formats.Tar => 39
	i64 u0x0b3b632c3bbee20c, ; 72: sk/Microsoft.Maui.Controls.resources => 436
	i64 u0x0b6aff547b84fbe9, ; 73: Xamarin.KotlinX.Serialization.Core.Jvm => 394
	i64 u0x0be2e1f8ce4064ed, ; 74: Xamarin.AndroidX.ViewPager => 363
	i64 u0x0c279376b1ae96ae, ; 75: lib_System.CodeDom.dll.so => 273
	i64 u0x0c3ca6cc978e2aae, ; 76: pt-BR/Microsoft.Maui.Controls.resources => 432
	i64 u0x0c3d7adcdb333bf0, ; 77: Xamarin.AndroidX.Camera.Lifecycle => 303
	i64 u0x0c59ad9fbbd43abe, ; 78: Mono.Android => 172
	i64 u0x0c65741e86371ee3, ; 79: lib_Xamarin.Android.Glide.GifDecoder.dll.so => 290
	i64 u0x0c6924c4d04dd909, ; 80: lib_System.DirectoryServices.Protocols.dll.so => 278
	i64 u0x0c74af560004e816, ; 81: Microsoft.Win32.Registry.dll => 5
	i64 u0x0c7790f60165fc06, ; 82: lib_Microsoft.Maui.Essentials.dll.so => 254
	i64 u0x0c83c82812e96127, ; 83: lib_System.Net.Mail.dll.so => 67
	i64 u0x0cce4bce83380b7f, ; 84: Xamarin.AndroidX.Security.SecurityCrypto => 354
	i64 u0x0d13cd7cce4284e4, ; 85: System.Security.SecureString => 130
	i64 u0x0d3b5ab8b2766190, ; 86: lib_Microsoft.Bcl.AsyncInterfaces.dll.so => 218
	i64 u0x0d565cb22b8879da, ; 87: lib_Grpc.Core.Api.dll.so => 200
	i64 u0x0d573c83ae0263d7, ; 88: EFCore.BulkExtensions.Oracle.dll => 181
	i64 u0x0d63f4f73521c24f, ; 89: lib_Xamarin.AndroidX.SavedState.SavedState.Ktx.dll.so => 353
	i64 u0x0e04e702012f8463, ; 90: Xamarin.AndroidX.Emoji2 => 321
	i64 u0x0e14e73a54dda68e, ; 91: lib_System.Net.NameResolution.dll.so => 68
	i64 u0x0e5f1ca7132adebb, ; 92: Xamarin.Firebase.Installations.dll => 371
	i64 u0x0f37dd7a62ae99af, ; 93: lib_Xamarin.AndroidX.Collection.Ktx.dll.so => 308
	i64 u0x0f5e7abaa7cf470a, ; 94: System.Net.HttpListener => 66
	i64 u0x0fbe06392ef90569, ; 95: lib-ja-Microsoft.Data.SqlClient.resources.dll.so => 403
	i64 u0x1001f97bbe242e64, ; 96: System.IO.UnmanagedMemoryStream => 57
	i64 u0x102861e4055f511a, ; 97: Microsoft.Bcl.AsyncInterfaces.dll => 218
	i64 u0x102a31b45304b1da, ; 98: Xamarin.AndroidX.CustomView => 316
	i64 u0x1065c4cb554c3d75, ; 99: System.IO.IsolatedStorage.dll => 52
	i64 u0x108cf0e0ba098a51, ; 100: es/Microsoft.Data.SqlClient.resources => 400
	i64 u0x10f6cfcbcf801616, ; 101: System.IO.Compression.Brotli => 43
	i64 u0x114443cdcf2091f1, ; 102: System.Security.Cryptography.Primitives => 125
	i64 u0x115c94fcc3878c6a, ; 103: it/Microsoft.SqlServer.Types.resources => 448
	i64 u0x118d570f508803d1, ; 104: Xamarin.AndroidX.Camera.Camera2.dll => 301
	i64 u0x11a603952763e1d4, ; 105: System.Net.Mail => 67
	i64 u0x11a70d0e1009fb11, ; 106: System.Net.WebSockets.dll => 81
	i64 u0x11f26371eee0d3c1, ; 107: lib_Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll.so => 336
	i64 u0x11fbe62d469cc1c8, ; 108: Microsoft.VisualStudio.DesignTools.TapContract.dll => 457
	i64 u0x12128b3f59302d47, ; 109: lib_System.Xml.Serialization.dll.so => 158
	i64 u0x123639456fb056da, ; 110: System.Reflection.Emit.Lightweight.dll => 92
	i64 u0x124b1cd9ce23ae6f, ; 111: Google.Api.Gax.Rest => 189
	i64 u0x12521e9764603eaa, ; 112: lib_System.Resources.Reader.dll.so => 99
	i64 u0x125b7f94acb989db, ; 113: Xamarin.AndroidX.RecyclerView.dll => 350
	i64 u0x126ee4b0de53cbfd, ; 114: Microsoft.IdentityModel.Protocols.OpenIdConnect.dll => 248
	i64 u0x12d3b63863d4ab0b, ; 115: lib_System.Threading.Overlapped.dll.so => 141
	i64 u0x12f23aabd624cf79, ; 116: lib_Google.Cloud.Firestore.V1.dll.so => 194
	i64 u0x134eab1061c395ee, ; 117: System.Transactions => 151
	i64 u0x138567fa954faa55, ; 118: Xamarin.AndroidX.Browser => 300
	i64 u0x13a01de0cbc3f06c, ; 119: lib-fr-Microsoft.Maui.Controls.resources.dll.so => 419
	i64 u0x13beedefb0e28a45, ; 120: lib_System.Xml.XmlDocument.dll.so => 162
	i64 u0x13f1e5e209e91af4, ; 121: lib_Java.Interop.dll.so => 169
	i64 u0x13f1e880c25d96d1, ; 122: he/Microsoft.Maui.Controls.resources => 420
	i64 u0x1403071365bcd83a, ; 123: Xamarin.Firebase.Annotations => 367
	i64 u0x143a1f6e62b82b56, ; 124: Microsoft.IdentityModel.Protocols.OpenIdConnect => 248
	i64 u0x143d8ea60a6a4011, ; 125: Microsoft.Extensions.DependencyInjection.Abstractions => 235
	i64 u0x1486e3d77f17a017, ; 126: lib_EFCore.BulkExtensions.PostgreSql.dll.so => 182
	i64 u0x1497051b917530bd, ; 127: lib_System.Net.WebSockets.dll.so => 81
	i64 u0x14b0660e629937d5, ; 128: itext.pdfua => 211
	i64 u0x14b78ce3adce0011, ; 129: Microsoft.VisualStudio.DesignTools.TapContract => 457
	i64 u0x14e68447938213b7, ; 130: Xamarin.AndroidX.Collection.Ktx.dll => 308
	i64 u0x152a448bd1e745a7, ; 131: Microsoft.Win32.Primitives => 4
	i64 u0x1557de0138c445f4, ; 132: lib_Microsoft.Win32.Registry.dll.so => 5
	i64 u0x159cc6c81072f00e, ; 133: lib_System.Diagnostics.EventLog.dll.so => 276
	i64 u0x15bdc156ed462f2f, ; 134: lib_System.IO.FileSystem.dll.so => 51
	i64 u0x15e300c2c1668655, ; 135: System.Resources.Writer.dll => 101
	i64 u0x16054fdcb6b3098b, ; 136: Microsoft.Extensions.DependencyModel.dll => 236
	i64 u0x162be8a76b00cd97, ; 137: lib-de-Microsoft.Data.SqlClient.resources.dll.so => 399
	i64 u0x16bf2a22df043a09, ; 138: System.IO.Pipes.dll => 56
	i64 u0x16ea2b318ad2d830, ; 139: System.Security.Cryptography.Algorithms => 120
	i64 u0x16eeae54c7ebcc08, ; 140: System.Reflection.dll => 98
	i64 u0x17125c9a85b4929f, ; 141: lib_netstandard.dll.so => 168
	i64 u0x1716866f7416792e, ; 142: lib_System.Security.AccessControl.dll.so => 118
	i64 u0x174f71c46216e44a, ; 143: Xamarin.KotlinX.Coroutines.Core => 390
	i64 u0x1752c12f1e1fc00c, ; 144: System.Core => 21
	i64 u0x1791d47293d97a1b, ; 145: lib_Npgsql.EntityFrameworkCore.PostgreSQL.dll.so => 263
	i64 u0x17b56e25558a5d36, ; 146: lib-hu-Microsoft.Maui.Controls.resources.dll.so => 423
	i64 u0x17f9358913beb16a, ; 147: System.Text.Encodings.Web => 137
	i64 u0x1809fb23f29ba44a, ; 148: lib_System.Reflection.TypeExtensions.dll.so => 97
	i64 u0x18402a709e357f3b, ; 149: lib_Xamarin.KotlinX.Serialization.Core.Jvm.dll.so => 394
	i64 u0x18a9befae51bb361, ; 150: System.Net.WebClient => 77
	i64 u0x18f0ce884e87d89a, ; 151: nb/Microsoft.Maui.Controls.resources.dll => 429
	i64 u0x193d7a04b7eda8bc, ; 152: lib_Xamarin.AndroidX.Print.dll.so => 348
	i64 u0x19777fba3c41b398, ; 153: Xamarin.AndroidX.Startup.StartupRuntime.dll => 356
	i64 u0x19a4c090f14ebb66, ; 154: System.Security.Claims => 119
	i64 u0x19cc755c2ef2727f, ; 155: itext.bouncy-castle-adapter.dll => 215
	i64 u0x1a040febb58bf51e, ; 156: lib_Xamarin.AndroidX.Camera.View.dll.so => 304
	i64 u0x1a21ad8fb8814a23, ; 157: lib_UraniumUI.dll.so => 285
	i64 u0x1a539258f88190d6, ; 158: lib_System.Linq.Async.dll.so => 280
	i64 u0x1a6fceea64859810, ; 159: Azure.Identity => 175
	i64 u0x1a91866a319e9259, ; 160: lib_System.Collections.Concurrent.dll.so => 8
	i64 u0x1aac34d1917ba5d3, ; 161: lib_System.dll.so => 165
	i64 u0x1aad60783ffa3e5b, ; 162: lib-th-Microsoft.Maui.Controls.resources.dll.so => 438
	i64 u0x1ad25954979b4239, ; 163: de/Microsoft.SqlServer.Types.resources => 445
	i64 u0x1aea8f1c3b282172, ; 164: lib_System.Net.Ping.dll.so => 70
	i64 u0x1b4b7a1d0d265fa2, ; 165: Xamarin.Android.Glide.DiskLruCache => 289
	i64 u0x1bbdb16cfa73e785, ; 166: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.Android => 337
	i64 u0x1bc766e07b2b4241, ; 167: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 351
	i64 u0x1c753b5ff15bce1b, ; 168: Mono.Android.Runtime.dll => 171
	i64 u0x1cb6a0ededc839e2, ; 169: lib_Google.Apis.Auth.dll.so => 191
	i64 u0x1cd47467799d8250, ; 170: System.Threading.Tasks.dll => 145
	i64 u0x1d23eafdc6dc346c, ; 171: System.Globalization.Calendars.dll => 40
	i64 u0x1d36e5f6bd20345e, ; 172: de/Microsoft.SqlServer.Types.resources.dll => 445
	i64 u0x1d4c109ca6e27ed8, ; 173: lib_Microsoft.Maui.Controls.Compatibility.dll.so => 250
	i64 u0x1da4110562816681, ; 174: Xamarin.AndroidX.Security.SecurityCrypto.dll => 354
	i64 u0x1db6820994506bf5, ; 175: System.IO.FileSystem.AccessControl.dll => 47
	i64 u0x1dba6509cc55b56f, ; 176: lib_Google.Protobuf.dll.so => 197
	i64 u0x1dbb0c2c6a999acb, ; 177: System.Diagnostics.StackTrace => 30
	i64 u0x1e3d87657e9659bc, ; 178: Xamarin.AndroidX.Navigation.UI => 347
	i64 u0x1e71143913d56c10, ; 179: lib-ko-Microsoft.Maui.Controls.resources.dll.so => 427
	i64 u0x1e7c31185e2fb266, ; 180: lib_System.Threading.Tasks.Parallel.dll.so => 144
	i64 u0x1ed8fcce5e9b50a0, ; 181: Microsoft.Extensions.Options.dll => 240
	i64 u0x1f055d15d807e1b2, ; 182: System.Xml.XmlSerializer => 163
	i64 u0x1f1ed22c1085f044, ; 183: lib_System.Diagnostics.FileVersionInfo.dll.so => 28
	i64 u0x1f61df9c5b94d2c1, ; 184: lib_System.Numerics.dll.so => 84
	i64 u0x1f750bb5421397de, ; 185: lib_Xamarin.AndroidX.Tracing.Tracing.dll.so => 358
	i64 u0x20237ea48006d7a8, ; 186: lib_System.Net.WebClient.dll.so => 77
	i64 u0x2029206e81fec6b7, ; 187: EFCore.BulkExtensions.Oracle => 181
	i64 u0x209375905fcc1bad, ; 188: lib_System.IO.Compression.Brotli.dll.so => 43
	i64 u0x20d9b03355e48538, ; 189: lib_FirebaseAdmin.dll.so => 185
	i64 u0x20e085517023eec8, ; 190: lib_Google.Api.Gax.dll.so => 187
	i64 u0x20fab3cf2dfbc8df, ; 191: lib_System.Diagnostics.Process.dll.so => 29
	i64 u0x2110167c128cba15, ; 192: System.Globalization => 42
	i64 u0x21419508838f7547, ; 193: System.Runtime.CompilerServices.VisualC => 103
	i64 u0x2174319c0d835bc9, ; 194: System.Runtime => 117
	i64 u0x2198e5bc8b7153fa, ; 195: Xamarin.AndroidX.Annotation.Experimental.dll => 294
	i64 u0x2199f06354c82d3b, ; 196: System.ClientModel.dll => 272
	i64 u0x219ea1b751a4dee4, ; 197: lib_System.IO.Compression.ZipFile.dll.so => 45
	i64 u0x21cc7e445dcd5469, ; 198: System.Reflection.Emit.ILGeneration => 91
	i64 u0x220fd4f2e7c48170, ; 199: th/Microsoft.Maui.Controls.resources => 438
	i64 u0x224538d85ed15a82, ; 200: System.IO.Pipes => 56
	i64 u0x22908438c6bed1af, ; 201: lib_System.Threading.Timer.dll.so => 148
	i64 u0x22fbc14e981e3b45, ; 202: lib_Microsoft.VisualStudio.DesignTools.MobileTapContracts.dll.so => 456
	i64 u0x22fe1aafc4641617, ; 203: itext.bouncy-castle-connector => 205
	i64 u0x2347c268e3e4e536, ; 204: Xamarin.GooglePlayServices.Basement.dll => 380
	i64 u0x237be844f1f812c7, ; 205: System.Threading.Thread.dll => 146
	i64 u0x23807c59646ec4f3, ; 206: lib_Microsoft.EntityFrameworkCore.dll.so => 223
	i64 u0x23852b3bdc9f7096, ; 207: System.Resources.ResourceManager => 100
	i64 u0x23986dd7e5d4fc01, ; 208: System.IO.FileSystem.Primitives.dll => 49
	i64 u0x23b0dd507a933aa9, ; 209: Google.Api.Gax => 187
	i64 u0x23f599165f90dd7a, ; 210: lib-cs-Microsoft.Data.SqlClient.resources.dll.so => 398
	i64 u0x2407aef2bbe8fadf, ; 211: System.Console => 20
	i64 u0x240abe014b27e7d3, ; 212: Xamarin.AndroidX.Core.dll => 313
	i64 u0x247619fe4413f8bf, ; 213: System.Runtime.Serialization.Primitives.dll => 114
	i64 u0x24b95d581a70fbee, ; 214: Grpc.Auth.dll => 199
	i64 u0x24d4238047d7310f, ; 215: Google.Apis.Auth => 191
	i64 u0x24de8d301281575e, ; 216: Xamarin.Android.Glide => 287
	i64 u0x252073cc3caa62c2, ; 217: fr/Microsoft.Maui.Controls.resources.dll => 419
	i64 u0x256b8d41255f01b1, ; 218: Xamarin.Google.Crypto.Tink.Android => 376
	i64 u0x25a0a7eff76ea08e, ; 219: SQLitePCLRaw.batteries_v2.dll => 268
	i64 u0x25e1850d10cdc8f7, ; 220: lib_Xamarin.AndroidX.Camera.Camera2.dll.so => 301
	i64 u0x2662c629b96b0b30, ; 221: lib_Xamarin.Kotlin.StdLib.dll.so => 384
	i64 u0x268c1439f13bcc29, ; 222: lib_Microsoft.Extensions.Primitives.dll.so => 241
	i64 u0x268f1dca6d06d437, ; 223: Xamarin.AndroidX.Camera.Core => 302
	i64 u0x26966e2539bcd4cc, ; 224: zh-Hant/Microsoft.SqlServer.Types.resources.dll => 454
	i64 u0x26a670e154a9c54b, ; 225: System.Reflection.Extensions.dll => 94
	i64 u0x26d077d9678fe34f, ; 226: System.IO.dll => 58
	i64 u0x270a44600c921861, ; 227: System.IdentityModel.Tokens.Jwt => 279
	i64 u0x273f3515de5faf0d, ; 228: id/Microsoft.Maui.Controls.resources.dll => 424
	i64 u0x2742545f9094896d, ; 229: hr/Microsoft.Maui.Controls.resources => 422
	i64 u0x2759af78ab94d39b, ; 230: System.Net.WebSockets => 81
	i64 u0x27b2b16f3e9de038, ; 231: Xamarin.Google.Crypto.Tink.Android.dll => 376
	i64 u0x27b410442fad6cf1, ; 232: Java.Interop.dll => 169
	i64 u0x27b97e0d52c3034a, ; 233: System.Diagnostics.Debug => 26
	i64 u0x27c1227907352196, ; 234: lib_Xamarin.Firebase.Installations.InterOp.dll.so => 372
	i64 u0x27d02a8c78fe0900, ; 235: QuestPDF.dll => 267
	i64 u0x27eb21c6eb99d774, ; 236: Xamarin.Kotlin.StdLib.Jdk8.dll => 386
	i64 u0x2801845a2c71fbfb, ; 237: System.Net.Primitives.dll => 71
	i64 u0x286835e259162700, ; 238: lib_Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll.so => 349
	i64 u0x28c1b67181e65f11, ; 239: lib-es-Microsoft.SqlServer.Types.resources.dll.so => 446
	i64 u0x2949f3617a02c6b2, ; 240: Xamarin.AndroidX.ExifInterface => 323
	i64 u0x29f947844fb7fc11, ; 241: Microsoft.Maui.Controls.HotReload.Forms => 455
	i64 u0x2a128783efe70ba0, ; 242: uk/Microsoft.Maui.Controls.resources.dll => 440
	i64 u0x2a3b095612184159, ; 243: lib_System.Net.NetworkInformation.dll.so => 69
	i64 u0x2a6507a5ffabdf28, ; 244: System.Diagnostics.TraceSource.dll => 33
	i64 u0x2a8556742ffd34ef, ; 245: itext.sign => 212
	i64 u0x2ad156c8e1354139, ; 246: fi/Microsoft.Maui.Controls.resources => 418
	i64 u0x2ad5d6b13b7a3e04, ; 247: System.ComponentModel.DataAnnotations.dll => 14
	i64 u0x2af298f63581d886, ; 248: System.Text.RegularExpressions.dll => 139
	i64 u0x2af615542f04da50, ; 249: System.IdentityModel.Tokens.Jwt.dll => 279
	i64 u0x2afc1c4f898552ee, ; 250: lib_System.Formats.Asn1.dll.so => 38
	i64 u0x2b148910ed40fbf9, ; 251: zh-Hant/Microsoft.Maui.Controls.resources.dll => 444
	i64 u0x2b56eeab97412d7a, ; 252: itext.pdfa.dll => 210
	i64 u0x2b6989d78cba9a15, ; 253: Xamarin.AndroidX.Concurrent.Futures.dll => 309
	i64 u0x2c8bd14bb93a7d82, ; 254: lib-pl-Microsoft.Maui.Controls.resources.dll.so => 431
	i64 u0x2cbd9262ca785540, ; 255: lib_System.Text.Encoding.CodePages.dll.so => 134
	i64 u0x2cc9e1fed6257257, ; 256: lib_System.Reflection.Emit.Lightweight.dll.so => 92
	i64 u0x2cd723e9fe623c7c, ; 257: lib_System.Private.Xml.Linq.dll.so => 88
	i64 u0x2ce66f4c8733e883, ; 258: pt-BR/Microsoft.Data.SqlClient.resources.dll => 406
	i64 u0x2d169d318a968379, ; 259: System.Threading.dll => 149
	i64 u0x2d47774b7d993f59, ; 260: sv/Microsoft.Maui.Controls.resources.dll => 437
	i64 u0x2d5ffcae1ad0aaca, ; 261: System.Data.dll => 24
	i64 u0x2db915caf23548d2, ; 262: System.Text.Json.dll => 138
	i64 u0x2dcaa0bb15a4117a, ; 263: System.IO.UnmanagedMemoryStream.dll => 57
	i64 u0x2e5a40c319acb800, ; 264: System.IO.FileSystem => 51
	i64 u0x2e6f1f226821322a, ; 265: el/Microsoft.Maui.Controls.resources.dll => 416
	i64 u0x2ece398cbf74c03b, ; 266: lib_EFCore.BulkExtensions.SqlServer.dll.so => 184
	i64 u0x2f02f94df3200fe5, ; 267: System.Diagnostics.Process => 29
	i64 u0x2f2e98e1c89b1aff, ; 268: System.Xml.ReaderWriter => 157
	i64 u0x2f40b2521deba305, ; 269: lib_Microsoft.SqlServer.Server.dll.so => 256
	i64 u0x2f5911d9ba814e4e, ; 270: System.Diagnostics.Tracing => 34
	i64 u0x2f84070a459bc31f, ; 271: lib_System.Xml.dll.so => 164
	i64 u0x2feb4d2fcda05cfd, ; 272: Microsoft.Extensions.Caching.Abstractions.dll => 230
	i64 u0x309ee9eeec09a71e, ; 273: lib_Xamarin.AndroidX.Fragment.dll.so => 324
	i64 u0x309f2bedefa9a318, ; 274: Microsoft.IdentityModel.Abstractions => 244
	i64 u0x30c6dda129408828, ; 275: System.IO.IsolatedStorage => 52
	i64 u0x30ef53e00b9230df, ; 276: NetTopologySuite.IO.SpatiaLite => 259
	i64 u0x31195fef5d8fb552, ; 277: _Microsoft.Android.Resource.Designer.dll => 458
	i64 u0x312c8ed623cbfc8d, ; 278: Xamarin.AndroidX.Window.dll => 365
	i64 u0x31496b779ed0663d, ; 279: lib_System.Reflection.DispatchProxy.dll.so => 90
	i64 u0x32243413e774362a, ; 280: Xamarin.AndroidX.CardView.dll => 305
	i64 u0x323062994a141225, ; 281: lib-zh-Hans-Microsoft.SqlServer.Types.resources.dll.so => 453
	i64 u0x3235427f8d12dae1, ; 282: lib_System.Drawing.Primitives.dll.so => 35
	i64 u0x32524ae1e229f098, ; 283: itext.svg.dll => 214
	i64 u0x329753a17a517811, ; 284: fr/Microsoft.Maui.Controls.resources => 419
	i64 u0x32aa989ff07a84ff, ; 285: lib_System.Xml.ReaderWriter.dll.so => 157
	i64 u0x33829542f112d59b, ; 286: System.Collections.Immutable => 9
	i64 u0x33a31443733849fe, ; 287: lib-es-Microsoft.Maui.Controls.resources.dll.so => 417
	i64 u0x33ec63a7e226adfb, ; 288: Google.Cloud.Location.dll => 195
	i64 u0x341abc357fbb4ebf, ; 289: lib_System.Net.Sockets.dll.so => 76
	i64 u0x348d598f4054415e, ; 290: Microsoft.SqlServer.Server => 256
	i64 u0x3496c1e2dcaf5ecc, ; 291: lib_System.IO.Pipes.AccessControl.dll.so => 55
	i64 u0x34b2bc8bc64a1107, ; 292: System.Diagnostics.PerformanceCounter.dll => 277
	i64 u0x34c492cef793bb77, ; 293: lib_InputKit.Maui.dll.so => 203
	i64 u0x34dfd74fe2afcf37, ; 294: Microsoft.Maui => 253
	i64 u0x34e292762d9615df, ; 295: cs/Microsoft.Maui.Controls.resources.dll => 413
	i64 u0x3508234247f48404, ; 296: Microsoft.Maui.Controls => 251
	i64 u0x353590da528c9d22, ; 297: System.ComponentModel.Annotations => 13
	i64 u0x3549870798b4cd30, ; 298: lib_Xamarin.AndroidX.ViewPager2.dll.so => 364
	i64 u0x355282fc1c909694, ; 299: Microsoft.Extensions.Configuration => 232
	i64 u0x3552fc5d578f0fbf, ; 300: Xamarin.AndroidX.Arch.Core.Common => 298
	i64 u0x355c649948d55d97, ; 301: lib_System.Runtime.Intrinsics.dll.so => 109
	i64 u0x35ea9d1c6834bc8c, ; 302: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 340
	i64 u0x36263608556d5d42, ; 303: Npgsql.dll => 262
	i64 u0x3628ab68db23a01a, ; 304: lib_System.Diagnostics.Tools.dll.so => 32
	i64 u0x364703ab05867b92, ; 305: Xamarin.Firebase.Components => 370
	i64 u0x3673b042508f5b6b, ; 306: lib_System.Runtime.Extensions.dll.so => 104
	i64 u0x36740f1a8ecdc6c4, ; 307: System.Numerics => 84
	i64 u0x36b2b50fdf589ae2, ; 308: System.Reflection.Emit.Lightweight => 92
	i64 u0x36cada77dc79928b, ; 309: System.IO.MemoryMappedFiles => 53
	i64 u0x36d2129305806e75, ; 310: UraniumUI => 285
	i64 u0x37410855534260db, ; 311: fr/Microsoft.SqlServer.Types.resources.dll => 447
	i64 u0x374ef46b06791af6, ; 312: System.Reflection.Primitives.dll => 96
	i64 u0x376bf93e521a5417, ; 313: lib_Xamarin.Jetbrains.Annotations.dll.so => 383
	i64 u0x379e6c338e5508ad, ; 314: lib_Google.Api.Gax.Grpc.dll.so => 188
	i64 u0x37bc29f3183003b6, ; 315: lib_System.IO.dll.so => 58
	i64 u0x380134e03b1e160a, ; 316: System.Collections.Immutable.dll => 9
	i64 u0x38049b5c59b39324, ; 317: System.Runtime.CompilerServices.Unsafe => 102
	i64 u0x382453cb85fe3f82, ; 318: lib_EFCore.BulkExtensions.Sqlite.dll.so => 183
	i64 u0x382b20286945c849, ; 319: lib_Microsoft.Bcl.Cryptography.dll.so => 219
	i64 u0x385c17636bb6fe6e, ; 320: Xamarin.AndroidX.CustomView.dll => 316
	i64 u0x38869c811d74050e, ; 321: System.Net.NameResolution.dll => 68
	i64 u0x38e93ec1c057cdf6, ; 322: Microsoft.IdentityModel.Protocols => 247
	i64 u0x39251dccb84bdcaa, ; 323: lib_System.Configuration.ConfigurationManager.dll.so => 274
	i64 u0x393c226616977fdb, ; 324: lib_Xamarin.AndroidX.ViewPager.dll.so => 363
	i64 u0x395e37c3334cf82a, ; 325: lib-ca-Microsoft.Maui.Controls.resources.dll.so => 412
	i64 u0x39aa39fda111d9d3, ; 326: Newtonsoft.Json => 261
	i64 u0x39d48361041cb258, ; 327: store.dll => 0
	i64 u0x3a9ae914a83b6050, ; 328: itext.barcodes.dll => 204
	i64 u0x3ab5859054645f72, ; 329: System.Security.Cryptography.Primitives.dll => 125
	i64 u0x3ad75090c3fac0e9, ; 330: lib_Xamarin.AndroidX.ResourceInspection.Annotation.dll.so => 351
	i64 u0x3ae44ac43a1fbdbb, ; 331: System.Runtime.Serialization => 116
	i64 u0x3b860f9932505633, ; 332: lib_System.Text.Encoding.Extensions.dll.so => 135
	i64 u0x3bea9ebe8c027c01, ; 333: lib_Microsoft.IdentityModel.Tokens.dll.so => 249
	i64 u0x3c3aafb6b3a00bf6, ; 334: lib_System.Security.Cryptography.X509Certificates.dll.so => 126
	i64 u0x3c4049146b59aa90, ; 335: System.Runtime.InteropServices.JavaScript => 106
	i64 u0x3c51334447dec9e7, ; 336: Google.LongRunning => 196
	i64 u0x3c5f19e4acdcebd8, ; 337: lib_Microsoft.Data.SqlClient.dll.so => 220
	i64 u0x3c7c495f58ac5ee9, ; 338: Xamarin.Kotlin.StdLib => 384
	i64 u0x3c7e5ed3d5db71bb, ; 339: System.Security => 131
	i64 u0x3cd9d281d402eb9b, ; 340: Xamarin.AndroidX.Browser.dll => 300
	i64 u0x3ced6a4f3010aa96, ; 341: ZXing.Net.MAUI.Controls => 397
	i64 u0x3d196e782ed8c01a, ; 342: System.Data.SqlClient => 275
	i64 u0x3d1c50cc001a991e, ; 343: Xamarin.Google.Guava.ListenableFuture.dll => 378
	i64 u0x3d2b1913edfc08d7, ; 344: lib_System.Threading.ThreadPool.dll.so => 147
	i64 u0x3d46f0b995082740, ; 345: System.Xml.Linq => 156
	i64 u0x3d8a8f400514a790, ; 346: Xamarin.AndroidX.Fragment.Ktx.dll => 325
	i64 u0x3d9c2a242b040a50, ; 347: lib_Xamarin.AndroidX.Core.dll.so => 313
	i64 u0x3da7781d6333a8fe, ; 348: SQLitePCLRaw.batteries_v2 => 268
	i64 u0x3daa14724d8f58e8, ; 349: Google.Protobuf.dll => 197
	i64 u0x3dbb6b9f5ab90fa7, ; 350: lib_Xamarin.AndroidX.DynamicAnimation.dll.so => 320
	i64 u0x3e027e6e728d7f1c, ; 351: Google.LongRunning.dll => 196
	i64 u0x3e0b360b2840f096, ; 352: it/Microsoft.Data.SqlClient.resources => 402
	i64 u0x3e5441657549b213, ; 353: Xamarin.AndroidX.ResourceInspection.Annotation => 351
	i64 u0x3e57d4d195c53c2e, ; 354: System.Reflection.TypeExtensions => 97
	i64 u0x3e616ab4ed1f3f15, ; 355: lib_System.Data.dll.so => 24
	i64 u0x3f1d226e6e06db7e, ; 356: Xamarin.AndroidX.SlidingPaneLayout.dll => 355
	i64 u0x3f3c8f45ab6f28c7, ; 357: Microsoft.Identity.Client.Extensions.Msal.dll => 243
	i64 u0x3f510adf788828dd, ; 358: System.Threading.Tasks.Extensions => 143
	i64 u0x400eb4a58d8d746b, ; 359: lib_QuestPDF.dll.so => 267
	i64 u0x407740ff2e914d86, ; 360: Xamarin.AndroidX.Print.dll => 348
	i64 u0x407a10bb4bf95829, ; 361: lib_Xamarin.AndroidX.Navigation.Common.dll.so => 344
	i64 u0x407a8d1779c33f16, ; 362: System.Diagnostics.PerformanceCounter => 277
	i64 u0x407ac43dee26bd5a, ; 363: lib_Azure.Identity.dll.so => 175
	i64 u0x40c98b6bd77346d4, ; 364: Microsoft.VisualBasic.dll => 3
	i64 u0x4104d92598b18888, ; 365: NetTopologySuite => 258
	i64 u0x41406d6f37320d99, ; 366: Google.Api.Gax.Grpc.dll => 188
	i64 u0x415e36f6b13ff6f3, ; 367: System.Configuration.ConfigurationManager.dll => 274
	i64 u0x41833cf766d27d96, ; 368: mscorlib => 167
	i64 u0x41cab042be111c34, ; 369: lib_Xamarin.AndroidX.AppCompat.AppCompatResources.dll.so => 297
	i64 u0x4202b91ac01ad789, ; 370: itext.barcodes => 204
	i64 u0x423a9ecc4d905a88, ; 371: lib_System.Resources.ResourceManager.dll.so => 100
	i64 u0x423bf51ae7def810, ; 372: System.Xml.XPath => 161
	i64 u0x42418aba44539ffd, ; 373: Google.Cloud.Firestore => 193
	i64 u0x42462ff15ddba223, ; 374: System.Resources.Reader.dll => 99
	i64 u0x4266c67fd9a4ee79, ; 375: Google.Api.CommonProtos => 186
	i64 u0x42a31b86e6ccc3f0, ; 376: System.Diagnostics.Contracts => 25
	i64 u0x42d3cd7add035099, ; 377: System.Management.dll => 281
	i64 u0x430e95b891249788, ; 378: lib_System.Reflection.Emit.dll.so => 93
	i64 u0x43375950ec7c1b6a, ; 379: netstandard.dll => 168
	i64 u0x434c4e1d9284cdae, ; 380: Mono.Android.dll => 172
	i64 u0x43505013578652a0, ; 381: lib_Xamarin.AndroidX.Activity.Ktx.dll.so => 292
	i64 u0x437d06c381ed575a, ; 382: lib_Microsoft.VisualBasic.dll.so => 3
	i64 u0x4394150249e83099, ; 383: lib_store.dll.so => 0
	i64 u0x43950f84de7cc79a, ; 384: pl/Microsoft.Maui.Controls.resources.dll => 431
	i64 u0x4396b4cdb6b3bafc, ; 385: lib-ru-Microsoft.SqlServer.Types.resources.dll.so => 452
	i64 u0x43e8ca5bc927ff37, ; 386: lib_Xamarin.AndroidX.Emoji2.ViewsHelper.dll.so => 322
	i64 u0x448bd33429269b19, ; 387: Microsoft.CSharp => 1
	i64 u0x4499fa3c8e494654, ; 388: lib_System.Runtime.Serialization.Primitives.dll.so => 114
	i64 u0x4515080865a951a5, ; 389: Xamarin.Kotlin.StdLib.dll => 384
	i64 u0x453c1277f85cf368, ; 390: lib_Microsoft.EntityFrameworkCore.Abstractions.dll.so => 224
	i64 u0x4545802489b736b9, ; 391: Xamarin.AndroidX.Fragment.Ktx => 325
	i64 u0x454b4d1e66bb783c, ; 392: Xamarin.AndroidX.Lifecycle.Process => 333
	i64 u0x458d2df79ac57c1d, ; 393: lib_System.IdentityModel.Tokens.Jwt.dll.so => 279
	i64 u0x45b31d67ff6f2b8a, ; 394: lib_Google.Apis.dll.so => 190
	i64 u0x45c40276a42e283e, ; 395: System.Diagnostics.TraceSource => 33
	i64 u0x45d443f2a29adc37, ; 396: System.AppContext.dll => 6
	i64 u0x45fcc9fd66f25095, ; 397: Microsoft.Extensions.DependencyModel => 236
	i64 u0x4648b079f360842e, ; 398: itext.bouncy-castle-adapter => 215
	i64 u0x46a4213bc97fe5ae, ; 399: lib-ru-Microsoft.Maui.Controls.resources.dll.so => 435
	i64 u0x47358bd471172e1d, ; 400: lib_System.Xml.Linq.dll.so => 156
	i64 u0x4747e19ad6a1d4bb, ; 401: Grpc.Net.Common => 202
	i64 u0x4787a936949fcac2, ; 402: System.Memory.Data.dll => 282
	i64 u0x47a2af602ae797ed, ; 403: lib_Xamarin.KotlinX.Coroutines.Play.Services.dll.so => 392
	i64 u0x47daf4e1afbada10, ; 404: pt/Microsoft.Maui.Controls.resources => 433
	i64 u0x480c0a47dd42dd81, ; 405: lib_System.IO.MemoryMappedFiles.dll.so => 53
	i64 u0x488d293220a4fe37, ; 406: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 327
	i64 u0x49e952f19a4e2022, ; 407: System.ObjectModel => 85
	i64 u0x49f6ab815e178ca9, ; 408: lib_Xamarin.Firebase.Common.dll.so => 368
	i64 u0x49f9e6948a8131e4, ; 409: lib_Xamarin.AndroidX.VersionedParcelable.dll.so => 362
	i64 u0x4a5667b2462a664b, ; 410: lib_Xamarin.AndroidX.Navigation.UI.dll.so => 347
	i64 u0x4a7a18981dbd56bc, ; 411: System.IO.Compression.FileSystem.dll => 44
	i64 u0x4aa5c60350917c06, ; 412: lib_Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll.so => 332
	i64 u0x4b07a0ed0ab33ff4, ; 413: System.Runtime.Extensions.dll => 104
	i64 u0x4b576d47ac054f3c, ; 414: System.IO.FileSystem.AccessControl => 47
	i64 u0x4b7b6532ded934b7, ; 415: System.Text.Json => 138
	i64 u0x4b8f8ea3c2df6bb0, ; 416: System.ClientModel => 272
	i64 u0x4c7755cf07ad2d5f, ; 417: System.Net.Http.Json.dll => 64
	i64 u0x4ca014ceac582c86, ; 418: Microsoft.EntityFrameworkCore.Relational.dll => 225
	i64 u0x4cc5f15266470798, ; 419: lib_Xamarin.AndroidX.Loader.dll.so => 342
	i64 u0x4cf6f67dc77aacd2, ; 420: System.Net.NetworkInformation.dll => 69
	i64 u0x4d3183dd245425d4, ; 421: System.Net.WebSockets.Client.dll => 80
	i64 u0x4d3711d4edd16f99, ; 422: Google.Api.Gax.Rest.dll => 189
	i64 u0x4d479f968a05e504, ; 423: System.Linq.Expressions.dll => 59
	i64 u0x4d55a010ffc4faff, ; 424: System.Private.Xml => 89
	i64 u0x4d5cbe77561c5b2e, ; 425: System.Web.dll => 154
	i64 u0x4d6001db23f8cd87, ; 426: lib_System.ClientModel.dll.so => 272
	i64 u0x4d77512dbd86ee4c, ; 427: lib_Xamarin.AndroidX.Arch.Core.Common.dll.so => 298
	i64 u0x4d7793536e79c309, ; 428: System.ServiceProcess => 133
	i64 u0x4d91e5c949c8f5e5, ; 429: InputKit.Maui.dll => 203
	i64 u0x4d95fccc1f67c7ca, ; 430: System.Runtime.Loader.dll => 110
	i64 u0x4da4a8f0f6a70fdc, ; 431: Microsoft.Maui.Controls.Compatibility.dll => 250
	i64 u0x4dcf44c3c9b076a2, ; 432: it/Microsoft.Maui.Controls.resources.dll => 425
	i64 u0x4dd9247f1d2c3235, ; 433: Xamarin.AndroidX.Loader.dll => 342
	i64 u0x4e2aeee78e2c4a87, ; 434: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 349
	i64 u0x4e32f00cb0937401, ; 435: Mono.Android.Runtime => 171
	i64 u0x4e5eea4668ac2b18, ; 436: System.Text.Encoding.CodePages => 134
	i64 u0x4e982534d67b56ba, ; 437: lib_itext.io.dll.so => 207
	i64 u0x4ebd0c4b82c5eefc, ; 438: lib_System.Threading.Channels.dll.so => 140
	i64 u0x4ee8eaa9c9c1151a, ; 439: System.Globalization.Calendars => 40
	i64 u0x4f21ee6ef9eb527e, ; 440: ca/Microsoft.Maui.Controls.resources => 412
	i64 u0x4f27ca9d6e02176c, ; 441: cs/Microsoft.Data.SqlClient.resources => 398
	i64 u0x4f3ba6ee468f1365, ; 442: es/Microsoft.SqlServer.Types.resources.dll => 446
	i64 u0x4fbc57e20df1874a, ; 443: itext.io.dll => 207
	i64 u0x4fd5f3ee53d0a4f0, ; 444: SQLitePCLRaw.lib.e_sqlite3.android => 270
	i64 u0x4ffd65baff757598, ; 445: Microsoft.IdentityModel.Tokens => 249
	i64 u0x50320f2a19424f3f, ; 446: lib-it-Microsoft.Data.SqlClient.resources.dll.so => 402
	i64 u0x5037f0be3c28c7a3, ; 447: lib_Microsoft.Maui.Controls.dll.so => 251
	i64 u0x505aa0ca2d672b22, ; 448: Microsoft.EntityFrameworkCore.SqlServer.HierarchyId => 229
	i64 u0x506203448c473a65, ; 449: Xamarin.Google.AutoValue.Annotations => 374
	i64 u0x508c1fa6b57728d9, ; 450: Grpc.Net.Common.dll => 202
	i64 u0x50c3a29b21050d45, ; 451: System.Linq.Parallel.dll => 60
	i64 u0x50cfaa297b1f7ede, ; 452: FirebaseAdmin.dll => 185
	i64 u0x5112ed116d87baf8, ; 453: CommunityToolkit.Mvvm => 179
	i64 u0x512c33621dd468cb, ; 454: lib_itext.kernel.dll.so => 208
	i64 u0x5131bbe80989093f, ; 455: Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll => 339
	i64 u0x5146d4e23aed3198, ; 456: ja/Microsoft.Data.SqlClient.resources => 403
	i64 u0x516324a5050a7e3c, ; 457: System.Net.WebProxy => 79
	i64 u0x516d6f0b21a303de, ; 458: lib_System.Diagnostics.Contracts.dll.so => 25
	i64 u0x51bb8a2afe774e32, ; 459: System.Drawing => 36
	i64 u0x5247c5c32a4140f0, ; 460: System.Resources.Reader => 99
	i64 u0x526bb15e3c386364, ; 461: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 336
	i64 u0x526ce79eb8e90527, ; 462: lib_System.Net.Primitives.dll.so => 71
	i64 u0x5277169428c6ebf6, ; 463: lib_Grpc.Net.Common.dll.so => 202
	i64 u0x52829f00b4467c38, ; 464: lib_System.Data.Common.dll.so => 22
	i64 u0x5290402954d7bce0, ; 465: zh-Hans/Microsoft.Data.SqlClient.resources => 409
	i64 u0x529e5a460e733af4, ; 466: lib_itext.sign.dll.so => 212
	i64 u0x529ffe06f39ab8db, ; 467: Xamarin.AndroidX.Core => 313
	i64 u0x52ff996554dbf352, ; 468: Microsoft.Maui.Graphics => 255
	i64 u0x53128e94caa50e17, ; 469: Oracle.ManagedDataAccess => 265
	i64 u0x535f7e40e8fef8af, ; 470: lib-sk-Microsoft.Maui.Controls.resources.dll.so => 436
	i64 u0x53978aac584c666e, ; 471: lib_System.Security.Cryptography.Cng.dll.so => 121
	i64 u0x53a96d5c86c9e194, ; 472: System.Net.NetworkInformation => 69
	i64 u0x53be1038a61e8d44, ; 473: System.Runtime.InteropServices.RuntimeInformation.dll => 107
	i64 u0x53c3014b9437e684, ; 474: lib-zh-HK-Microsoft.Maui.Controls.resources.dll.so => 442
	i64 u0x53d666fa678b6cea, ; 475: Microsoft.DotNet.PlatformAbstractions => 222
	i64 u0x53e450ebd586f842, ; 476: lib_Xamarin.AndroidX.LocalBroadcastManager.dll.so => 343
	i64 u0x5435e6f049e9bc37, ; 477: System.Security.Claims.dll => 119
	i64 u0x54795225dd1587af, ; 478: lib_System.Runtime.dll.so => 117
	i64 u0x547a34f14e5f6210, ; 479: Xamarin.AndroidX.Lifecycle.Common.dll => 328
	i64 u0x54b42cc2b8e65a84, ; 480: Google.Apis.Core.dll => 192
	i64 u0x556e8b63b660ab8b, ; 481: Xamarin.AndroidX.Lifecycle.Common.Jvm.dll => 329
	i64 u0x5588627c9a108ec9, ; 482: System.Collections.Specialized => 11
	i64 u0x55a898e4f42e3fae, ; 483: Microsoft.VisualBasic.Core.dll => 2
	i64 u0x55fa0c610fe93bb1, ; 484: lib_System.Security.Cryptography.OpenSsl.dll.so => 124
	i64 u0x56442b99bc64bb47, ; 485: System.Runtime.Serialization.Xml.dll => 115
	i64 u0x56a8b26e1aeae27b, ; 486: System.Threading.Tasks.Dataflow => 142
	i64 u0x56f932d61e93c07f, ; 487: System.Globalization.Extensions => 41
	i64 u0x571c5cfbec5ae8e2, ; 488: System.Private.Uri => 87
	i64 u0x576499c9f52fea31, ; 489: Xamarin.AndroidX.Annotation => 293
	i64 u0x578cd35c91d7b347, ; 490: lib_SQLitePCLRaw.core.dll.so => 269
	i64 u0x579a06fed6eec900, ; 491: System.Private.CoreLib.dll => 173
	i64 u0x57c542c14049b66d, ; 492: System.Diagnostics.DiagnosticSource => 27
	i64 u0x581a8bd5cfda563e, ; 493: System.Threading.Timer => 148
	i64 u0x58601b2dda4a27b9, ; 494: lib-ja-Microsoft.Maui.Controls.resources.dll.so => 426
	i64 u0x58688d9af496b168, ; 495: Microsoft.Extensions.DependencyInjection.dll => 234
	i64 u0x588c167a79db6bfb, ; 496: lib_Xamarin.Google.ErrorProne.Annotations.dll.so => 377
	i64 u0x5906028ae5151104, ; 497: Xamarin.AndroidX.Activity.Ktx => 292
	i64 u0x595a356d23e8da9a, ; 498: lib_Microsoft.CSharp.dll.so => 1
	i64 u0x59a935a032dbc08c, ; 499: lib_Grpc.Auth.dll.so => 199
	i64 u0x59f9e60b9475085f, ; 500: lib_Xamarin.AndroidX.Annotation.Experimental.dll.so => 294
	i64 u0x5a70033ca9d003cb, ; 501: lib_System.Memory.Data.dll.so => 282
	i64 u0x5a745f5101a75527, ; 502: lib_System.IO.Compression.FileSystem.dll.so => 44
	i64 u0x5a89a886ae30258d, ; 503: lib_Xamarin.AndroidX.CoordinatorLayout.dll.so => 312
	i64 u0x5a8f6699f4a1caa9, ; 504: lib_System.Threading.dll.so => 149
	i64 u0x5ae8e4f3eae4d547, ; 505: Xamarin.AndroidX.Legacy.Support.Core.Utils => 327
	i64 u0x5ae9cd33b15841bf, ; 506: System.ComponentModel => 18
	i64 u0x5b54391bdc6fcfe6, ; 507: System.Private.DataContractSerialization => 86
	i64 u0x5b5f0e240a06a2a2, ; 508: da/Microsoft.Maui.Controls.resources.dll => 414
	i64 u0x5b755276902c8414, ; 509: Xamarin.GooglePlayServices.Base => 379
	i64 u0x5b8109e8e14c5e3e, ; 510: System.Globalization.Extensions.dll => 41
	i64 u0x5bddd04d72a9e350, ; 511: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 332
	i64 u0x5bdf16b09da116ab, ; 512: Xamarin.AndroidX.Collection => 306
	i64 u0x5bf46332cc09e9b2, ; 513: lib_System.Data.SqlClient.dll.so => 275
	i64 u0x5bff6a70194300bd, ; 514: lib_Xamarin.Kotlin.StdLib.Jdk8.dll.so => 386
	i64 u0x5c019d5266093159, ; 515: lib_Xamarin.AndroidX.Lifecycle.Runtime.Ktx.Android.dll.so => 337
	i64 u0x5c30a4a35f9cc8c4, ; 516: lib_System.Reflection.Extensions.dll.so => 94
	i64 u0x5c393624b8176517, ; 517: lib_Microsoft.Extensions.Logging.dll.so => 237
	i64 u0x5c53c29f5073b0c9, ; 518: System.Diagnostics.FileVersionInfo => 28
	i64 u0x5c87463c575c7616, ; 519: lib_System.Globalization.Extensions.dll.so => 41
	i64 u0x5ce309995937d5a0, ; 520: pt-BR/Microsoft.SqlServer.Types.resources.dll => 451
	i64 u0x5d0a4a29b02d9d3c, ; 521: System.Net.WebHeaderCollection.dll => 78
	i64 u0x5d1b514fc45c92d4, ; 522: ZXing.Net.MAUI => 396
	i64 u0x5d33da2f84c1de97, ; 523: lib-pt-BR-Microsoft.Data.SqlClient.resources.dll.so => 406
	i64 u0x5d40c9b15181641f, ; 524: lib_Xamarin.AndroidX.Emoji2.dll.so => 321
	i64 u0x5d6ca10d35e9485b, ; 525: lib_Xamarin.AndroidX.Concurrent.Futures.dll.so => 309
	i64 u0x5d7960d446a1890e, ; 526: lib-pl-Microsoft.Data.SqlClient.resources.dll.so => 405
	i64 u0x5d7ec76c1c703055, ; 527: System.Threading.Tasks.Parallel => 144
	i64 u0x5db0cbbd1028510e, ; 528: lib_System.Runtime.InteropServices.dll.so => 108
	i64 u0x5db30905d3e5013b, ; 529: Xamarin.AndroidX.Collection.Jvm.dll => 307
	i64 u0x5e467bc8f09ad026, ; 530: System.Collections.Specialized.dll => 11
	i64 u0x5e5173b3208d97e7, ; 531: System.Runtime.Handles.dll => 105
	i64 u0x5ea92fdb19ec8c4c, ; 532: System.Text.Encodings.Web.dll => 137
	i64 u0x5eb8046dd40e9ac3, ; 533: System.ComponentModel.Primitives => 16
	i64 u0x5ec272d219c9aba4, ; 534: System.Security.Cryptography.Csp.dll => 122
	i64 u0x5eee1376d94c7f5e, ; 535: System.Net.HttpListener.dll => 66
	i64 u0x5f0980ab8131b542, ; 536: EFCore.BulkExtensions.Sqlite => 183
	i64 u0x5f36ccf5c6a57e24, ; 537: System.Xml.ReaderWriter.dll => 157
	i64 u0x5f4294b9b63cb842, ; 538: System.Data.Common => 22
	i64 u0x5f5be00b819666f1, ; 539: ru/Microsoft.SqlServer.Types.resources => 452
	i64 u0x5f7399e166075632, ; 540: lib_SQLitePCLRaw.lib.e_sqlite3.android.dll.so => 270
	i64 u0x5f9a2d823f664957, ; 541: lib-el-Microsoft.Maui.Controls.resources.dll.so => 416
	i64 u0x5fa6da9c3cd8142a, ; 542: lib_Xamarin.KotlinX.Serialization.Core.dll.so => 393
	i64 u0x5fac98e0b37a5b9d, ; 543: System.Runtime.CompilerServices.Unsafe.dll => 102
	i64 u0x609f4b7b63d802d4, ; 544: lib_Microsoft.Extensions.DependencyInjection.dll.so => 234
	i64 u0x60cd4e33d7e60134, ; 545: Xamarin.KotlinX.Coroutines.Core.Jvm => 391
	i64 u0x60f62d786afcf130, ; 546: System.Memory => 63
	i64 u0x61bb78c89f867353, ; 547: System.IO => 58
	i64 u0x61be8d1299194243, ; 548: Microsoft.Maui.Controls.Xaml => 252
	i64 u0x61d2cba29557038f, ; 549: de/Microsoft.Maui.Controls.resources => 415
	i64 u0x61d88f399afb2f45, ; 550: lib_System.Runtime.Loader.dll.so => 110
	i64 u0x6219beeff33faa04, ; 551: cs/Microsoft.Data.SqlClient.resources.dll => 398
	i64 u0x622eef6f9e59068d, ; 552: System.Private.CoreLib => 173
	i64 u0x625def565caafc1c, ; 553: tr/Microsoft.Data.SqlClient.resources.dll => 408
	i64 u0x62812a93be7f3265, ; 554: Microsoft.Bcl.Cryptography => 219
	i64 u0x637320c71840c561, ; 555: lib_itext.pdfa.dll.so => 210
	i64 u0x63d5e3aa4ef9b931, ; 556: Xamarin.KotlinX.Coroutines.Android.dll => 389
	i64 u0x63f1f6883c1e23c2, ; 557: lib_System.Collections.Immutable.dll.so => 9
	i64 u0x6400f68068c1e9f1, ; 558: Xamarin.Google.Android.Material.dll => 373
	i64 u0x640e3b14dbd325c2, ; 559: System.Security.Cryptography.Algorithms.dll => 120
	i64 u0x641bebf7cee18d1c, ; 560: Microsoft.EntityFrameworkCore.SqlServer.Abstractions.dll => 228
	i64 u0x64587004560099b9, ; 561: System.Reflection => 98
	i64 u0x6468947914df5c9c, ; 562: Microsoft.Bcl.Cryptography.dll => 219
	i64 u0x64b1529a438a3c45, ; 563: lib_System.Runtime.Handles.dll.so => 105
	i64 u0x64f30e567cb41fac, ; 564: Xamarin.KotlinX.Coroutines.Play.Services => 392
	i64 u0x6533c154f14eefe0, ; 565: lib_Google.Api.Gax.Rest.dll.so => 189
	i64 u0x6565fba2cd8f235b, ; 566: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 340
	i64 u0x658f524e4aba7dad, ; 567: CommunityToolkit.Maui.dll => 177
	i64 u0x65ecac39144dd3cc, ; 568: Microsoft.Maui.Controls.dll => 251
	i64 u0x65ece51227bfa724, ; 569: lib_System.Runtime.Numerics.dll.so => 111
	i64 u0x661722438787b57f, ; 570: Xamarin.AndroidX.Annotation.Jvm.dll => 295
	i64 u0x6679b2337ee6b22a, ; 571: lib_System.IO.FileSystem.Primitives.dll.so => 49
	i64 u0x6692e924eade1b29, ; 572: lib_System.Console.dll.so => 20
	i64 u0x66a4e5c6a3fb0bae, ; 573: lib_Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll.so => 339
	i64 u0x66d13304ce1a3efa, ; 574: Xamarin.AndroidX.CursorAdapter => 315
	i64 u0x674303f65d8fad6f, ; 575: lib_System.Net.Quic.dll.so => 72
	i64 u0x6756ca4cad62e9d6, ; 576: lib_Xamarin.AndroidX.ConstraintLayout.Core.dll.so => 311
	i64 u0x677569b965946273, ; 577: ko/Microsoft.SqlServer.Types.resources.dll => 450
	i64 u0x67c0802770244408, ; 578: System.Windows.dll => 155
	i64 u0x67c0d6eb5a84aa5a, ; 579: lib_System.Diagnostics.PerformanceCounter.dll.so => 277
	i64 u0x68100b69286e27cd, ; 580: lib_System.Formats.Tar.dll.so => 39
	i64 u0x68558ec653afa616, ; 581: lib-da-Microsoft.Maui.Controls.resources.dll.so => 414
	i64 u0x6872ec7a2e36b1ac, ; 582: System.Drawing.Primitives.dll => 35
	i64 u0x68bb2c417aa9b61c, ; 583: Xamarin.KotlinX.AtomicFU.dll => 387
	i64 u0x68fbbbe2eb455198, ; 584: System.Formats.Asn1 => 38
	i64 u0x69063fc0ba8e6bdd, ; 585: he/Microsoft.Maui.Controls.resources.dll => 420
	i64 u0x699dffb2427a2d71, ; 586: SQLitePCLRaw.lib.e_sqlite3.android.dll => 270
	i64 u0x69a3e26c76f6eec4, ; 587: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 366
	i64 u0x6a4d7577b2317255, ; 588: System.Runtime.InteropServices.dll => 108
	i64 u0x6ace3b74b15ee4a4, ; 589: nb/Microsoft.Maui.Controls.resources => 429
	i64 u0x6afcedb171067e2b, ; 590: System.Core.dll => 21
	i64 u0x6bc822f45373a1d6, ; 591: Google.Apis.dll => 190
	i64 u0x6bef98e124147c24, ; 592: Xamarin.Jetbrains.Annotations => 383
	i64 u0x6c7d5f4d06aadeaa, ; 593: EFCore.BulkExtensions.SqlServer.dll => 184
	i64 u0x6cd97f370311a542, ; 594: Microsoft.EntityFrameworkCore.SqlServer => 227
	i64 u0x6ce874bff138ce2b, ; 595: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 338
	i64 u0x6d0a12b2adba20d8, ; 596: System.Security.Cryptography.ProtectedData.dll => 284
	i64 u0x6d12bfaa99c72b1f, ; 597: lib_Microsoft.Maui.Graphics.dll.so => 255
	i64 u0x6d3b7628f8253e93, ; 598: pl/Microsoft.Data.SqlClient.resources => 405
	i64 u0x6d70755158ca866e, ; 599: lib_System.ComponentModel.EventBasedAsync.dll.so => 15
	i64 u0x6d79993361e10ef2, ; 600: Microsoft.Extensions.Primitives => 241
	i64 u0x6d7eeca99577fc8b, ; 601: lib_System.Net.WebProxy.dll.so => 79
	i64 u0x6d8515b19946b6a2, ; 602: System.Net.WebProxy.dll => 79
	i64 u0x6d86d56b84c8eb71, ; 603: lib_Xamarin.AndroidX.CursorAdapter.dll.so => 315
	i64 u0x6d9bea6b3e895cf7, ; 604: Microsoft.Extensions.Primitives.dll => 241
	i64 u0x6dd9bf4083de3f6a, ; 605: Xamarin.AndroidX.DocumentFile.dll => 318
	i64 u0x6e25a02c3833319a, ; 606: lib_Xamarin.AndroidX.Navigation.Fragment.dll.so => 345
	i64 u0x6e79c6bd8627412a, ; 607: Xamarin.AndroidX.SavedState.SavedState.Ktx => 353
	i64 u0x6e838d9a2a6f6c9e, ; 608: lib_System.ValueTuple.dll.so => 152
	i64 u0x6e9965ce1095e60a, ; 609: lib_System.Core.dll.so => 21
	i64 u0x6f304d1dec1019e9, ; 610: lib_Xamarin.Firebase.Installations.dll.so => 371
	i64 u0x6fd2265da78b93a4, ; 611: lib_Microsoft.Maui.dll.so => 253
	i64 u0x6fdfc7de82c33008, ; 612: cs/Microsoft.Maui.Controls.resources => 413
	i64 u0x6ffc4967cc47ba57, ; 613: System.IO.FileSystem.Watcher.dll => 50
	i64 u0x701cd46a1c25a5fe, ; 614: System.IO.FileSystem.dll => 51
	i64 u0x706442eb8d0ca9f8, ; 615: Plainer.Maui.dll => 266
	i64 u0x70e99f48c05cb921, ; 616: tr/Microsoft.Maui.Controls.resources.dll => 439
	i64 u0x70fd3deda22442d2, ; 617: lib-nb-Microsoft.Maui.Controls.resources.dll.so => 429
	i64 u0x71485e7ffdb4b958, ; 618: System.Reflection.Extensions => 94
	i64 u0x7162a2fce67a945f, ; 619: lib_Xamarin.Android.Glide.Annotations.dll.so => 288
	i64 u0x71a495ea3761dde8, ; 620: lib-it-Microsoft.Maui.Controls.resources.dll.so => 425
	i64 u0x71ad672adbe48f35, ; 621: System.ComponentModel.Primitives.dll => 16
	i64 u0x71bc142d620e986a, ; 622: lib_System.Security.Cryptography.Pkcs.dll.so => 283
	i64 u0x725f5a9e82a45c81, ; 623: System.Security.Cryptography.Encoding => 123
	i64 u0x72b1fb4109e08d7b, ; 624: lib-hr-Microsoft.Maui.Controls.resources.dll.so => 422
	i64 u0x72e0300099accce1, ; 625: System.Xml.XPath.XDocument => 160
	i64 u0x730bfb248998f67a, ; 626: System.IO.Compression.ZipFile => 45
	i64 u0x732b2d67b9e5c47b, ; 627: Xamarin.Google.ErrorProne.Annotations.dll => 377
	i64 u0x734b76fdc0dc05bb, ; 628: lib_GoogleGson.dll.so => 198
	i64 u0x73a22de3db7e3506, ; 629: lib-ko-Microsoft.SqlServer.Types.resources.dll.so => 450
	i64 u0x73a6be34e822f9d1, ; 630: lib_System.Runtime.Serialization.dll.so => 116
	i64 u0x73e4ce94e2eb6ffc, ; 631: lib_System.Memory.dll.so => 63
	i64 u0x73f2645914262879, ; 632: lib_Microsoft.EntityFrameworkCore.Sqlite.dll.so => 226
	i64 u0x743a1eccf080489a, ; 633: WindowsBase.dll => 166
	i64 u0x74770d0c84d62bee, ; 634: EFCore.BulkExtensions.SqlServer => 184
	i64 u0x74d88540363e57e3, ; 635: MedallionTopologicalSort => 217
	i64 u0x755a91767330b3d4, ; 636: lib_Microsoft.Extensions.Configuration.dll.so => 232
	i64 u0x75c326eb821b85c4, ; 637: lib_System.ComponentModel.DataAnnotations.dll.so => 14
	i64 u0x76012e7334db86e5, ; 638: lib_Xamarin.AndroidX.SavedState.dll.so => 352
	i64 u0x76ca07b878f44da0, ; 639: System.Runtime.Numerics.dll => 111
	i64 u0x770e0cc2309fe21d, ; 640: lib-pt-BR-Microsoft.SqlServer.Types.resources.dll.so => 451
	i64 u0x7736c8a96e51a061, ; 641: lib_Xamarin.AndroidX.Annotation.Jvm.dll.so => 295
	i64 u0x778a805e625329ef, ; 642: System.Linq.Parallel => 60
	i64 u0x779290cc2b801eb7, ; 643: Xamarin.KotlinX.AtomicFU.Jvm => 388
	i64 u0x77bf40592cd67602, ; 644: Xamarin.Google.AutoValue.Annotations.dll => 374
	i64 u0x77f8a4acc2fdc449, ; 645: System.Security.Cryptography.Cng.dll => 121
	i64 u0x780bc73597a503a9, ; 646: lib-ms-Microsoft.Maui.Controls.resources.dll.so => 428
	i64 u0x782c5d8eb99ff201, ; 647: lib_Microsoft.VisualBasic.Core.dll.so => 2
	i64 u0x783606d1e53e7a1a, ; 648: th/Microsoft.Maui.Controls.resources.dll => 438
	i64 u0x784b4ff3eed363ff, ; 649: Xamarin.Firebase.Common => 368
	i64 u0x78a45e51311409b6, ; 650: Xamarin.AndroidX.Fragment.dll => 324
	i64 u0x78ed4ab8f9d800a1, ; 651: Xamarin.AndroidX.Lifecycle.ViewModel => 338
	i64 u0x79eb916f2d11e1f0, ; 652: zh-Hans/Microsoft.Data.SqlClient.resources.dll => 409
	i64 u0x7a39601d6f0bb831, ; 653: lib_Xamarin.KotlinX.AtomicFU.dll.so => 387
	i64 u0x7a7e7eddf79c5d26, ; 654: lib_Xamarin.AndroidX.Lifecycle.ViewModel.dll.so => 338
	i64 u0x7a9a57d43b0845fa, ; 655: System.AppContext => 6
	i64 u0x7ad0f4f1e5d08183, ; 656: Xamarin.AndroidX.Collection.dll => 306
	i64 u0x7adb8da2ac89b647, ; 657: fi/Microsoft.Maui.Controls.resources.dll => 418
	i64 u0x7b13d9eaa944ade8, ; 658: Xamarin.AndroidX.DynamicAnimation.dll => 320
	i64 u0x7b150145c0a9058c, ; 659: Microsoft.Data.Sqlite => 221
	i64 u0x7b4927e421291c41, ; 660: Microsoft.IdentityModel.JsonWebTokens.dll => 245
	i64 u0x7bef86a4335c4870, ; 661: System.ComponentModel.TypeConverter => 17
	i64 u0x7c0820144cd34d6a, ; 662: sk/Microsoft.Maui.Controls.resources.dll => 436
	i64 u0x7c2a0bd1e0f988fc, ; 663: lib-de-Microsoft.Maui.Controls.resources.dll.so => 415
	i64 u0x7c41d387501568ba, ; 664: System.Net.WebClient.dll => 77
	i64 u0x7c482cd79bd24b13, ; 665: lib_Xamarin.AndroidX.ConstraintLayout.dll.so => 310
	i64 u0x7c8cb8cf04bee12b, ; 666: lib_Xamarin.Google.AutoValue.Annotations.dll.so => 374
	i64 u0x7cb95ad2a929d044, ; 667: Xamarin.GooglePlayServices.Basement => 380
	i64 u0x7cc637f941f716d0, ; 668: CommunityToolkit.Maui.Core => 178
	i64 u0x7cd2ec8eaf5241cd, ; 669: System.Security.dll => 131
	i64 u0x7cf9ae50dd350622, ; 670: Xamarin.Jetbrains.Annotations.dll => 383
	i64 u0x7d649b75d580bb42, ; 671: ms/Microsoft.Maui.Controls.resources.dll => 428
	i64 u0x7d8ee2bdc8e3aad1, ; 672: System.Numerics.Vectors => 83
	i64 u0x7dc2a070ce60a1e2, ; 673: itext.bouncy-castle-connector.dll => 205
	i64 u0x7df5df8db8eaa6ac, ; 674: Microsoft.Extensions.Logging.Debug => 239
	i64 u0x7dfc3d6d9d8d7b70, ; 675: System.Collections => 12
	i64 u0x7e034293328f139a, ; 676: EFCore.BulkExtensions.PostgreSql => 182
	i64 u0x7e1f8f575a3599cb, ; 677: BouncyCastle.Cryptography.dll => 176
	i64 u0x7e2e564fa2f76c65, ; 678: lib_System.Diagnostics.Tracing.dll.so => 34
	i64 u0x7e302e110e1e1346, ; 679: lib_System.Security.Claims.dll.so => 119
	i64 u0x7e4465b3f78ad8d0, ; 680: Xamarin.KotlinX.Serialization.Core.dll => 393
	i64 u0x7e571cad5915e6c3, ; 681: lib_Xamarin.AndroidX.Lifecycle.Process.dll.so => 333
	i64 u0x7e6b1ca712437d7d, ; 682: Xamarin.AndroidX.Emoji2.ViewsHelper => 322
	i64 u0x7e946809d6008ef2, ; 683: lib_System.ObjectModel.dll.so => 85
	i64 u0x7ea0272c1b4a9635, ; 684: lib_Xamarin.Android.Glide.dll.so => 287
	i64 u0x7eb4f0dc47488736, ; 685: lib_Xamarin.GooglePlayServices.Tasks.dll.so => 381
	i64 u0x7ecc13347c8fd849, ; 686: lib_System.ComponentModel.dll.so => 18
	i64 u0x7f00ddd9b9ca5a13, ; 687: Xamarin.AndroidX.ViewPager.dll => 363
	i64 u0x7f9351cd44b1273f, ; 688: Microsoft.Extensions.Configuration.Abstractions => 233
	i64 u0x7fae0ef4dc4770fe, ; 689: Microsoft.Identity.Client => 242
	i64 u0x7fbd557c99b3ce6f, ; 690: lib_Xamarin.AndroidX.Lifecycle.LiveData.Core.dll.so => 331
	i64 u0x8076a9a44a2ca331, ; 691: System.Net.Quic => 72
	i64 u0x80b7e726b0280681, ; 692: Microsoft.VisualStudio.DesignTools.MobileTapContracts => 456
	i64 u0x80da183a87731838, ; 693: System.Reflection.Metadata => 95
	i64 u0x80fa55b6d1b0be99, ; 694: SQLitePCLRaw.provider.e_sqlite3 => 271
	i64 u0x812c069d5cdecc17, ; 695: System.dll => 165
	i64 u0x81381be520a60adb, ; 696: Xamarin.AndroidX.Interpolator.dll => 326
	i64 u0x8145faf772692484, ; 697: Google.Cloud.Firestore.V1.dll => 194
	i64 u0x81657cec2b31e8aa, ; 698: System.Net => 82
	i64 u0x81ab745f6c0f5ce6, ; 699: zh-Hant/Microsoft.Maui.Controls.resources => 444
	i64 u0x8277f2be6b5ce05f, ; 700: Xamarin.AndroidX.AppCompat => 296
	i64 u0x828f06563b30bc50, ; 701: lib_Xamarin.AndroidX.CardView.dll.so => 305
	i64 u0x82920a8d9194a019, ; 702: Xamarin.KotlinX.AtomicFU.Jvm.dll => 388
	i64 u0x82b399cb01b531c4, ; 703: lib_System.Web.dll.so => 154
	i64 u0x82df8f5532a10c59, ; 704: lib_System.Drawing.dll.so => 36
	i64 u0x82f0b6e911d13535, ; 705: lib_System.Transactions.dll.so => 151
	i64 u0x82f6403342e12049, ; 706: uk/Microsoft.Maui.Controls.resources => 440
	i64 u0x833edc738697d898, ; 707: itext.layout.dll => 209
	i64 u0x8350268f9d350eec, ; 708: itext.commons => 216
	i64 u0x83a7afd2c49adc86, ; 709: lib_Microsoft.IdentityModel.Abstractions.dll.so => 244
	i64 u0x83c14ba66c8e2b8c, ; 710: zh-Hans/Microsoft.Maui.Controls.resources => 443
	i64 u0x844ac8f64fd78edc, ; 711: Xamarin.AndroidX.Camera.View.dll => 304
	i64 u0x846ce984efea52c7, ; 712: System.Threading.Tasks.Parallel.dll => 144
	i64 u0x84ae73148a4557d2, ; 713: lib_System.IO.Pipes.dll.so => 56
	i64 u0x84b01102c12a9232, ; 714: System.Runtime.Serialization.Json.dll => 113
	i64 u0x84bc82b42469a609, ; 715: Oracle.EntityFrameworkCore => 264
	i64 u0x84cd5cdec0f54bcc, ; 716: lib_Microsoft.EntityFrameworkCore.Relational.dll.so => 225
	i64 u0x850c5ba0b57ce8e7, ; 717: lib_Xamarin.AndroidX.Collection.dll.so => 306
	i64 u0x851d02edd334b044, ; 718: Xamarin.AndroidX.VectorDrawable => 360
	i64 u0x8528b82bdbc15371, ; 719: ko/Microsoft.Data.SqlClient.resources => 404
	i64 u0x8533cf0079a66e49, ; 720: lib_Oracle.EntityFrameworkCore.dll.so => 264
	i64 u0x85c919db62150978, ; 721: Xamarin.AndroidX.Transition.dll => 359
	i64 u0x8662aaeb94fef37f, ; 722: lib_System.Dynamic.Runtime.dll.so => 37
	i64 u0x86a909228dc7657b, ; 723: lib-zh-Hant-Microsoft.Maui.Controls.resources.dll.so => 444
	i64 u0x86b3e00c36b84509, ; 724: Microsoft.Extensions.Configuration.dll => 232
	i64 u0x86b62cb077ec4fd7, ; 725: System.Runtime.Serialization.Xml => 115
	i64 u0x8706ffb12bf3f53d, ; 726: Xamarin.AndroidX.Annotation.Experimental => 294
	i64 u0x872a5b14c18d328c, ; 727: System.ComponentModel.DataAnnotations => 14
	i64 u0x872fb9615bc2dff0, ; 728: Xamarin.Android.Glide.Annotations.dll => 288
	i64 u0x87c4b8a492b176ad, ; 729: Microsoft.EntityFrameworkCore.Abstractions => 224
	i64 u0x87c69b87d9283884, ; 730: lib_System.Threading.Thread.dll.so => 146
	i64 u0x87f6569b25707834, ; 731: System.IO.Compression.Brotli.dll => 43
	i64 u0x87fef727071b7fe5, ; 732: Grpc.Net.Client => 201
	i64 u0x8842b3a5d2d3fb36, ; 733: Microsoft.Maui.Essentials => 254
	i64 u0x88926583efe7ee86, ; 734: Xamarin.AndroidX.Activity.Ktx.dll => 292
	i64 u0x88b16a1a7051ebe2, ; 735: Xamarin.Firebase.Annotations.dll => 367
	i64 u0x88ba6bc4f7762b03, ; 736: lib_System.Reflection.dll.so => 98
	i64 u0x88bda98e0cffb7a9, ; 737: lib_Xamarin.KotlinX.Coroutines.Core.Jvm.dll.so => 391
	i64 u0x8930322c7bd8f768, ; 738: netstandard => 168
	i64 u0x894dbdd1ac38f4e1, ; 739: Plainer.Maui => 266
	i64 u0x897a606c9e39c75f, ; 740: lib_System.ComponentModel.Primitives.dll.so => 16
	i64 u0x89911a22005b92b7, ; 741: System.IO.FileSystem.DriveInfo.dll => 48
	i64 u0x89c5188089ec2cd5, ; 742: lib_System.Runtime.InteropServices.RuntimeInformation.dll.so => 107
	i64 u0x8a19e3dc71b34b2c, ; 743: System.Reflection.TypeExtensions.dll => 97
	i64 u0x8a399a706fcbce4b, ; 744: Microsoft.Extensions.Caching.Abstractions => 230
	i64 u0x8a90bab2026e5b88, ; 745: Google.Cloud.Firestore.dll => 193
	i64 u0x8ad229ea26432ee2, ; 746: Xamarin.AndroidX.Loader => 342
	i64 u0x8aed8bcfab24aa6d, ; 747: itext.svg => 214
	i64 u0x8b4ff5d0fdd5faa1, ; 748: lib_System.Diagnostics.DiagnosticSource.dll.so => 27
	i64 u0x8b541d476eb3774c, ; 749: System.Security.Principal.Windows => 128
	i64 u0x8b8d01333a96d0b5, ; 750: System.Diagnostics.Process.dll => 29
	i64 u0x8b9ceca7acae3451, ; 751: lib-he-Microsoft.Maui.Controls.resources.dll.so => 420
	i64 u0x8c156fe7f184f137, ; 752: tr/Microsoft.Data.SqlClient.resources => 408
	i64 u0x8c53ae18581b14f0, ; 753: Azure.Core => 174
	i64 u0x8cb6d28731d97279, ; 754: System.DirectoryServices.Protocols => 278
	i64 u0x8cb8f612b633affb, ; 755: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 353
	i64 u0x8cdfdb4ce85fb925, ; 756: lib_System.Security.Principal.Windows.dll.so => 128
	i64 u0x8cdfe7b8f4caa426, ; 757: System.IO.Compression.FileSystem => 44
	i64 u0x8cf51f1eb9e90658, ; 758: lib_Microsoft.EntityFrameworkCore.SqlServer.dll.so => 227
	i64 u0x8d0f420977c2c1c7, ; 759: Xamarin.AndroidX.CursorAdapter.dll => 315
	i64 u0x8d2551476f2e2ef7, ; 760: lib_UraniumUI.Material.dll.so => 286
	i64 u0x8d52a25632e81824, ; 761: Microsoft.EntityFrameworkCore.Sqlite.dll => 226
	i64 u0x8d52f7ea2796c531, ; 762: Xamarin.AndroidX.Emoji2.dll => 321
	i64 u0x8d7b8ab4b3310ead, ; 763: System.Threading => 149
	i64 u0x8da188285aadfe8e, ; 764: System.Collections.Concurrent => 8
	i64 u0x8dfc1cfbf8858f95, ; 765: Grpc.Core.Api.dll => 200
	i64 u0x8e7b0d6c6f6404e3, ; 766: fr/Microsoft.SqlServer.Types.resources => 447
	i64 u0x8e937db395a74375, ; 767: lib_Microsoft.Identity.Client.dll.so => 242
	i64 u0x8e9b88b113d62c7d, ; 768: zh-Hant/Microsoft.SqlServer.Types.resources => 454
	i64 u0x8ebba9258a550f92, ; 769: lib_Plainer.Maui.dll.so => 266
	i64 u0x8ec6e06a61c1baeb, ; 770: lib_Newtonsoft.Json.dll.so => 261
	i64 u0x8ed3cdd722b4d782, ; 771: System.Diagnostics.EventLog => 276
	i64 u0x8ed807bfe9858dfc, ; 772: Xamarin.AndroidX.Navigation.Common => 344
	i64 u0x8ee08b8194a30f48, ; 773: lib-hi-Microsoft.Maui.Controls.resources.dll.so => 421
	i64 u0x8ef7601039857a44, ; 774: lib-ro-Microsoft.Maui.Controls.resources.dll.so => 434
	i64 u0x8ef9414937d93a0a, ; 775: SQLitePCLRaw.core.dll => 269
	i64 u0x8efbc0801a122264, ; 776: Xamarin.GooglePlayServices.Tasks.dll => 381
	i64 u0x8f32c6f611f6ffab, ; 777: pt/Microsoft.Maui.Controls.resources.dll => 433
	i64 u0x8f44b45eb046bbd1, ; 778: System.ServiceModel.Web.dll => 132
	i64 u0x8f8829d21c8985a4, ; 779: lib-pt-BR-Microsoft.Maui.Controls.resources.dll.so => 432
	i64 u0x8fbf5b0114c6dcef, ; 780: System.Globalization.dll => 42
	i64 u0x8fcc8c2a81f3d9e7, ; 781: Xamarin.KotlinX.Serialization.Core => 393
	i64 u0x8fd27d934d7b3a55, ; 782: SQLitePCLRaw.core => 269
	i64 u0x90263f8448b8f572, ; 783: lib_System.Diagnostics.TraceSource.dll.so => 33
	i64 u0x9027f725f74f5c08, ; 784: lib_NetTopologySuite.IO.SpatiaLite.dll.so => 259
	i64 u0x902d31dbd7d7d78e, ; 785: InputKit.Maui => 203
	i64 u0x903101b46fb73a04, ; 786: _Microsoft.Android.Resource.Designer => 458
	i64 u0x90393bd4865292f3, ; 787: lib_System.IO.Compression.dll.so => 46
	i64 u0x905e2b8e7ae91ae6, ; 788: System.Threading.Tasks.Extensions.dll => 143
	i64 u0x90634f86c5ebe2b5, ; 789: Xamarin.AndroidX.Lifecycle.ViewModel.Android => 339
	i64 u0x907b636704ad79ef, ; 790: lib_Microsoft.Maui.Controls.Xaml.dll.so => 252
	i64 u0x90e9efbfd68593e0, ; 791: lib_Xamarin.AndroidX.Lifecycle.LiveData.dll.so => 330
	i64 u0x91418dc638b29e68, ; 792: lib_Xamarin.AndroidX.CustomView.dll.so => 316
	i64 u0x9157bd523cd7ed36, ; 793: lib_System.Text.Json.dll.so => 138
	i64 u0x91a74f07b30d37e2, ; 794: System.Linq.dll => 62
	i64 u0x91cb86ea3b17111d, ; 795: System.ServiceModel.Web => 132
	i64 u0x91fa41a87223399f, ; 796: ca/Microsoft.Maui.Controls.resources.dll => 412
	i64 u0x92054e486c0c7ea7, ; 797: System.IO.FileSystem.DriveInfo => 48
	i64 u0x928614058c40c4cd, ; 798: lib_System.Xml.XPath.XDocument.dll.so => 160
	i64 u0x92a698e6d582778f, ; 799: Xamarin.Firebase.Components.dll => 370
	i64 u0x92b138fffca2b01e, ; 800: lib_Xamarin.AndroidX.Arch.Core.Runtime.dll.so => 299
	i64 u0x92dfc2bfc6c6a888, ; 801: Xamarin.AndroidX.Lifecycle.LiveData => 330
	i64 u0x933da2c779423d68, ; 802: Xamarin.Android.Glide.Annotations => 288
	i64 u0x93489853b6098685, ; 803: es/Microsoft.Data.SqlClient.resources.dll => 400
	i64 u0x9388aad9b7ae40ce, ; 804: lib_Xamarin.AndroidX.Lifecycle.Common.dll.so => 328
	i64 u0x93cfa73ab28d6e35, ; 805: ms/Microsoft.Maui.Controls.resources => 428
	i64 u0x941c00d21e5c0679, ; 806: lib_Xamarin.AndroidX.Transition.dll.so => 359
	i64 u0x944077d8ca3c6580, ; 807: System.IO.Compression.dll => 46
	i64 u0x948cffedc8ed7960, ; 808: System.Xml => 164
	i64 u0x948d746a7702861f, ; 809: Microsoft.IdentityModel.Logging.dll => 246
	i64 u0x94c8990839c4bdb1, ; 810: lib_Xamarin.AndroidX.Interpolator.dll.so => 326
	i64 u0x9502fd818eed2359, ; 811: lib_Microsoft.IdentityModel.Protocols.OpenIdConnect.dll.so => 248
	i64 u0x9564283c37ed59a9, ; 812: lib_Microsoft.IdentityModel.Logging.dll.so => 246
	i64 u0x95c6b36f5f5d7039, ; 813: Xamarin.AndroidX.Camera.Camera2 => 301
	i64 u0x95d757769563d0d3, ; 814: Xamarin.AndroidX.Camera.Lifecycle.dll => 303
	i64 u0x965d480cfb8de46d, ; 815: pl/Microsoft.Data.SqlClient.resources.dll => 405
	i64 u0x967fc325e09bfa8c, ; 816: es/Microsoft.Maui.Controls.resources => 417
	i64 u0x9686161486d34b81, ; 817: lib_Xamarin.AndroidX.ExifInterface.dll.so => 323
	i64 u0x96e49b31fe33d427, ; 818: Microsoft.Identity.Client.Extensions.Msal => 243
	i64 u0x9729c8c4c069c478, ; 819: Google.Apis.Core => 192
	i64 u0x9732d8dbddea3d9a, ; 820: id/Microsoft.Maui.Controls.resources => 424
	i64 u0x978be80e5210d31b, ; 821: Microsoft.Maui.Graphics.dll => 255
	i64 u0x979ab54025cc1c7f, ; 822: lib_Xamarin.GooglePlayServices.Base.dll.so => 379
	i64 u0x97b8c771ea3e4220, ; 823: System.ComponentModel.dll => 18
	i64 u0x97e144c9d3c6976e, ; 824: System.Collections.Concurrent.dll => 8
	i64 u0x97e55f96df4ddd72, ; 825: lib_Xamarin.Firebase.Annotations.dll.so => 367
	i64 u0x984184e3c70d4419, ; 826: GoogleGson => 198
	i64 u0x9843944103683dd3, ; 827: Xamarin.AndroidX.Core.Core.Ktx => 314
	i64 u0x98d720cc4597562c, ; 828: System.Security.Cryptography.OpenSsl => 124
	i64 u0x99052c1297204af4, ; 829: lib_Xamarin.AndroidX.Camera.Core.dll.so => 302
	i64 u0x991d510397f92d9d, ; 830: System.Linq.Expressions => 59
	i64 u0x993cc632e821c001, ; 831: Microsoft.Maui.Controls.Compatibility => 250
	i64 u0x996ceeb8a3da3d67, ; 832: System.Threading.Overlapped.dll => 141
	i64 u0x999cb19e1a04ffd3, ; 833: CommunityToolkit.Mvvm.dll => 179
	i64 u0x99a00ca5270c6878, ; 834: Xamarin.AndroidX.Navigation.Runtime => 346
	i64 u0x99a8098eef99f8b4, ; 835: Oracle.ManagedDataAccess.dll => 265
	i64 u0x99cdc6d1f2d3a72f, ; 836: ko/Microsoft.Maui.Controls.resources.dll => 427
	i64 u0x9a01b1da98b6ee10, ; 837: Xamarin.AndroidX.Lifecycle.Runtime.dll => 334
	i64 u0x9a0cc42c6f36dfc9, ; 838: lib_Microsoft.IdentityModel.Protocols.dll.so => 247
	i64 u0x9a5ccc274fd6e6ee, ; 839: Jsr305Binding.dll => 375
	i64 u0x9a8abd23ef81c977, ; 840: NetTopologySuite.dll => 258
	i64 u0x9acfd25e735d5594, ; 841: lib_Npgsql.dll.so => 262
	i64 u0x9ae6940b11c02876, ; 842: lib_Xamarin.AndroidX.Window.dll.so => 365
	i64 u0x9af128bb65641ae6, ; 843: NetTopologySuite.IO.SpatiaLite.dll => 259
	i64 u0x9b211a749105beac, ; 844: System.Transactions.Local => 150
	i64 u0x9b8734714671022d, ; 845: System.Threading.Tasks.Dataflow.dll => 142
	i64 u0x9bc6aea27fbf034f, ; 846: lib_Xamarin.KotlinX.Coroutines.Core.dll.so => 390
	i64 u0x9bd8cc74558ad4c7, ; 847: Xamarin.KotlinX.AtomicFU => 387
	i64 u0x9c08d13c4e6dfa63, ; 848: Microsoft.EntityFrameworkCore.SqlServer.Abstractions => 228
	i64 u0x9c244ac7cda32d26, ; 849: System.Security.Cryptography.X509Certificates.dll => 126
	i64 u0x9c465f280cf43733, ; 850: lib_Xamarin.KotlinX.Coroutines.Android.dll.so => 389
	i64 u0x9c4dd9126a77a711, ; 851: Xamarin.Firebase.Installations.InterOp => 372
	i64 u0x9c8f6872beab6408, ; 852: System.Xml.XPath.XDocument.dll => 160
	i64 u0x9cded46e202841cc, ; 853: NetTopologySuite.IO.SqlServerBytes.dll => 260
	i64 u0x9ce01cf91101ae23, ; 854: System.Xml.XmlDocument => 162
	i64 u0x9d128180c81d7ce6, ; 855: Xamarin.AndroidX.CustomView.PoolingContainer => 317
	i64 u0x9d5dbcf5a48583fe, ; 856: lib_Xamarin.AndroidX.Activity.dll.so => 291
	i64 u0x9d74dee1a7725f34, ; 857: Microsoft.Extensions.Configuration.Abstractions.dll => 233
	i64 u0x9da48bf5f6df6c80, ; 858: UraniumUI.dll => 285
	i64 u0x9e4534b6adaf6e84, ; 859: nl/Microsoft.Maui.Controls.resources => 430
	i64 u0x9e4b95dec42769f7, ; 860: System.Diagnostics.Debug.dll => 26
	i64 u0x9eaf1efdf6f7267e, ; 861: Xamarin.AndroidX.Navigation.Common.dll => 344
	i64 u0x9ef542cf1f78c506, ; 862: Xamarin.AndroidX.Lifecycle.LiveData.Core => 331
	i64 u0x9fba0d4c57451526, ; 863: ko/Microsoft.SqlServer.Types.resources => 450
	i64 u0x9ff334e3cf272fd6, ; 864: lib_Xamarin.AndroidX.Camera.Lifecycle.dll.so => 303
	i64 u0x9ffbb6b1434ad2df, ; 865: Microsoft.Identity.Client.dll => 242
	i64 u0xa00832eb975f56a8, ; 866: lib_System.Net.dll.so => 82
	i64 u0xa033e501b291e851, ; 867: itext.kernel => 208
	i64 u0xa0ad78236b7b267f, ; 868: Xamarin.AndroidX.Window => 365
	i64 u0xa0d8259f4cc284ec, ; 869: lib_System.Security.Cryptography.dll.so => 127
	i64 u0xa0e17ca50c77a225, ; 870: lib_Xamarin.Google.Crypto.Tink.Android.dll.so => 376
	i64 u0xa0ff9b3e34d92f11, ; 871: lib_System.Resources.Writer.dll.so => 101
	i64 u0xa12fbfb4da97d9f3, ; 872: System.Threading.Timer.dll => 148
	i64 u0xa13763df740e071e, ; 873: store => 0
	i64 u0xa1440773ee9d341e, ; 874: Xamarin.Google.Android.Material => 373
	i64 u0xa1b9d7c27f47219f, ; 875: Xamarin.AndroidX.Navigation.UI.dll => 347
	i64 u0xa1cfec8d4a8d7c32, ; 876: Npgsql.EntityFrameworkCore.PostgreSQL.dll => 263
	i64 u0xa2572680829d2c7c, ; 877: System.IO.Pipelines.dll => 54
	i64 u0xa26597e57ee9c7f6, ; 878: System.Xml.XmlDocument.dll => 162
	i64 u0xa308401900e5bed3, ; 879: lib_mscorlib.dll.so => 167
	i64 u0xa35eeea065361708, ; 880: QuestPDF => 267
	i64 u0xa375c81cb42e7ef8, ; 881: lib_Microsoft.EntityFrameworkCore.SqlServer.Abstractions.dll.so => 228
	i64 u0xa395572e7da6c99d, ; 882: lib_System.Security.dll.so => 131
	i64 u0xa3c64c49e90a9987, ; 883: System.Security.Cryptography.Pkcs => 283
	i64 u0xa3e683f24b43af6f, ; 884: System.Dynamic.Runtime.dll => 37
	i64 u0xa4145becdee3dc4f, ; 885: Xamarin.AndroidX.VectorDrawable.Animated => 361
	i64 u0xa46aa1eaa214539b, ; 886: ko/Microsoft.Maui.Controls.resources => 427
	i64 u0xa4d20d2ff0563d26, ; 887: lib_CommunityToolkit.Mvvm.dll.so => 179
	i64 u0xa4edc8f2ceae241a, ; 888: System.Data.Common.dll => 22
	i64 u0xa526fadd66308051, ; 889: Microsoft.EntityFrameworkCore.SqlServer.dll => 227
	i64 u0xa5494f40f128ce6a, ; 890: System.Runtime.Serialization.Formatters.dll => 112
	i64 u0xa54b74df83dce92b, ; 891: System.Reflection.DispatchProxy => 90
	i64 u0xa579ed010d7e5215, ; 892: Xamarin.AndroidX.DocumentFile => 318
	i64 u0xa581c333c3c7cdb4, ; 893: ja/Microsoft.SqlServer.Types.resources => 449
	i64 u0xa5b7152421ed6d98, ; 894: lib_System.IO.FileSystem.Watcher.dll.so => 50
	i64 u0xa5b931bd164e087b, ; 895: Oracle.EntityFrameworkCore.dll => 264
	i64 u0xa5c3844f17b822db, ; 896: lib_System.Linq.Parallel.dll.so => 60
	i64 u0xa5ce5c755bde8cb8, ; 897: lib_System.Security.Cryptography.Csp.dll.so => 122
	i64 u0xa5e599d1e0524750, ; 898: System.Numerics.Vectors.dll => 83
	i64 u0xa5f1ba49b85dd355, ; 899: System.Security.Cryptography.dll => 127
	i64 u0xa5f1e826b58a6998, ; 900: System.Linq.Async.dll => 280
	i64 u0xa60fdaa9af524b6a, ; 901: Microsoft.DotNet.PlatformAbstractions.dll => 222
	i64 u0xa61975a5a37873ea, ; 902: lib_System.Xml.XmlSerializer.dll.so => 163
	i64 u0xa6593e21584384d2, ; 903: lib_Jsr305Binding.dll.so => 375
	i64 u0xa66cbee0130865f7, ; 904: lib_WindowsBase.dll.so => 166
	i64 u0xa67dbee13e1df9ca, ; 905: Xamarin.AndroidX.SavedState.dll => 352
	i64 u0xa684b098dd27b296, ; 906: lib_Xamarin.AndroidX.Security.SecurityCrypto.dll.so => 354
	i64 u0xa68a420042bb9b1f, ; 907: Xamarin.AndroidX.DrawerLayout.dll => 319
	i64 u0xa6d26156d1cacc7c, ; 908: Xamarin.Android.Glide.dll => 287
	i64 u0xa71fe7d6f6f93efd, ; 909: Microsoft.Data.SqlClient => 220
	i64 u0xa75386b5cb9595aa, ; 910: Xamarin.AndroidX.Lifecycle.Runtime.Android => 335
	i64 u0xa763fbb98df8d9fb, ; 911: lib_Microsoft.Win32.Primitives.dll.so => 4
	i64 u0xa78ce3745383236a, ; 912: Xamarin.AndroidX.Lifecycle.Common.Jvm => 329
	i64 u0xa7c31b56b4dc7b33, ; 913: hu/Microsoft.Maui.Controls.resources => 423
	i64 u0xa7eab29ed44b4e7a, ; 914: Mono.Android.Export => 170
	i64 u0xa8195217cbf017b7, ; 915: Microsoft.VisualBasic.Core => 2
	i64 u0xa843f6095f0d247d, ; 916: Xamarin.GooglePlayServices.Base.dll => 379
	i64 u0xa859a95830f367ff, ; 917: lib_Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll.so => 340
	i64 u0xa87ff9cd1c5ac806, ; 918: lib_MedallionTopologicalSort.dll.so => 217
	i64 u0xa8b52f21e0dbe690, ; 919: System.Runtime.Serialization.dll => 116
	i64 u0xa8e6320dd07580ef, ; 920: lib_Microsoft.IdentityModel.JsonWebTokens.dll.so => 245
	i64 u0xa8ee4ed7de2efaee, ; 921: Xamarin.AndroidX.Annotation.dll => 293
	i64 u0xa952cc4a0d808a59, ; 922: lib_Google.Api.CommonProtos.dll.so => 186
	i64 u0xa95590e7c57438a4, ; 923: System.Configuration => 19
	i64 u0xa964304b5631e28a, ; 924: CommunityToolkit.Maui.Core.dll => 178
	i64 u0xaa2219c8e3449ff5, ; 925: Microsoft.Extensions.Logging.Abstractions => 238
	i64 u0xaa2de94d374e55df, ; 926: Xamarin.Firebase.Common.Ktx => 369
	i64 u0xaa443ac34067eeef, ; 927: System.Private.Xml.dll => 89
	i64 u0xaa52de307ef5d1dd, ; 928: System.Net.Http => 65
	i64 u0xaa9a7b0214a5cc5c, ; 929: System.Diagnostics.StackTrace.dll => 30
	i64 u0xaaaf86367285a918, ; 930: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 235
	i64 u0xaaf84bb3f052a265, ; 931: el/Microsoft.Maui.Controls.resources => 416
	i64 u0xab375658f5084c9f, ; 932: lib_Google.Cloud.Firestore.dll.so => 193
	i64 u0xab9af77b5b67a0b8, ; 933: Xamarin.AndroidX.ConstraintLayout.Core => 311
	i64 u0xab9c1b2687d86b0b, ; 934: lib_System.Linq.Expressions.dll.so => 59
	i64 u0xabc4d26016505655, ; 935: lib_Microsoft.SqlServer.Types.dll.so => 257
	i64 u0xac2af3fa195a15ce, ; 936: System.Runtime.Numerics => 111
	i64 u0xac5376a2a538dc10, ; 937: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 331
	i64 u0xac5acae88f60357e, ; 938: System.Diagnostics.Tools.dll => 32
	i64 u0xac65e40f62b6b90e, ; 939: Google.Protobuf => 197
	i64 u0xac79c7e46047ad98, ; 940: System.Security.Principal.Windows.dll => 128
	i64 u0xac98d31068e24591, ; 941: System.Xml.XDocument => 159
	i64 u0xacd46e002c3ccb97, ; 942: ro/Microsoft.Maui.Controls.resources => 434
	i64 u0xacda2fab67639416, ; 943: Xamarin.Firebase.Installations => 371
	i64 u0xacdd9e4180d56dda, ; 944: Xamarin.AndroidX.Concurrent.Futures => 309
	i64 u0xacf42eea7ef9cd12, ; 945: System.Threading.Channels => 140
	i64 u0xacf6fdf873a3ce67, ; 946: lib_itext.bouncy-castle-connector.dll.so => 205
	i64 u0xad7e82ed3b0f16d0, ; 947: lib_Xamarin.AndroidX.DocumentFile.dll.so => 318
	i64 u0xad89c07347f1bad6, ; 948: nl/Microsoft.Maui.Controls.resources.dll => 430
	i64 u0xadbb53caf78a79d2, ; 949: System.Web.HttpUtility => 153
	i64 u0xadc90ab061a9e6e4, ; 950: System.ComponentModel.TypeConverter.dll => 17
	i64 u0xadca1b9030b9317e, ; 951: Xamarin.AndroidX.Collection.Ktx => 308
	i64 u0xadd8eda2edf396ad, ; 952: Xamarin.Android.Glide.GifDecoder => 290
	i64 u0xadf4cf30debbeb9a, ; 953: System.Net.ServicePoint.dll => 75
	i64 u0xadf511667bef3595, ; 954: System.Net.Security => 74
	i64 u0xae0aaa94fdcfce0f, ; 955: System.ComponentModel.EventBasedAsync.dll => 15
	i64 u0xae282bcd03739de7, ; 956: Java.Interop => 169
	i64 u0xae53579c90db1107, ; 957: System.ObjectModel.dll => 85
	i64 u0xaeb080014622ef84, ; 958: Xamarin.JavaX.Inject => 382
	i64 u0xaec7c0c7e2ed4575, ; 959: lib_Xamarin.KotlinX.AtomicFU.Jvm.dll.so => 388
	i64 u0xaf12fb8133ac3fbb, ; 960: Microsoft.EntityFrameworkCore.Sqlite => 226
	i64 u0xaf2e760f9c91cb86, ; 961: itext.layout => 209
	i64 u0xaf732d0b2193b8f5, ; 962: System.Security.Cryptography.OpenSsl.dll => 124
	i64 u0xafdb94dbccd9d11c, ; 963: Xamarin.AndroidX.Lifecycle.LiveData.dll => 330
	i64 u0xafe29f45095518e7, ; 964: lib_Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll.so => 341
	i64 u0xb03ae931fb25607e, ; 965: Xamarin.AndroidX.ConstraintLayout => 310
	i64 u0xb05cc42cd94c6d9d, ; 966: lib-sv-Microsoft.Maui.Controls.resources.dll.so => 437
	i64 u0xb0ac21bec8f428c5, ; 967: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.Android.dll => 337
	i64 u0xb0bb43dc52ea59f9, ; 968: System.Diagnostics.Tracing.dll => 34
	i64 u0xb1dd05401aa8ee63, ; 969: System.Security.AccessControl => 118
	i64 u0xb220631954820169, ; 970: System.Text.RegularExpressions => 139
	i64 u0xb2376e1dbf8b4ed7, ; 971: System.Security.Cryptography.Csp => 122
	i64 u0xb27d64a740cc8c9c, ; 972: lib_itext.styledxmlparser.dll.so => 213
	i64 u0xb2a1959fe95c5402, ; 973: lib_System.Runtime.InteropServices.JavaScript.dll.so => 106
	i64 u0xb2a3f67f3bf29fce, ; 974: da/Microsoft.Maui.Controls.resources => 414
	i64 u0xb2d3ad98fce223fd, ; 975: UraniumUI.Material => 286
	i64 u0xb3005ac9c8a035c5, ; 976: lib_Xamarin.JavaX.Inject.dll.so => 382
	i64 u0xb3011a0a57f7ffb2, ; 977: Microsoft.VisualStudio.DesignTools.MobileTapContracts.dll => 456
	i64 u0xb3874072ee0ecf8c, ; 978: Xamarin.AndroidX.VectorDrawable.Animated.dll => 361
	i64 u0xb398860d6ed7ba2f, ; 979: System.Security.Cryptography.ProtectedData => 284
	i64 u0xb39eed1decc0cd95, ; 980: Google.Api.Gax.dll => 187
	i64 u0xb3f0a0fcda8d3ebc, ; 981: Xamarin.AndroidX.CardView => 305
	i64 u0xb4512edf6d2b372b, ; 982: Google.Cloud.Location => 195
	i64 u0xb46be1aa6d4fff93, ; 983: hi/Microsoft.Maui.Controls.resources => 421
	i64 u0xb477491be13109d8, ; 984: ar/Microsoft.Maui.Controls.resources => 411
	i64 u0xb4bd7015ecee9d86, ; 985: System.IO.Pipelines => 54
	i64 u0xb4c53d9749c5f226, ; 986: lib_System.IO.FileSystem.AccessControl.dll.so => 47
	i64 u0xb4c8142c581fa7a2, ; 987: itext.forms.dll => 206
	i64 u0xb4ff710863453fda, ; 988: System.Diagnostics.FileVersionInfo.dll => 28
	i64 u0xb50d9ae4eea71e97, ; 989: lib_Microsoft.DotNet.PlatformAbstractions.dll.so => 222
	i64 u0xb5c38bf497a4cfe2, ; 990: lib_System.Threading.Tasks.dll.so => 145
	i64 u0xb5c7fcdafbc67ee4, ; 991: Microsoft.Extensions.Logging.Abstractions.dll => 238
	i64 u0xb5e2ea1bb00704d6, ; 992: Xamarin.Kotlin.StdLib.Jdk7.dll => 385
	i64 u0xb5ea31d5244c6626, ; 993: System.Threading.ThreadPool.dll => 147
	i64 u0xb6ca291529a2056e, ; 994: MedallionTopologicalSort.dll => 217
	i64 u0xb71e58d502bd29dc, ; 995: itext.styledxmlparser.dll => 213
	i64 u0xb7212c4683a94afe, ; 996: System.Drawing.Primitives => 35
	i64 u0xb7b7753d1f319409, ; 997: sv/Microsoft.Maui.Controls.resources => 437
	i64 u0xb81a2c6e0aee50fe, ; 998: lib_System.Private.CoreLib.dll.so => 173
	i64 u0xb898d1802c1a108c, ; 999: lib_System.Management.dll.so => 281
	i64 u0xb8b0a9b3dfbc5cb7, ; 1000: Xamarin.AndroidX.Window.Extensions.Core.Core => 366
	i64 u0xb8c60af47c08d4da, ; 1001: System.Net.ServicePoint => 75
	i64 u0xb8e68d20aad91196, ; 1002: lib_System.Xml.XPath.dll.so => 161
	i64 u0xb90ff82c284e9af9, ; 1003: Grpc.Core.Api => 200
	i64 u0xb9185c33a1643eed, ; 1004: Microsoft.CSharp.dll => 1
	i64 u0xb97187307f9dba5e, ; 1005: Xamarin.KotlinX.Coroutines.Play.Services.dll => 392
	i64 u0xb9b8001adf4ed7cc, ; 1006: lib_Xamarin.AndroidX.SlidingPaneLayout.dll.so => 355
	i64 u0xb9f64d3b230def68, ; 1007: lib-pt-Microsoft.Maui.Controls.resources.dll.so => 433
	i64 u0xb9fc3c8a556e3691, ; 1008: ja/Microsoft.Maui.Controls.resources => 426
	i64 u0xba0f52acac7e7a84, ; 1009: itext.kernel.dll => 208
	i64 u0xba4670aa94a2b3c6, ; 1010: lib_System.Xml.XDocument.dll.so => 159
	i64 u0xba48785529705af9, ; 1011: System.Collections.dll => 12
	i64 u0xba965b8c86359996, ; 1012: lib_System.Windows.dll.so => 155
	i64 u0xbb286883bc35db36, ; 1013: System.Transactions.dll => 151
	i64 u0xbb6026d73f757bcf, ; 1014: Google.Api.Gax.Grpc => 188
	i64 u0xbb65706fde942ce3, ; 1015: System.Net.Sockets => 76
	i64 u0xbb6dc0b35452c1a0, ; 1016: ZXing.Net.MAUI.dll => 396
	i64 u0xbb8c8d165ef11460, ; 1017: lib_Microsoft.Identity.Client.Extensions.Msal.dll.so => 243
	i64 u0xbba28979413cad9e, ; 1018: lib_System.Runtime.CompilerServices.VisualC.dll.so => 103
	i64 u0xbbd180354b67271a, ; 1019: System.Runtime.Serialization.Formatters => 112
	i64 u0xbc22a245dab70cb4, ; 1020: lib_SQLitePCLRaw.provider.e_sqlite3.dll.so => 271
	i64 u0xbc260cdba33291a3, ; 1021: Xamarin.AndroidX.Arch.Core.Common.dll => 298
	i64 u0xbc41034a90e7d095, ; 1022: lib_itext.forms.dll.so => 206
	i64 u0xbcd22b365b764643, ; 1023: lib-zh-Hans-Microsoft.Data.SqlClient.resources.dll.so => 409
	i64 u0xbcef2cc19d49603f, ; 1024: EFCore.BulkExtensions.PostgreSql.dll => 182
	i64 u0xbd0aaf9dbfcc3376, ; 1025: fr/Microsoft.Data.SqlClient.resources.dll => 401
	i64 u0xbd0e2c0d55246576, ; 1026: System.Net.Http.dll => 65
	i64 u0xbd3c2d7a8325e11b, ; 1027: lib-fr-Microsoft.Data.SqlClient.resources.dll.so => 401
	i64 u0xbd3fbd85b9e1cb29, ; 1028: lib_System.Net.HttpListener.dll.so => 66
	i64 u0xbd437a2cdb333d0d, ; 1029: Xamarin.AndroidX.ViewPager2 => 364
	i64 u0xbd4aef17dbfb0390, ; 1030: ru/Microsoft.Data.SqlClient.resources => 407
	i64 u0xbd4f572d2bd0a789, ; 1031: System.IO.Compression.ZipFile.dll => 45
	i64 u0xbd5d0b88d3d647a5, ; 1032: lib_Xamarin.AndroidX.Browser.dll.so => 300
	i64 u0xbd7d91e34beaf455, ; 1033: itext.sign.dll => 212
	i64 u0xbd877b14d0b56392, ; 1034: System.Runtime.Intrinsics.dll => 109
	i64 u0xbe08e3083025c53d, ; 1035: ZXing.Net.MAUI.Controls.dll => 397
	i64 u0xbe532a80075c3dc8, ; 1036: Xamarin.AndroidX.Camera.Core.dll => 302
	i64 u0xbe65a49036345cf4, ; 1037: lib_System.Buffers.dll.so => 7
	i64 u0xbee38d4a88835966, ; 1038: Xamarin.AndroidX.AppCompat.AppCompatResources => 297
	i64 u0xbef9919db45b4ca7, ; 1039: System.IO.Pipes.AccessControl => 55
	i64 u0xbf0fa68611139208, ; 1040: lib_Xamarin.AndroidX.Annotation.dll.so => 293
	i64 u0xbfc1e1fb3095f2b3, ; 1041: lib_System.Net.Http.Json.dll.so => 64
	i64 u0xc040a4ab55817f58, ; 1042: ar/Microsoft.Maui.Controls.resources.dll => 411
	i64 u0xc07cadab29efeba0, ; 1043: Xamarin.AndroidX.Core.Core.Ktx.dll => 314
	i64 u0xc0ca0108a1384ed5, ; 1044: lib_EFCore.BulkExtensions.Core.dll.so => 180
	i64 u0xc0d928351ab5ca77, ; 1045: System.Console.dll => 20
	i64 u0xc0f5a221a9383aea, ; 1046: System.Runtime.Intrinsics => 109
	i64 u0xc111030af54d7191, ; 1047: System.Resources.Writer => 101
	i64 u0xc1182977a92df85f, ; 1048: lib-fr-Microsoft.SqlServer.Types.resources.dll.so => 447
	i64 u0xc12b8b3afa48329c, ; 1049: lib_System.Linq.dll.so => 62
	i64 u0xc1649f545b2f76aa, ; 1050: Grpc.Auth => 199
	i64 u0xc183ca0b74453aa9, ; 1051: lib_System.Threading.Tasks.Dataflow.dll.so => 142
	i64 u0xc1c2cb7af77b8858, ; 1052: Microsoft.EntityFrameworkCore => 223
	i64 u0xc1ff9ae3cdb6e1e6, ; 1053: Xamarin.AndroidX.Activity.dll => 291
	i64 u0xc2260e1da1054ac1, ; 1054: lib_BouncyCastle.Cryptography.dll.so => 176
	i64 u0xc26c064effb1dea9, ; 1055: System.Buffers.dll => 7
	i64 u0xc278de356ad8a9e3, ; 1056: Microsoft.IdentityModel.Logging => 246
	i64 u0xc2850fbba221599d, ; 1057: lib_Google.Apis.Core.dll.so => 192
	i64 u0xc28c50f32f81cc73, ; 1058: ja/Microsoft.Maui.Controls.resources.dll => 426
	i64 u0xc2902f6cf5452577, ; 1059: lib_Mono.Android.Export.dll.so => 170
	i64 u0xc2a3bca55b573141, ; 1060: System.IO.FileSystem.Watcher => 50
	i64 u0xc2bcfec99f69365e, ; 1061: Xamarin.AndroidX.ViewPager2.dll => 364
	i64 u0xc2eb95e1f02ee46b, ; 1062: it/Microsoft.SqlServer.Types.resources.dll => 448
	i64 u0xc30b52815b58ac2c, ; 1063: lib_System.Runtime.Serialization.Xml.dll.so => 115
	i64 u0xc3492f8f90f96ce4, ; 1064: lib_Microsoft.Extensions.DependencyModel.dll.so => 236
	i64 u0xc36d7d89c652f455, ; 1065: System.Threading.Overlapped => 141
	i64 u0xc396b285e59e5493, ; 1066: GoogleGson.dll => 198
	i64 u0xc3c86c1e5e12f03d, ; 1067: WindowsBase => 166
	i64 u0xc3f0e03e56ce7b69, ; 1068: zxing => 395
	i64 u0xc421b61fd853169d, ; 1069: lib_System.Net.WebSockets.Client.dll.so => 80
	i64 u0xc463e077917aa21d, ; 1070: System.Runtime.Serialization.Json => 113
	i64 u0xc472ce300460ccb6, ; 1071: Microsoft.EntityFrameworkCore.dll => 223
	i64 u0xc4d3858ed4d08512, ; 1072: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 341
	i64 u0xc4d69851fe06342f, ; 1073: lib_Microsoft.Extensions.Caching.Memory.dll.so => 231
	i64 u0xc50fded0ded1418c, ; 1074: lib_System.ComponentModel.TypeConverter.dll.so => 17
	i64 u0xc519125d6bc8fb11, ; 1075: lib_System.Net.Requests.dll.so => 73
	i64 u0xc5293b19e4dc230e, ; 1076: Xamarin.AndroidX.Navigation.Fragment => 345
	i64 u0xc5325b2fcb37446f, ; 1077: lib_System.Private.Xml.dll.so => 89
	i64 u0xc535cb9a21385d9b, ; 1078: lib_Xamarin.Android.Glide.DiskLruCache.dll.so => 289
	i64 u0xc583d8477b5d3bac, ; 1079: zh-Hant/Microsoft.Data.SqlClient.resources.dll => 410
	i64 u0xc5a0f4b95a699af7, ; 1080: lib_System.Private.Uri.dll.so => 87
	i64 u0xc5cdcd5b6277579e, ; 1081: lib_System.Security.Cryptography.Algorithms.dll.so => 120
	i64 u0xc5d608afb58abba2, ; 1082: Google.Apis.Auth.dll => 191
	i64 u0xc5ec286825cb0bf4, ; 1083: Xamarin.AndroidX.Tracing.Tracing => 358
	i64 u0xc6706bc8aa7fe265, ; 1084: Xamarin.AndroidX.Annotation.Jvm => 295
	i64 u0xc7c01e7d7c93a110, ; 1085: System.Text.Encoding.Extensions.dll => 135
	i64 u0xc7ce851898a4548e, ; 1086: lib_System.Web.HttpUtility.dll.so => 153
	i64 u0xc809d4089d2556b2, ; 1087: System.Runtime.InteropServices.JavaScript.dll => 106
	i64 u0xc858a28d9ee5a6c5, ; 1088: lib_System.Collections.Specialized.dll.so => 11
	i64 u0xc8ac7c6bf1c2ec51, ; 1089: System.Reflection.DispatchProxy.dll => 90
	i64 u0xc95a1178aef91462, ; 1090: lib_Microsoft.EntityFrameworkCore.SqlServer.HierarchyId.dll.so => 229
	i64 u0xc9c62c8f354ac568, ; 1091: lib_System.Diagnostics.TextWriterTraceListener.dll.so => 31
	i64 u0xc9d61d6a8d51fe6c, ; 1092: lib_NetTopologySuite.IO.SqlServerBytes.dll.so => 260
	i64 u0xc9e54b32fc19baf3, ; 1093: lib_CommunityToolkit.Maui.dll.so => 177
	i64 u0xca32340d8d54dcd5, ; 1094: Microsoft.Extensions.Caching.Memory.dll => 231
	i64 u0xca3a723e7342c5b6, ; 1095: lib-tr-Microsoft.Maui.Controls.resources.dll.so => 439
	i64 u0xca5801070d9fccfb, ; 1096: System.Text.Encoding => 136
	i64 u0xcab3493c70141c2d, ; 1097: pl/Microsoft.Maui.Controls.resources => 431
	i64 u0xcacfddc9f7c6de76, ; 1098: ro/Microsoft.Maui.Controls.resources.dll => 434
	i64 u0xcadbc92899a777f0, ; 1099: Xamarin.AndroidX.Startup.StartupRuntime => 356
	i64 u0xcb45618372c47127, ; 1100: Microsoft.EntityFrameworkCore.Relational => 225
	i64 u0xcb6f731cbdfa3dd8, ; 1101: Npgsql.EntityFrameworkCore.PostgreSQL => 263
	i64 u0xcba1cb79f45292b5, ; 1102: Xamarin.Android.Glide.GifDecoder.dll => 290
	i64 u0xcbb5f80c7293e696, ; 1103: lib_System.Globalization.Calendars.dll.so => 40
	i64 u0xcbd4fdd9cef4a294, ; 1104: lib__Microsoft.Android.Resource.Designer.dll.so => 458
	i64 u0xcc15da1e07bbd994, ; 1105: Xamarin.AndroidX.SlidingPaneLayout => 355
	i64 u0xcc182c3afdc374d6, ; 1106: Microsoft.Bcl.AsyncInterfaces => 218
	i64 u0xcc2876b32ef2794c, ; 1107: lib_System.Text.RegularExpressions.dll.so => 139
	i64 u0xcc5c3bb714c4561e, ; 1108: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 391
	i64 u0xcc76886e09b88260, ; 1109: Xamarin.KotlinX.Serialization.Core.Jvm.dll => 394
	i64 u0xcc9fa2923aa1c9ef, ; 1110: System.Diagnostics.Contracts.dll => 25
	i64 u0xccf25c4b634ccd3a, ; 1111: zh-Hans/Microsoft.Maui.Controls.resources.dll => 443
	i64 u0xcd10a42808629144, ; 1112: System.Net.Requests => 73
	i64 u0xcd235365bb1cf97f, ; 1113: lib_itext.svg.dll.so => 214
	i64 u0xcdca1b920e9f53ba, ; 1114: Xamarin.AndroidX.Interpolator => 326
	i64 u0xcdd0c48b6937b21c, ; 1115: Xamarin.AndroidX.SwipeRefreshLayout => 357
	i64 u0xce366153aaa26f70, ; 1116: System.DirectoryServices.Protocols.dll => 278
	i64 u0xce9594d842cf35a9, ; 1117: lib_Xamarin.Firebase.Common.Ktx.dll.so => 369
	i64 u0xceb28d385f84f441, ; 1118: Azure.Core.dll => 174
	i64 u0xcf140ed700bc8e66, ; 1119: Microsoft.SqlServer.Server.dll => 256
	i64 u0xcf1f7a2359f1a539, ; 1120: Xamarin.JavaX.Inject.dll => 382
	i64 u0xcf23d8093f3ceadf, ; 1121: System.Diagnostics.DiagnosticSource.dll => 27
	i64 u0xcf4d55b5fe223cd6, ; 1122: NetTopologySuite.IO.SqlServerBytes => 260
	i64 u0xcf5ff6b6b2c4c382, ; 1123: System.Net.Mail.dll => 67
	i64 u0xcf8fc898f98b0d34, ; 1124: System.Private.Xml.Linq => 88
	i64 u0xcfa869564d903308, ; 1125: EFCore.BulkExtensions.Core => 180
	i64 u0xd04b5f59ed596e31, ; 1126: System.Reflection.Metadata.dll => 95
	i64 u0xd063299fcfc0c93f, ; 1127: lib_System.Runtime.Serialization.Json.dll.so => 113
	i64 u0xd0af5414344dd23a, ; 1128: itext.io => 207
	i64 u0xd0de8a113e976700, ; 1129: System.Diagnostics.TextWriterTraceListener => 31
	i64 u0xd0fc33d5ae5d4cb8, ; 1130: System.Runtime.Extensions => 104
	i64 u0xd1194e1d8a8de83c, ; 1131: lib_Xamarin.AndroidX.Lifecycle.Common.Jvm.dll.so => 329
	i64 u0xd12beacdfc14f696, ; 1132: System.Dynamic.Runtime => 37
	i64 u0xd198e7ce1b6a8344, ; 1133: System.Net.Quic.dll => 72
	i64 u0xd1dcf65a5c5b2e92, ; 1134: itext.pdfa => 210
	i64 u0xd22a0c4630f2fe66, ; 1135: lib_System.Security.Cryptography.ProtectedData.dll.so => 284
	i64 u0xd2b39754bb800974, ; 1136: es/Microsoft.SqlServer.Types.resources => 446
	i64 u0xd2dffb59201927bd, ; 1137: de/Microsoft.Data.SqlClient.resources.dll => 399
	i64 u0xd3144156a3727ebe, ; 1138: Xamarin.Google.Guava.ListenableFuture => 378
	i64 u0xd333d0af9e423810, ; 1139: System.Runtime.InteropServices => 108
	i64 u0xd33a415cb4278969, ; 1140: System.Security.Cryptography.Encoding.dll => 123
	i64 u0xd3426d966bb704f5, ; 1141: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 297
	i64 u0xd3651b6fc3125825, ; 1142: System.Private.Uri.dll => 87
	i64 u0xd373685349b1fe8b, ; 1143: Microsoft.Extensions.Logging.dll => 237
	i64 u0xd3801faafafb7698, ; 1144: System.Private.DataContractSerialization.dll => 86
	i64 u0xd3e4c8d6a2d5d470, ; 1145: it/Microsoft.Maui.Controls.resources => 425
	i64 u0xd3edcc1f25459a50, ; 1146: System.Reflection.Emit => 93
	i64 u0xd42655883bb8c19f, ; 1147: Microsoft.EntityFrameworkCore.Abstractions.dll => 224
	i64 u0xd4645626dffec99d, ; 1148: lib_Microsoft.Extensions.DependencyInjection.Abstractions.dll.so => 235
	i64 u0xd4fa0abb79079ea9, ; 1149: System.Security.Principal.dll => 129
	i64 u0xd5507e11a2b2839f, ; 1150: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 341
	i64 u0xd567f168deeeaf3c, ; 1151: lib_zxing.dll.so => 395
	i64 u0xd5858610826f1c08, ; 1152: lib-ru-Microsoft.Data.SqlClient.resources.dll.so => 407
	i64 u0xd5d04bef8478ea19, ; 1153: Xamarin.AndroidX.Tracing.Tracing.dll => 358
	i64 u0xd60815f26a12e140, ; 1154: Microsoft.Extensions.Logging.Debug.dll => 239
	i64 u0xd63b432ec9306914, ; 1155: zxing.dll => 395
	i64 u0xd64f50eb4ba264b3, ; 1156: lib_Google.LongRunning.dll.so => 196
	i64 u0xd65786d27a4ad960, ; 1157: lib_Microsoft.Maui.Controls.HotReload.Forms.dll.so => 455
	i64 u0xd6694f8359737e4e, ; 1158: Xamarin.AndroidX.SavedState => 352
	i64 u0xd67e431fe2ca996e, ; 1159: zh-Hans/Microsoft.SqlServer.Types.resources.dll => 453
	i64 u0xd6949e129339eae5, ; 1160: lib_Xamarin.AndroidX.Core.Core.Ktx.dll.so => 314
	i64 u0xd6d21782156bc35b, ; 1161: Xamarin.AndroidX.SwipeRefreshLayout.dll => 357
	i64 u0xd6de019f6af72435, ; 1162: Xamarin.AndroidX.ConstraintLayout.Core.dll => 311
	i64 u0xd70956d1e6deefb9, ; 1163: Jsr305Binding => 375
	i64 u0xd71fa7ed9848efec, ; 1164: lib_itext.bouncy-castle-adapter.dll.so => 215
	i64 u0xd72329819cbbbc44, ; 1165: lib_Microsoft.Extensions.Configuration.Abstractions.dll.so => 233
	i64 u0xd72c760af136e863, ; 1166: System.Xml.XmlSerializer.dll => 163
	i64 u0xd753f071e44c2a03, ; 1167: lib_System.Security.SecureString.dll.so => 130
	i64 u0xd7b3764ada9d341d, ; 1168: lib_Microsoft.Extensions.Logging.Abstractions.dll.so => 238
	i64 u0xd7f0088bc5ad71f2, ; 1169: Xamarin.AndroidX.VersionedParcelable => 362
	i64 u0xd8113d9a7e8ad136, ; 1170: System.CodeDom => 273
	i64 u0xd8fb25e28ae30a12, ; 1171: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 349
	i64 u0xd9d04d95a2671e29, ; 1172: lib_ZXing.Net.MAUI.Controls.dll.so => 397
	i64 u0xd9e245a1762ddad5, ; 1173: BouncyCastle.Cryptography => 176
	i64 u0xd9fc7e791253de8f, ; 1174: lib_itext.commons.dll.so => 216
	i64 u0xda1dfa4c534a9251, ; 1175: Microsoft.Extensions.DependencyInjection => 234
	i64 u0xdad05a11827959a3, ; 1176: System.Collections.NonGeneric.dll => 10
	i64 u0xdaefdfe71aa53cf9, ; 1177: System.IO.FileSystem.Primitives => 49
	i64 u0xdb5383ab5865c007, ; 1178: lib-vi-Microsoft.Maui.Controls.resources.dll.so => 441
	i64 u0xdb58816721c02a59, ; 1179: lib_System.Reflection.Emit.ILGeneration.dll.so => 91
	i64 u0xdbc296dc8fc262d3, ; 1180: FirebaseAdmin => 185
	i64 u0xdbeda89f832aa805, ; 1181: vi/Microsoft.Maui.Controls.resources.dll => 441
	i64 u0xdbf2a779fbc3ac31, ; 1182: System.Transactions.Local.dll => 150
	i64 u0xdbf9607a441b4505, ; 1183: System.Linq => 62
	i64 u0xdbfc90157a0de9b0, ; 1184: lib_System.Text.Encoding.dll.so => 136
	i64 u0xdc75032002d1a212, ; 1185: lib_System.Transactions.Local.dll.so => 150
	i64 u0xdca8be7403f92d4f, ; 1186: lib_System.Linq.Queryable.dll.so => 61
	i64 u0xdcbd21904ff0f297, ; 1187: Google.Apis => 190
	i64 u0xdce2c53525640bf3, ; 1188: Microsoft.Extensions.Logging => 237
	i64 u0xdd2b722d78ef5f43, ; 1189: System.Runtime.dll => 117
	i64 u0xdd67031857c72f96, ; 1190: lib_System.Text.Encodings.Web.dll.so => 137
	i64 u0xdd92e229ad292030, ; 1191: System.Numerics.dll => 84
	i64 u0xdddcdd701e911af1, ; 1192: lib_Xamarin.AndroidX.Legacy.Support.Core.Utils.dll.so => 327
	i64 u0xdde30e6b77aa6f6c, ; 1193: lib-zh-Hans-Microsoft.Maui.Controls.resources.dll.so => 443
	i64 u0xde110ae80fa7c2e2, ; 1194: System.Xml.XDocument.dll => 159
	i64 u0xde4726fcdf63a198, ; 1195: Xamarin.AndroidX.Transition => 359
	i64 u0xde572c2b2fb32f93, ; 1196: lib_System.Threading.Tasks.Extensions.dll.so => 143
	i64 u0xde8769ebda7d8647, ; 1197: hr/Microsoft.Maui.Controls.resources.dll => 422
	i64 u0xdee075f3477ef6be, ; 1198: Xamarin.AndroidX.ExifInterface.dll => 323
	i64 u0xdf4b773de8fb1540, ; 1199: System.Net.dll => 82
	i64 u0xdfa254ebb4346068, ; 1200: System.Net.Ping => 70
	i64 u0xdfe60c16084f6d57, ; 1201: itext.pdfua.dll => 211
	i64 u0xe0142572c095a480, ; 1202: Xamarin.AndroidX.AppCompat.dll => 296
	i64 u0xe021eaa401792a05, ; 1203: System.Text.Encoding.dll => 136
	i64 u0xe02f89350ec78051, ; 1204: Xamarin.AndroidX.CoordinatorLayout.dll => 312
	i64 u0xe0496b9d65ef5474, ; 1205: Xamarin.Android.Glide.DiskLruCache.dll => 289
	i64 u0xe0ea30f1ac5b7731, ; 1206: ko/Microsoft.Data.SqlClient.resources.dll => 404
	i64 u0xe0ee2e61123c1478, ; 1207: lib-es-Microsoft.Data.SqlClient.resources.dll.so => 400
	i64 u0xe10b760bb1462e7a, ; 1208: lib_System.Security.Cryptography.Primitives.dll.so => 125
	i64 u0xe12265280d0b036d, ; 1209: fr/Microsoft.Data.SqlClient.resources => 401
	i64 u0xe14ff8e84737288a, ; 1210: Xamarin.Firebase.Installations.InterOp.dll => 372
	i64 u0xe1566bbdb759c5af, ; 1211: Microsoft.Maui.Controls.HotReload.Forms.dll => 455
	i64 u0xe192a588d4410686, ; 1212: lib_System.IO.Pipelines.dll.so => 54
	i64 u0xe1a08bd3fa539e0d, ; 1213: System.Runtime.Loader => 110
	i64 u0xe1a77eb8831f7741, ; 1214: System.Security.SecureString.dll => 130
	i64 u0xe1b52f9f816c70ef, ; 1215: System.Private.Xml.Linq.dll => 88
	i64 u0xe1e199c8ab02e356, ; 1216: System.Data.DataSetExtensions.dll => 23
	i64 u0xe1ecfdb7fff86067, ; 1217: System.Net.Security.dll => 74
	i64 u0xe2252a80fe853de4, ; 1218: lib_System.Security.Principal.dll.so => 129
	i64 u0xe22fa4c9c645db62, ; 1219: System.Diagnostics.TextWriterTraceListener.dll => 31
	i64 u0xe2420585aeceb728, ; 1220: System.Net.Requests.dll => 73
	i64 u0xe247baa54eab2a37, ; 1221: Xamarin.Firebase.Common.Ktx.dll => 369
	i64 u0xe26692647e6bcb62, ; 1222: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 336
	i64 u0xe29b73bc11392966, ; 1223: lib-id-Microsoft.Maui.Controls.resources.dll.so => 424
	i64 u0xe2ad448dee50fbdf, ; 1224: System.Xml.Serialization => 158
	i64 u0xe2d920f978f5d85c, ; 1225: System.Data.DataSetExtensions => 23
	i64 u0xe2e426c7714fa0bc, ; 1226: Microsoft.Win32.Primitives.dll => 4
	i64 u0xe332bacb3eb4a806, ; 1227: Mono.Android.Export.dll => 170
	i64 u0xe3811d68d4fe8463, ; 1228: pt-BR/Microsoft.Maui.Controls.resources.dll => 432
	i64 u0xe3b7cbae5ad66c75, ; 1229: lib_System.Security.Cryptography.Encoding.dll.so => 123
	i64 u0xe494f7ced4ecd10a, ; 1230: hu/Microsoft.Maui.Controls.resources.dll => 423
	i64 u0xe49a982a2533a332, ; 1231: lib_Google.Cloud.Location.dll.so => 195
	i64 u0xe4a9b1e40d1e8917, ; 1232: lib-fi-Microsoft.Maui.Controls.resources.dll.so => 418
	i64 u0xe4f74a0b5bf9703f, ; 1233: System.Runtime.Serialization.Primitives => 114
	i64 u0xe5434e8a119ceb69, ; 1234: lib_Mono.Android.dll.so => 172
	i64 u0xe55703b9ce5c038a, ; 1235: System.Diagnostics.Tools => 32
	i64 u0xe57013c8afc270b5, ; 1236: Microsoft.VisualBasic => 3
	i64 u0xe57d22ca4aeb4900, ; 1237: System.Configuration.ConfigurationManager => 274
	i64 u0xe62913cc36bc07ec, ; 1238: System.Xml.dll => 164
	i64 u0xe67e4f4689949049, ; 1239: zh-Hans/Microsoft.SqlServer.Types.resources => 453
	i64 u0xe6e77c648688b75b, ; 1240: Google.Api.CommonProtos.dll => 186
	i64 u0xe7b0691bcbb5a85d, ; 1241: System.Linq.Async => 280
	i64 u0xe7bea09c4900a191, ; 1242: Xamarin.AndroidX.VectorDrawable.dll => 360
	i64 u0xe7e03cc18dcdeb49, ; 1243: lib_System.Diagnostics.StackTrace.dll.so => 30
	i64 u0xe7e147ff99a7a380, ; 1244: lib_System.Configuration.dll.so => 19
	i64 u0xe8159f0f339a522f, ; 1245: lib_itext.barcodes.dll.so => 204
	i64 u0xe83ddbccfc6aff3f, ; 1246: Xamarin.Kotlin.StdLib.Jdk7 => 385
	i64 u0xe86b0df4ba9e5db8, ; 1247: lib_Xamarin.AndroidX.Lifecycle.Runtime.Android.dll.so => 335
	i64 u0xe896622fe0902957, ; 1248: System.Reflection.Emit.dll => 93
	i64 u0xe89a2a9ef110899b, ; 1249: System.Drawing.dll => 36
	i64 u0xe8c5f8c100b5934b, ; 1250: Microsoft.Win32.Registry => 5
	i64 u0xe957c3976986ab72, ; 1251: lib_Xamarin.AndroidX.Window.Extensions.Core.Core.dll.so => 366
	i64 u0xe98163eb702ae5c5, ; 1252: Xamarin.AndroidX.Arch.Core.Runtime => 299
	i64 u0xe98b0e4b4d44e931, ; 1253: lib_Grpc.Net.Client.dll.so => 201
	i64 u0xe994f23ba4c143e5, ; 1254: Xamarin.KotlinX.Coroutines.Android => 389
	i64 u0xe9b9c8c0458fd92a, ; 1255: System.Windows => 155
	i64 u0xe9d166d87a7f2bdb, ; 1256: lib_Xamarin.AndroidX.Startup.StartupRuntime.dll.so => 356
	i64 u0xea5a4efc2ad81d1b, ; 1257: Xamarin.Google.ErrorProne.Annotations => 377
	i64 u0xeae68e81c894c13d, ; 1258: UraniumUI.Material.dll => 286
	i64 u0xeaf8e9970fc2fe69, ; 1259: System.Management => 281
	i64 u0xeb2313fe9d65b785, ; 1260: Xamarin.AndroidX.ConstraintLayout.dll => 310
	i64 u0xeb6e275e78cb8d42, ; 1261: Xamarin.AndroidX.LocalBroadcastManager.dll => 343
	i64 u0xeb9973cda26e858f, ; 1262: Xamarin.Firebase.Common.dll => 368
	i64 u0xed19c616b3fcb7eb, ; 1263: Xamarin.AndroidX.VersionedParcelable.dll => 362
	i64 u0xed60c6fa891c051a, ; 1264: lib_Microsoft.VisualStudio.DesignTools.TapContract.dll.so => 457
	i64 u0xed6ef763c6fb395f, ; 1265: System.Diagnostics.EventLog.dll => 276
	i64 u0xed88ac16d5217c50, ; 1266: lib_EFCore.BulkExtensions.Oracle.dll.so => 181
	i64 u0xedc4817167106c23, ; 1267: System.Net.Sockets.dll => 76
	i64 u0xedc632067fb20ff3, ; 1268: System.Memory.dll => 63
	i64 u0xedc8e4ca71a02a8b, ; 1269: Xamarin.AndroidX.Navigation.Runtime.dll => 346
	i64 u0xee04c435dc04d4d7, ; 1270: EFCore.BulkExtensions.Core.dll => 180
	i64 u0xee81f5b3f1c4f83b, ; 1271: System.Threading.ThreadPool => 147
	i64 u0xeeb7ebb80150501b, ; 1272: lib_Xamarin.AndroidX.Collection.Jvm.dll.so => 307
	i64 u0xeef850486aa78956, ; 1273: lib-de-Microsoft.SqlServer.Types.resources.dll.so => 445
	i64 u0xeefc635595ef57f0, ; 1274: System.Security.Cryptography.Cng => 121
	i64 u0xef03b1b5a04e9709, ; 1275: System.Text.Encoding.CodePages.dll => 134
	i64 u0xef2f805e5d8b8230, ; 1276: lib_Oracle.ManagedDataAccess.dll.so => 265
	i64 u0xef432781d5667f61, ; 1277: Xamarin.AndroidX.Print => 348
	i64 u0xef602c523fe2e87a, ; 1278: lib_Xamarin.Google.Guava.ListenableFuture.dll.so => 378
	i64 u0xef6e6d3ed7611955, ; 1279: itext.forms => 206
	i64 u0xef72742e1bcca27a, ; 1280: Microsoft.Maui.Essentials.dll => 254
	i64 u0xefd0396433f04886, ; 1281: pt-BR/Microsoft.Data.SqlClient.resources => 406
	i64 u0xefd1e0c4e5c9b371, ; 1282: System.Resources.ResourceManager.dll => 100
	i64 u0xefe24f02e90841a9, ; 1283: ru/Microsoft.SqlServer.Types.resources.dll => 452
	i64 u0xefe8f8d5ed3c72ea, ; 1284: System.Formats.Tar.dll => 39
	i64 u0xefec0b7fdc57ec42, ; 1285: Xamarin.AndroidX.Activity => 291
	i64 u0xf008bcd238ede2c8, ; 1286: System.CodeDom.dll => 273
	i64 u0xf00c29406ea45e19, ; 1287: es/Microsoft.Maui.Controls.resources.dll => 417
	i64 u0xf09e47b6ae914f6e, ; 1288: System.Net.NameResolution => 68
	i64 u0xf0ac2b489fed2e35, ; 1289: lib_System.Diagnostics.Debug.dll.so => 26
	i64 u0xf0bb49dadd3a1fe1, ; 1290: lib_System.Net.ServicePoint.dll.so => 75
	i64 u0xf0de2537ee19c6ca, ; 1291: lib_System.Net.WebHeaderCollection.dll.so => 78
	i64 u0xf1138779fa181c68, ; 1292: lib_Xamarin.AndroidX.Lifecycle.Runtime.dll.so => 334
	i64 u0xf11b621fc87b983f, ; 1293: Microsoft.Maui.Controls.Xaml.dll => 252
	i64 u0xf161f4f3c3b7e62c, ; 1294: System.Data => 24
	i64 u0xf16eb650d5a464bc, ; 1295: System.ValueTuple => 152
	i64 u0xf1c4b4005493d871, ; 1296: System.Formats.Asn1.dll => 38
	i64 u0xf238bd79489d3a96, ; 1297: lib-nl-Microsoft.Maui.Controls.resources.dll.so => 430
	i64 u0xf25203d36c6e85c4, ; 1298: lib-ja-Microsoft.SqlServer.Types.resources.dll.so => 449
	i64 u0xf2a69492c6bd46b0, ; 1299: lib_Xamarin.Kotlin.StdLib.Jdk7.dll.so => 385
	i64 u0xf2feea356ba760af, ; 1300: Xamarin.AndroidX.Arch.Core.Runtime.dll => 299
	i64 u0xf300e085f8acd238, ; 1301: lib_System.ServiceProcess.dll.so => 133
	i64 u0xf34e52b26e7e059d, ; 1302: System.Runtime.CompilerServices.VisualC.dll => 103
	i64 u0xf37221fda4ef8830, ; 1303: lib_Xamarin.Google.Android.Material.dll.so => 373
	i64 u0xf3ad9b8fb3eefd12, ; 1304: lib_System.IO.UnmanagedMemoryStream.dll.so => 57
	i64 u0xf3ddfe05336abf29, ; 1305: System => 165
	i64 u0xf408654b2a135055, ; 1306: System.Reflection.Emit.ILGeneration.dll => 91
	i64 u0xf4103170a1de5bd0, ; 1307: System.Linq.Queryable.dll => 61
	i64 u0xf42d20c23173d77c, ; 1308: lib_System.ServiceModel.Web.dll.so => 132
	i64 u0xf4c1dd70a5496a17, ; 1309: System.IO.Compression => 46
	i64 u0xf4ecf4b9afc64781, ; 1310: System.ServiceProcess.dll => 133
	i64 u0xf4eeeaa566e9b970, ; 1311: lib_Xamarin.AndroidX.CustomView.PoolingContainer.dll.so => 317
	i64 u0xf502029ca9ac09c4, ; 1312: Microsoft.EntityFrameworkCore.SqlServer.HierarchyId.dll => 229
	i64 u0xf518f63ead11fcd1, ; 1313: System.Threading.Tasks => 145
	i64 u0xf5e59d7ac34b50aa, ; 1314: Microsoft.IdentityModel.Protocols.dll => 247
	i64 u0xf5fc7602fe27b333, ; 1315: System.Net.WebHeaderCollection => 78
	i64 u0xf6077741019d7428, ; 1316: Xamarin.AndroidX.CoordinatorLayout => 312
	i64 u0xf61ade9836ad4692, ; 1317: Microsoft.IdentityModel.Tokens.dll => 249
	i64 u0xf6742cbf457c450b, ; 1318: Xamarin.AndroidX.Lifecycle.Runtime.Android.dll => 335
	i64 u0xf6ae7832fd9c9009, ; 1319: lib-it-Microsoft.SqlServer.Types.resources.dll.so => 448
	i64 u0xf6c0e7d55a7a4e4f, ; 1320: Microsoft.IdentityModel.JsonWebTokens => 245
	i64 u0xf70c0a7bf8ccf5af, ; 1321: System.Web => 154
	i64 u0xf7166e040fdf96f5, ; 1322: lib_itext.pdfua.dll.so => 211
	i64 u0xf77b20923f07c667, ; 1323: de/Microsoft.Maui.Controls.resources.dll => 415
	i64 u0xf79cbf52994c8548, ; 1324: Npgsql => 262
	i64 u0xf7be8a85d06b4b64, ; 1325: ru/Microsoft.Data.SqlClient.resources.dll => 407
	i64 u0xf7e2cac4c45067b3, ; 1326: lib_System.Numerics.Vectors.dll.so => 83
	i64 u0xf7e74930e0e3d214, ; 1327: zh-HK/Microsoft.Maui.Controls.resources.dll => 442
	i64 u0xf7fa0bf77fe677cc, ; 1328: Newtonsoft.Json.dll => 261
	i64 u0xf83775f330791063, ; 1329: ja/Microsoft.Data.SqlClient.resources.dll => 403
	i64 u0xf84773b5c81e3cef, ; 1330: lib-uk-Microsoft.Maui.Controls.resources.dll.so => 440
	i64 u0xf8aac5ea82de1348, ; 1331: System.Linq.Queryable => 61
	i64 u0xf8abd63acd77d37b, ; 1332: Xamarin.AndroidX.Camera.View => 304
	i64 u0xf8b77539b362d3ba, ; 1333: lib_System.Reflection.Primitives.dll.so => 96
	i64 u0xf8cd217ba1bbfdc8, ; 1334: lib-zh-Hant-Microsoft.Data.SqlClient.resources.dll.so => 410
	i64 u0xf8e045dc345b2ea3, ; 1335: lib_Xamarin.AndroidX.RecyclerView.dll.so => 350
	i64 u0xf915dc29808193a1, ; 1336: System.Web.HttpUtility.dll => 153
	i64 u0xf95306fe01fadbd0, ; 1337: itext.commons.dll => 216
	i64 u0xf96c777a2a0686f4, ; 1338: hi/Microsoft.Maui.Controls.resources.dll => 421
	i64 u0xf9be54c8bcf8ff3b, ; 1339: System.Security.AccessControl.dll => 118
	i64 u0xf9eec5bb3a6aedc6, ; 1340: Microsoft.Extensions.Options => 240
	i64 u0xfa0e82300e67f913, ; 1341: lib_System.AppContext.dll.so => 6
	i64 u0xfa2fdb27e8a2c8e8, ; 1342: System.ComponentModel.EventBasedAsync => 15
	i64 u0xfa3f278f288b0e84, ; 1343: lib_System.Net.Security.dll.so => 74
	i64 u0xfa5ed7226d978949, ; 1344: lib-ar-Microsoft.Maui.Controls.resources.dll.so => 411
	i64 u0xfa645d91e9fc4cba, ; 1345: System.Threading.Thread => 146
	i64 u0xfad4d2c770e827f9, ; 1346: lib_System.IO.IsolatedStorage.dll.so => 52
	i64 u0xfae3bcd3a0b1572a, ; 1347: lib_itext.layout.dll.so => 209
	i64 u0xfaef53f942a29695, ; 1348: pt-BR/Microsoft.SqlServer.Types.resources => 451
	i64 u0xfb022853d73b7fa5, ; 1349: lib_SQLitePCLRaw.batteries_v2.dll.so => 268
	i64 u0xfb06dd2338e6f7c4, ; 1350: System.Net.Ping.dll => 70
	i64 u0xfb087abe5365e3b7, ; 1351: lib_System.Data.DataSetExtensions.dll.so => 23
	i64 u0xfb846e949baff5ea, ; 1352: System.Xml.Serialization.dll => 158
	i64 u0xfbad3e4ce4b98145, ; 1353: System.Security.Cryptography.X509Certificates => 126
	i64 u0xfbf0a31c9fc34bc4, ; 1354: lib_System.Net.Http.dll.so => 65
	i64 u0xfc61ddcf78dd1f54, ; 1355: Xamarin.AndroidX.LocalBroadcastManager => 343
	i64 u0xfc6b7527cc280b3f, ; 1356: lib_System.Runtime.Serialization.Formatters.dll.so => 112
	i64 u0xfc719aec26adf9d9, ; 1357: Xamarin.AndroidX.Navigation.Fragment.dll => 345
	i64 u0xfc82690c2fe2735c, ; 1358: Xamarin.AndroidX.Lifecycle.Process.dll => 333
	i64 u0xfc93fc307d279893, ; 1359: System.IO.Pipes.AccessControl.dll => 55
	i64 u0xfcd302092ada6328, ; 1360: System.IO.MemoryMappedFiles.dll => 53
	i64 u0xfcd5b90cf101e36b, ; 1361: System.Data.SqlClient.dll => 275
	i64 u0xfd22f00870e40ae0, ; 1362: lib_Xamarin.AndroidX.DrawerLayout.dll.so => 319
	i64 u0xfd49b3c1a76e2748, ; 1363: System.Runtime.InteropServices.RuntimeInformation => 107
	i64 u0xfd536c702f64dc47, ; 1364: System.Text.Encoding.Extensions => 135
	i64 u0xfd583f7657b6a1cb, ; 1365: Xamarin.AndroidX.Fragment => 324
	i64 u0xfd8dd91a2c26bd5d, ; 1366: Xamarin.AndroidX.Lifecycle.Runtime => 334
	i64 u0xfda36abccf05cf5c, ; 1367: System.Net.WebSockets.Client => 80
	i64 u0xfdbe4710aa9beeff, ; 1368: CommunityToolkit.Maui => 177
	i64 u0xfddbe9695626a7f5, ; 1369: Xamarin.AndroidX.Lifecycle.Common => 328
	i64 u0xfeae9952cf03b8cb, ; 1370: tr/Microsoft.Maui.Controls.resources => 439
	i64 u0xfebe1950717515f9, ; 1371: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 332
	i64 u0xff270a55858bac8d, ; 1372: System.Security.Principal => 129
	i64 u0xff9b54613e0d2cc8, ; 1373: System.Net.Http.Json => 64
	i64 u0xffb5607c2db1b7e8, ; 1374: Xamarin.Kotlin.StdLib.Jdk8 => 386
	i64 u0xffdb7a971be4ec73, ; 1375: System.ValueTuple.dll => 152
	i64 u0xfff40914e0b38d3d ; 1376: Azure.Identity.dll => 175
], align 16

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [1377 x i32] [
	i32 194, i32 42, i32 390, i32 258, i32 399, i32 357, i32 257, i32 13,
	i32 396, i32 201, i32 346, i32 178, i32 283, i32 105, i32 404, i32 231,
	i32 171, i32 48, i32 296, i32 7, i32 271, i32 86, i32 435, i32 413,
	i32 441, i32 244, i32 320, i32 71, i32 381, i32 449, i32 350, i32 221,
	i32 12, i32 253, i32 102, i32 257, i32 410, i32 221, i32 408, i32 442,
	i32 156, i32 19, i32 325, i32 307, i32 161, i32 322, i32 360, i32 167,
	i32 435, i32 10, i32 402, i32 239, i32 361, i32 174, i32 96, i32 317,
	i32 454, i32 319, i32 213, i32 13, i32 240, i32 10, i32 282, i32 380,
	i32 127, i32 370, i32 95, i32 230, i32 140, i32 220, i32 183, i32 39,
	i32 436, i32 394, i32 363, i32 273, i32 432, i32 303, i32 172, i32 290,
	i32 278, i32 5, i32 254, i32 67, i32 354, i32 130, i32 218, i32 200,
	i32 181, i32 353, i32 321, i32 68, i32 371, i32 308, i32 66, i32 403,
	i32 57, i32 218, i32 316, i32 52, i32 400, i32 43, i32 125, i32 448,
	i32 301, i32 67, i32 81, i32 336, i32 457, i32 158, i32 92, i32 189,
	i32 99, i32 350, i32 248, i32 141, i32 194, i32 151, i32 300, i32 419,
	i32 162, i32 169, i32 420, i32 367, i32 248, i32 235, i32 182, i32 81,
	i32 211, i32 457, i32 308, i32 4, i32 5, i32 276, i32 51, i32 101,
	i32 236, i32 399, i32 56, i32 120, i32 98, i32 168, i32 118, i32 390,
	i32 21, i32 263, i32 423, i32 137, i32 97, i32 394, i32 77, i32 429,
	i32 348, i32 356, i32 119, i32 215, i32 304, i32 285, i32 280, i32 175,
	i32 8, i32 165, i32 438, i32 445, i32 70, i32 289, i32 337, i32 351,
	i32 171, i32 191, i32 145, i32 40, i32 445, i32 250, i32 354, i32 47,
	i32 197, i32 30, i32 347, i32 427, i32 144, i32 240, i32 163, i32 28,
	i32 84, i32 358, i32 77, i32 181, i32 43, i32 185, i32 187, i32 29,
	i32 42, i32 103, i32 117, i32 294, i32 272, i32 45, i32 91, i32 438,
	i32 56, i32 148, i32 456, i32 205, i32 380, i32 146, i32 223, i32 100,
	i32 49, i32 187, i32 398, i32 20, i32 313, i32 114, i32 199, i32 191,
	i32 287, i32 419, i32 376, i32 268, i32 301, i32 384, i32 241, i32 302,
	i32 454, i32 94, i32 58, i32 279, i32 424, i32 422, i32 81, i32 376,
	i32 169, i32 26, i32 372, i32 267, i32 386, i32 71, i32 349, i32 446,
	i32 323, i32 455, i32 440, i32 69, i32 33, i32 212, i32 418, i32 14,
	i32 139, i32 279, i32 38, i32 444, i32 210, i32 309, i32 431, i32 134,
	i32 92, i32 88, i32 406, i32 149, i32 437, i32 24, i32 138, i32 57,
	i32 51, i32 416, i32 184, i32 29, i32 157, i32 256, i32 34, i32 164,
	i32 230, i32 324, i32 244, i32 52, i32 259, i32 458, i32 365, i32 90,
	i32 305, i32 453, i32 35, i32 214, i32 419, i32 157, i32 9, i32 417,
	i32 195, i32 76, i32 256, i32 55, i32 277, i32 203, i32 253, i32 413,
	i32 251, i32 13, i32 364, i32 232, i32 298, i32 109, i32 340, i32 262,
	i32 32, i32 370, i32 104, i32 84, i32 92, i32 53, i32 285, i32 447,
	i32 96, i32 383, i32 188, i32 58, i32 9, i32 102, i32 183, i32 219,
	i32 316, i32 68, i32 247, i32 274, i32 363, i32 412, i32 261, i32 0,
	i32 204, i32 125, i32 351, i32 116, i32 135, i32 249, i32 126, i32 106,
	i32 196, i32 220, i32 384, i32 131, i32 300, i32 397, i32 275, i32 378,
	i32 147, i32 156, i32 325, i32 313, i32 268, i32 197, i32 320, i32 196,
	i32 402, i32 351, i32 97, i32 24, i32 355, i32 243, i32 143, i32 267,
	i32 348, i32 344, i32 277, i32 175, i32 3, i32 258, i32 188, i32 274,
	i32 167, i32 297, i32 204, i32 100, i32 161, i32 193, i32 99, i32 186,
	i32 25, i32 281, i32 93, i32 168, i32 172, i32 292, i32 3, i32 0,
	i32 431, i32 452, i32 322, i32 1, i32 114, i32 384, i32 224, i32 325,
	i32 333, i32 279, i32 190, i32 33, i32 6, i32 236, i32 215, i32 435,
	i32 156, i32 202, i32 282, i32 392, i32 433, i32 53, i32 327, i32 85,
	i32 368, i32 362, i32 347, i32 44, i32 332, i32 104, i32 47, i32 138,
	i32 272, i32 64, i32 225, i32 342, i32 69, i32 80, i32 189, i32 59,
	i32 89, i32 154, i32 272, i32 298, i32 133, i32 203, i32 110, i32 250,
	i32 425, i32 342, i32 349, i32 171, i32 134, i32 207, i32 140, i32 40,
	i32 412, i32 398, i32 446, i32 207, i32 270, i32 249, i32 402, i32 251,
	i32 229, i32 374, i32 202, i32 60, i32 185, i32 179, i32 208, i32 339,
	i32 403, i32 79, i32 25, i32 36, i32 99, i32 336, i32 71, i32 202,
	i32 22, i32 409, i32 212, i32 313, i32 255, i32 265, i32 436, i32 121,
	i32 69, i32 107, i32 442, i32 222, i32 343, i32 119, i32 117, i32 328,
	i32 192, i32 329, i32 11, i32 2, i32 124, i32 115, i32 142, i32 41,
	i32 87, i32 293, i32 269, i32 173, i32 27, i32 148, i32 426, i32 234,
	i32 377, i32 292, i32 1, i32 199, i32 294, i32 282, i32 44, i32 312,
	i32 149, i32 327, i32 18, i32 86, i32 414, i32 379, i32 41, i32 332,
	i32 306, i32 275, i32 386, i32 337, i32 94, i32 237, i32 28, i32 41,
	i32 451, i32 78, i32 396, i32 406, i32 321, i32 309, i32 405, i32 144,
	i32 108, i32 307, i32 11, i32 105, i32 137, i32 16, i32 122, i32 66,
	i32 183, i32 157, i32 22, i32 452, i32 270, i32 416, i32 393, i32 102,
	i32 234, i32 391, i32 63, i32 58, i32 252, i32 415, i32 110, i32 398,
	i32 173, i32 408, i32 219, i32 210, i32 389, i32 9, i32 373, i32 120,
	i32 228, i32 98, i32 219, i32 105, i32 392, i32 189, i32 340, i32 177,
	i32 251, i32 111, i32 295, i32 49, i32 20, i32 339, i32 315, i32 72,
	i32 311, i32 450, i32 155, i32 277, i32 39, i32 414, i32 35, i32 387,
	i32 38, i32 420, i32 270, i32 366, i32 108, i32 429, i32 21, i32 190,
	i32 383, i32 184, i32 227, i32 338, i32 284, i32 255, i32 405, i32 15,
	i32 241, i32 79, i32 79, i32 315, i32 241, i32 318, i32 345, i32 353,
	i32 152, i32 21, i32 371, i32 253, i32 413, i32 50, i32 51, i32 266,
	i32 439, i32 429, i32 94, i32 288, i32 425, i32 16, i32 283, i32 123,
	i32 422, i32 160, i32 45, i32 377, i32 198, i32 450, i32 116, i32 63,
	i32 226, i32 166, i32 184, i32 217, i32 232, i32 14, i32 352, i32 111,
	i32 451, i32 295, i32 60, i32 388, i32 374, i32 121, i32 428, i32 2,
	i32 438, i32 368, i32 324, i32 338, i32 409, i32 387, i32 338, i32 6,
	i32 306, i32 418, i32 320, i32 221, i32 245, i32 17, i32 436, i32 415,
	i32 77, i32 310, i32 374, i32 380, i32 178, i32 131, i32 383, i32 428,
	i32 83, i32 205, i32 239, i32 12, i32 182, i32 176, i32 34, i32 119,
	i32 393, i32 333, i32 322, i32 85, i32 287, i32 381, i32 18, i32 363,
	i32 233, i32 242, i32 331, i32 72, i32 456, i32 95, i32 271, i32 165,
	i32 326, i32 194, i32 82, i32 444, i32 296, i32 305, i32 388, i32 154,
	i32 36, i32 151, i32 440, i32 209, i32 216, i32 244, i32 443, i32 304,
	i32 144, i32 56, i32 113, i32 264, i32 225, i32 306, i32 360, i32 404,
	i32 264, i32 359, i32 37, i32 444, i32 232, i32 115, i32 294, i32 14,
	i32 288, i32 224, i32 146, i32 43, i32 201, i32 254, i32 292, i32 367,
	i32 98, i32 391, i32 168, i32 266, i32 16, i32 48, i32 107, i32 97,
	i32 230, i32 193, i32 342, i32 214, i32 27, i32 128, i32 29, i32 420,
	i32 408, i32 174, i32 278, i32 353, i32 128, i32 44, i32 227, i32 315,
	i32 286, i32 226, i32 321, i32 149, i32 8, i32 200, i32 447, i32 242,
	i32 454, i32 266, i32 261, i32 276, i32 344, i32 421, i32 434, i32 269,
	i32 381, i32 433, i32 132, i32 432, i32 42, i32 393, i32 269, i32 33,
	i32 259, i32 203, i32 458, i32 46, i32 143, i32 339, i32 252, i32 330,
	i32 316, i32 138, i32 62, i32 132, i32 412, i32 48, i32 160, i32 370,
	i32 299, i32 330, i32 288, i32 400, i32 328, i32 428, i32 359, i32 46,
	i32 164, i32 246, i32 326, i32 248, i32 246, i32 301, i32 303, i32 405,
	i32 417, i32 323, i32 243, i32 192, i32 424, i32 255, i32 379, i32 18,
	i32 8, i32 367, i32 198, i32 314, i32 124, i32 302, i32 59, i32 250,
	i32 141, i32 179, i32 346, i32 265, i32 427, i32 334, i32 247, i32 375,
	i32 258, i32 262, i32 365, i32 259, i32 150, i32 142, i32 390, i32 387,
	i32 228, i32 126, i32 389, i32 372, i32 160, i32 260, i32 162, i32 317,
	i32 291, i32 233, i32 285, i32 430, i32 26, i32 344, i32 331, i32 450,
	i32 303, i32 242, i32 82, i32 208, i32 365, i32 127, i32 376, i32 101,
	i32 148, i32 0, i32 373, i32 347, i32 263, i32 54, i32 162, i32 167,
	i32 267, i32 228, i32 131, i32 283, i32 37, i32 361, i32 427, i32 179,
	i32 22, i32 227, i32 112, i32 90, i32 318, i32 449, i32 50, i32 264,
	i32 60, i32 122, i32 83, i32 127, i32 280, i32 222, i32 163, i32 375,
	i32 166, i32 352, i32 354, i32 319, i32 287, i32 220, i32 335, i32 4,
	i32 329, i32 423, i32 170, i32 2, i32 379, i32 340, i32 217, i32 116,
	i32 245, i32 293, i32 186, i32 19, i32 178, i32 238, i32 369, i32 89,
	i32 65, i32 30, i32 235, i32 416, i32 193, i32 311, i32 59, i32 257,
	i32 111, i32 331, i32 32, i32 197, i32 128, i32 159, i32 434, i32 371,
	i32 309, i32 140, i32 205, i32 318, i32 430, i32 153, i32 17, i32 308,
	i32 290, i32 75, i32 74, i32 15, i32 169, i32 85, i32 382, i32 388,
	i32 226, i32 209, i32 124, i32 330, i32 341, i32 310, i32 437, i32 337,
	i32 34, i32 118, i32 139, i32 122, i32 213, i32 106, i32 414, i32 286,
	i32 382, i32 456, i32 361, i32 284, i32 187, i32 305, i32 195, i32 421,
	i32 411, i32 54, i32 47, i32 206, i32 28, i32 222, i32 145, i32 238,
	i32 385, i32 147, i32 217, i32 213, i32 35, i32 437, i32 173, i32 281,
	i32 366, i32 75, i32 161, i32 200, i32 1, i32 392, i32 355, i32 433,
	i32 426, i32 208, i32 159, i32 12, i32 155, i32 151, i32 188, i32 76,
	i32 396, i32 243, i32 103, i32 112, i32 271, i32 298, i32 206, i32 409,
	i32 182, i32 401, i32 65, i32 401, i32 66, i32 364, i32 407, i32 45,
	i32 300, i32 212, i32 109, i32 397, i32 302, i32 7, i32 297, i32 55,
	i32 293, i32 64, i32 411, i32 314, i32 180, i32 20, i32 109, i32 101,
	i32 447, i32 62, i32 199, i32 142, i32 223, i32 291, i32 176, i32 7,
	i32 246, i32 192, i32 426, i32 170, i32 50, i32 364, i32 448, i32 115,
	i32 236, i32 141, i32 198, i32 166, i32 395, i32 80, i32 113, i32 223,
	i32 341, i32 231, i32 17, i32 73, i32 345, i32 89, i32 289, i32 410,
	i32 87, i32 120, i32 191, i32 358, i32 295, i32 135, i32 153, i32 106,
	i32 11, i32 90, i32 229, i32 31, i32 260, i32 177, i32 231, i32 439,
	i32 136, i32 431, i32 434, i32 356, i32 225, i32 263, i32 290, i32 40,
	i32 458, i32 355, i32 218, i32 139, i32 391, i32 394, i32 25, i32 443,
	i32 73, i32 214, i32 326, i32 357, i32 278, i32 369, i32 174, i32 256,
	i32 382, i32 27, i32 260, i32 67, i32 88, i32 180, i32 95, i32 113,
	i32 207, i32 31, i32 104, i32 329, i32 37, i32 72, i32 210, i32 284,
	i32 446, i32 399, i32 378, i32 108, i32 123, i32 297, i32 87, i32 237,
	i32 86, i32 425, i32 93, i32 224, i32 235, i32 129, i32 341, i32 395,
	i32 407, i32 358, i32 239, i32 395, i32 196, i32 455, i32 352, i32 453,
	i32 314, i32 357, i32 311, i32 375, i32 215, i32 233, i32 163, i32 130,
	i32 238, i32 362, i32 273, i32 349, i32 397, i32 176, i32 216, i32 234,
	i32 10, i32 49, i32 441, i32 91, i32 185, i32 441, i32 150, i32 62,
	i32 136, i32 150, i32 61, i32 190, i32 237, i32 117, i32 137, i32 84,
	i32 327, i32 443, i32 159, i32 359, i32 143, i32 422, i32 323, i32 82,
	i32 70, i32 211, i32 296, i32 136, i32 312, i32 289, i32 404, i32 400,
	i32 125, i32 401, i32 372, i32 455, i32 54, i32 110, i32 130, i32 88,
	i32 23, i32 74, i32 129, i32 31, i32 73, i32 369, i32 336, i32 424,
	i32 158, i32 23, i32 4, i32 170, i32 432, i32 123, i32 423, i32 195,
	i32 418, i32 114, i32 172, i32 32, i32 3, i32 274, i32 164, i32 453,
	i32 186, i32 280, i32 360, i32 30, i32 19, i32 204, i32 385, i32 335,
	i32 93, i32 36, i32 5, i32 366, i32 299, i32 201, i32 389, i32 155,
	i32 356, i32 377, i32 286, i32 281, i32 310, i32 343, i32 368, i32 362,
	i32 457, i32 276, i32 181, i32 76, i32 63, i32 346, i32 180, i32 147,
	i32 307, i32 445, i32 121, i32 134, i32 265, i32 348, i32 378, i32 206,
	i32 254, i32 406, i32 100, i32 452, i32 39, i32 291, i32 273, i32 417,
	i32 68, i32 26, i32 75, i32 78, i32 334, i32 252, i32 24, i32 152,
	i32 38, i32 430, i32 449, i32 385, i32 299, i32 133, i32 103, i32 373,
	i32 57, i32 165, i32 91, i32 61, i32 132, i32 46, i32 133, i32 317,
	i32 229, i32 145, i32 247, i32 78, i32 312, i32 249, i32 335, i32 448,
	i32 245, i32 154, i32 211, i32 415, i32 262, i32 407, i32 83, i32 442,
	i32 261, i32 403, i32 440, i32 61, i32 304, i32 96, i32 410, i32 350,
	i32 153, i32 216, i32 421, i32 118, i32 240, i32 6, i32 15, i32 74,
	i32 411, i32 146, i32 52, i32 209, i32 451, i32 268, i32 70, i32 23,
	i32 158, i32 126, i32 65, i32 343, i32 112, i32 345, i32 333, i32 55,
	i32 53, i32 275, i32 319, i32 107, i32 135, i32 324, i32 334, i32 80,
	i32 177, i32 328, i32 439, i32 332, i32 129, i32 64, i32 386, i32 152,
	i32 175
], align 16

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
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 16

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { memory(write, argmem: none, inaccessiblemem: none) "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!".NET for Android remotes/origin/release/9.0.1xx @ 0ccdc57cf7fc59bd3f6cbf900c9cdbebadfe4609"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
