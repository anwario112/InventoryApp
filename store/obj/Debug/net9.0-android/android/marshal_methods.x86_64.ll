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

@assembly_image_cache = dso_local local_unnamed_addr global [410 x ptr] zeroinitializer, align 16

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [1230 x i64] [
	i64 u0x001e58127c546039, ; 0: lib_System.Globalization.dll.so => 41
	i64 u0x0024d0f62dee05bd, ; 1: Xamarin.KotlinX.Coroutines.Core.dll => 342
	i64 u0x004df92dbfbd34f0, ; 2: lib_NetTopologySuite.dll.so => 224
	i64 u0x006b9d7c1c7e1c42, ; 3: de/Microsoft.Data.SqlClient.resources => 350
	i64 u0x0071cf2d27b7d61e, ; 4: lib_Xamarin.AndroidX.SwipeRefreshLayout.dll.so => 321
	i64 u0x00c57621600ce92e, ; 5: Microsoft.SqlServer.Types.dll => 223
	i64 u0x01109b0e4d99e61f, ; 6: System.ComponentModel.Annotations.dll => 13
	i64 u0x01af0bd6467d518e, ; 7: lib_ZXing.Net.MAUI.dll.so => 347
	i64 u0x02123411c4e01926, ; 8: lib_Xamarin.AndroidX.Navigation.Runtime.dll.so => 310
	i64 u0x022e81ea9c46e03a, ; 9: lib_CommunityToolkit.Maui.Core.dll.so => 175
	i64 u0x02827b47e97f2378, ; 10: System.Security.Cryptography.Pkcs.dll => 246
	i64 u0x0284512fad379f7e, ; 11: System.Runtime.Handles => 104
	i64 u0x029b2c18aaa0996c, ; 12: lib-ko-Microsoft.Data.SqlClient.resources.dll.so => 355
	i64 u0x02a4c5a44384f885, ; 13: Microsoft.Extensions.Caching.Memory => 197
	i64 u0x02abedc11addc1ed, ; 14: lib_Mono.Android.Runtime.dll.so => 169
	i64 u0x02f55bf70672f5c8, ; 15: lib_System.IO.FileSystem.DriveInfo.dll.so => 47
	i64 u0x032267b2a94db371, ; 16: lib_Xamarin.AndroidX.AppCompat.dll.so => 260
	i64 u0x03621c804933a890, ; 17: System.Buffers => 7
	i64 u0x0363ac97a4cb84e6, ; 18: SQLitePCLRaw.provider.e_sqlite3.dll => 236
	i64 u0x0399610510a38a38, ; 19: lib_System.Private.DataContractSerialization.dll.so => 85
	i64 u0x043032f1d071fae0, ; 20: ru/Microsoft.Maui.Controls.resources => 386
	i64 u0x044440a55165631e, ; 21: lib-cs-Microsoft.Maui.Controls.resources.dll.so => 364
	i64 u0x046eb1581a80c6b0, ; 22: vi/Microsoft.Maui.Controls.resources => 392
	i64 u0x0470607fd33c32db, ; 23: Microsoft.IdentityModel.Abstractions.dll => 210
	i64 u0x047408741db2431a, ; 24: Xamarin.AndroidX.DynamicAnimation => 284
	i64 u0x0517ef04e06e9f76, ; 25: System.Net.Primitives => 70
	i64 u0x0531da14b48c1e10, ; 26: ja/Microsoft.SqlServer.Types.resources.dll => 400
	i64 u0x0565d18c6da3de38, ; 27: Xamarin.AndroidX.RecyclerView => 314
	i64 u0x057bf9fa9fb09f7c, ; 28: Microsoft.Data.Sqlite.dll => 188
	i64 u0x0581db89237110e9, ; 29: lib_System.Collections.dll.so => 12
	i64 u0x05989cb940b225a9, ; 30: Microsoft.Maui.dll => 219
	i64 u0x05a1c25e78e22d87, ; 31: lib_System.Runtime.CompilerServices.Unsafe.dll.so => 101
	i64 u0x05c6334bc4836f1a, ; 32: Microsoft.SqlServer.Types => 223
	i64 u0x05d8ca8ee551619f, ; 33: zh-Hant/Microsoft.Data.SqlClient.resources => 361
	i64 u0x05ef98b6a1db882c, ; 34: lib_Microsoft.Data.Sqlite.dll.so => 188
	i64 u0x06073ed944b92dc4, ; 35: lib-tr-Microsoft.Data.SqlClient.resources.dll.so => 359
	i64 u0x06076b5d2b581f08, ; 36: zh-HK/Microsoft.Maui.Controls.resources => 393
	i64 u0x06388ffe9f6c161a, ; 37: System.Xml.Linq.dll => 154
	i64 u0x06600c4c124cb358, ; 38: System.Configuration.dll => 19
	i64 u0x067f95c5ddab55b3, ; 39: lib_Xamarin.AndroidX.Fragment.Ktx.dll.so => 289
	i64 u0x0680a433c781bb3d, ; 40: Xamarin.AndroidX.Collection.Jvm => 271
	i64 u0x069fff96ec92a91d, ; 41: System.Xml.XPath.dll => 159
	i64 u0x070b0847e18dab68, ; 42: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 286
	i64 u0x0739448d84d3b016, ; 43: lib_Xamarin.AndroidX.VectorDrawable.dll.so => 324
	i64 u0x07469f2eecce9e85, ; 44: mscorlib.dll => 165
	i64 u0x07c57877c7ba78ad, ; 45: ru/Microsoft.Maui.Controls.resources.dll => 386
	i64 u0x07dcdc7460a0c5e4, ; 46: System.Collections.NonGeneric => 10
	i64 u0x08015600dcbf6dc7, ; 47: it/Microsoft.Data.SqlClient.resources.dll => 353
	i64 u0x08122e52765333c8, ; 48: lib_Microsoft.Extensions.Logging.Debug.dll.so => 205
	i64 u0x088610fc2509f69e, ; 49: lib_Xamarin.AndroidX.VectorDrawable.Animated.dll.so => 325
	i64 u0x08881a0a9768df86, ; 50: lib_Azure.Core.dll.so => 172
	i64 u0x08a7c865576bbde7, ; 51: System.Reflection.Primitives => 95
	i64 u0x08c9d051a4a817e5, ; 52: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 281
	i64 u0x08d348803591587f, ; 53: lib-zh-Hant-Microsoft.SqlServer.Types.resources.dll.so => 405
	i64 u0x08f3c9788ee2153c, ; 54: Xamarin.AndroidX.DrawerLayout => 283
	i64 u0x09138715c92dba90, ; 55: lib_System.ComponentModel.Annotations.dll.so => 13
	i64 u0x0919c28b89381a0b, ; 56: lib_Microsoft.Extensions.Options.dll.so => 206
	i64 u0x092266563089ae3e, ; 57: lib_System.Collections.NonGeneric.dll.so => 10
	i64 u0x095cacaf6b6a32e4, ; 58: System.Memory.Data => 245
	i64 u0x09d144a7e214d457, ; 59: System.Security.Cryptography => 126
	i64 u0x09e2b9f743db21a8, ; 60: lib_System.Reflection.Metadata.dll.so => 94
	i64 u0x0a805f95d98f597b, ; 61: lib_Microsoft.Extensions.Caching.Abstractions.dll.so => 196
	i64 u0x0abb3e2b271edc45, ; 62: System.Threading.Channels.dll => 138
	i64 u0x0adeb6c0f5699d33, ; 63: Microsoft.Data.SqlClient.dll => 187
	i64 u0x0af14ac472d816c7, ; 64: EFCore.BulkExtensions.Sqlite.dll => 180
	i64 u0x0b06b1feab070143, ; 65: System.Formats.Tar => 38
	i64 u0x0b3b632c3bbee20c, ; 66: sk/Microsoft.Maui.Controls.resources => 387
	i64 u0x0b6aff547b84fbe9, ; 67: Xamarin.KotlinX.Serialization.Core.Jvm => 345
	i64 u0x0be2e1f8ce4064ed, ; 68: Xamarin.AndroidX.ViewPager => 327
	i64 u0x0c3ca6cc978e2aae, ; 69: pt-BR/Microsoft.Maui.Controls.resources => 383
	i64 u0x0c3d7adcdb333bf0, ; 70: Xamarin.AndroidX.Camera.Lifecycle => 267
	i64 u0x0c59ad9fbbd43abe, ; 71: Mono.Android => 170
	i64 u0x0c65741e86371ee3, ; 72: lib_Xamarin.Android.Glide.GifDecoder.dll.so => 254
	i64 u0x0c6924c4d04dd909, ; 73: lib_System.DirectoryServices.Protocols.dll.so => 242
	i64 u0x0c74af560004e816, ; 74: Microsoft.Win32.Registry.dll => 5
	i64 u0x0c7790f60165fc06, ; 75: lib_Microsoft.Maui.Essentials.dll.so => 220
	i64 u0x0c83c82812e96127, ; 76: lib_System.Net.Mail.dll.so => 66
	i64 u0x0cce4bce83380b7f, ; 77: Xamarin.AndroidX.Security.SecurityCrypto => 318
	i64 u0x0d13cd7cce4284e4, ; 78: System.Security.SecureString => 129
	i64 u0x0d3b5ab8b2766190, ; 79: lib_Microsoft.Bcl.AsyncInterfaces.dll.so => 185
	i64 u0x0d573c83ae0263d7, ; 80: EFCore.BulkExtensions.Oracle.dll => 178
	i64 u0x0d63f4f73521c24f, ; 81: lib_Xamarin.AndroidX.SavedState.SavedState.Ktx.dll.so => 317
	i64 u0x0e04e702012f8463, ; 82: Xamarin.AndroidX.Emoji2 => 285
	i64 u0x0e14e73a54dda68e, ; 83: lib_System.Net.NameResolution.dll.so => 67
	i64 u0x0f37dd7a62ae99af, ; 84: lib_Xamarin.AndroidX.Collection.Ktx.dll.so => 272
	i64 u0x0f5e7abaa7cf470a, ; 85: System.Net.HttpListener => 65
	i64 u0x0fbe06392ef90569, ; 86: lib-ja-Microsoft.Data.SqlClient.resources.dll.so => 354
	i64 u0x1001f97bbe242e64, ; 87: System.IO.UnmanagedMemoryStream => 56
	i64 u0x102861e4055f511a, ; 88: Microsoft.Bcl.AsyncInterfaces.dll => 185
	i64 u0x102a31b45304b1da, ; 89: Xamarin.AndroidX.CustomView => 280
	i64 u0x1065c4cb554c3d75, ; 90: System.IO.IsolatedStorage.dll => 51
	i64 u0x108cf0e0ba098a51, ; 91: es/Microsoft.Data.SqlClient.resources => 351
	i64 u0x10f6cfcbcf801616, ; 92: System.IO.Compression.Brotli => 42
	i64 u0x114443cdcf2091f1, ; 93: System.Security.Cryptography.Primitives => 124
	i64 u0x115c94fcc3878c6a, ; 94: it/Microsoft.SqlServer.Types.resources => 399
	i64 u0x118d570f508803d1, ; 95: Xamarin.AndroidX.Camera.Camera2.dll => 265
	i64 u0x11a603952763e1d4, ; 96: System.Net.Mail => 66
	i64 u0x11a70d0e1009fb11, ; 97: System.Net.WebSockets.dll => 80
	i64 u0x11f26371eee0d3c1, ; 98: lib_Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll.so => 300
	i64 u0x11fbe62d469cc1c8, ; 99: Microsoft.VisualStudio.DesignTools.TapContract.dll => 408
	i64 u0x12128b3f59302d47, ; 100: lib_System.Xml.Serialization.dll.so => 156
	i64 u0x123639456fb056da, ; 101: System.Reflection.Emit.Lightweight.dll => 91
	i64 u0x12521e9764603eaa, ; 102: lib_System.Resources.Reader.dll.so => 98
	i64 u0x125b7f94acb989db, ; 103: Xamarin.AndroidX.RecyclerView.dll => 314
	i64 u0x126ee4b0de53cbfd, ; 104: Microsoft.IdentityModel.Protocols.OpenIdConnect.dll => 214
	i64 u0x12d3b63863d4ab0b, ; 105: lib_System.Threading.Overlapped.dll.so => 139
	i64 u0x134eab1061c395ee, ; 106: System.Transactions => 149
	i64 u0x138567fa954faa55, ; 107: Xamarin.AndroidX.Browser => 264
	i64 u0x13a01de0cbc3f06c, ; 108: lib-fr-Microsoft.Maui.Controls.resources.dll.so => 370
	i64 u0x13beedefb0e28a45, ; 109: lib_System.Xml.XmlDocument.dll.so => 160
	i64 u0x13f1e5e209e91af4, ; 110: lib_Java.Interop.dll.so => 167
	i64 u0x13f1e880c25d96d1, ; 111: he/Microsoft.Maui.Controls.resources => 371
	i64 u0x143a1f6e62b82b56, ; 112: Microsoft.IdentityModel.Protocols.OpenIdConnect => 214
	i64 u0x143d8ea60a6a4011, ; 113: Microsoft.Extensions.DependencyInjection.Abstractions => 201
	i64 u0x1486e3d77f17a017, ; 114: lib_EFCore.BulkExtensions.PostgreSql.dll.so => 179
	i64 u0x1497051b917530bd, ; 115: lib_System.Net.WebSockets.dll.so => 80
	i64 u0x14b78ce3adce0011, ; 116: Microsoft.VisualStudio.DesignTools.TapContract => 408
	i64 u0x14e68447938213b7, ; 117: Xamarin.AndroidX.Collection.Ktx.dll => 272
	i64 u0x152a448bd1e745a7, ; 118: Microsoft.Win32.Primitives => 4
	i64 u0x1557de0138c445f4, ; 119: lib_Microsoft.Win32.Registry.dll.so => 5
	i64 u0x159cc6c81072f00e, ; 120: lib_System.Diagnostics.EventLog.dll.so => 240
	i64 u0x15bdc156ed462f2f, ; 121: lib_System.IO.FileSystem.dll.so => 50
	i64 u0x15e300c2c1668655, ; 122: System.Resources.Writer.dll => 100
	i64 u0x16054fdcb6b3098b, ; 123: Microsoft.Extensions.DependencyModel.dll => 202
	i64 u0x162be8a76b00cd97, ; 124: lib-de-Microsoft.Data.SqlClient.resources.dll.so => 350
	i64 u0x16bf2a22df043a09, ; 125: System.IO.Pipes.dll => 55
	i64 u0x16ea2b318ad2d830, ; 126: System.Security.Cryptography.Algorithms => 119
	i64 u0x16eeae54c7ebcc08, ; 127: System.Reflection.dll => 97
	i64 u0x17125c9a85b4929f, ; 128: lib_netstandard.dll.so => 166
	i64 u0x1716866f7416792e, ; 129: lib_System.Security.AccessControl.dll.so => 117
	i64 u0x174f71c46216e44a, ; 130: Xamarin.KotlinX.Coroutines.Core => 342
	i64 u0x1752c12f1e1fc00c, ; 131: System.Core => 21
	i64 u0x1791d47293d97a1b, ; 132: lib_Npgsql.EntityFrameworkCore.PostgreSQL.dll.so => 229
	i64 u0x17b56e25558a5d36, ; 133: lib-hu-Microsoft.Maui.Controls.resources.dll.so => 374
	i64 u0x17f9358913beb16a, ; 134: System.Text.Encodings.Web => 136
	i64 u0x1809fb23f29ba44a, ; 135: lib_System.Reflection.TypeExtensions.dll.so => 96
	i64 u0x18402a709e357f3b, ; 136: lib_Xamarin.KotlinX.Serialization.Core.Jvm.dll.so => 345
	i64 u0x18a9befae51bb361, ; 137: System.Net.WebClient => 76
	i64 u0x18f0ce884e87d89a, ; 138: nb/Microsoft.Maui.Controls.resources.dll => 380
	i64 u0x193d7a04b7eda8bc, ; 139: lib_Xamarin.AndroidX.Print.dll.so => 312
	i64 u0x19777fba3c41b398, ; 140: Xamarin.AndroidX.Startup.StartupRuntime.dll => 320
	i64 u0x19a4c090f14ebb66, ; 141: System.Security.Claims => 118
	i64 u0x1a040febb58bf51e, ; 142: lib_Xamarin.AndroidX.Camera.View.dll.so => 268
	i64 u0x1a21ad8fb8814a23, ; 143: lib_UraniumUI.dll.so => 249
	i64 u0x1a6fceea64859810, ; 144: Azure.Identity => 173
	i64 u0x1a91866a319e9259, ; 145: lib_System.Collections.Concurrent.dll.so => 8
	i64 u0x1aac34d1917ba5d3, ; 146: lib_System.dll.so => 163
	i64 u0x1aad60783ffa3e5b, ; 147: lib-th-Microsoft.Maui.Controls.resources.dll.so => 389
	i64 u0x1ad25954979b4239, ; 148: de/Microsoft.SqlServer.Types.resources => 396
	i64 u0x1aea8f1c3b282172, ; 149: lib_System.Net.Ping.dll.so => 69
	i64 u0x1b4b7a1d0d265fa2, ; 150: Xamarin.Android.Glide.DiskLruCache => 253
	i64 u0x1bbdb16cfa73e785, ; 151: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.Android => 301
	i64 u0x1bc766e07b2b4241, ; 152: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 315
	i64 u0x1c753b5ff15bce1b, ; 153: Mono.Android.Runtime.dll => 169
	i64 u0x1cd47467799d8250, ; 154: System.Threading.Tasks.dll => 143
	i64 u0x1d23eafdc6dc346c, ; 155: System.Globalization.Calendars.dll => 39
	i64 u0x1d36e5f6bd20345e, ; 156: de/Microsoft.SqlServer.Types.resources.dll => 396
	i64 u0x1d4c109ca6e27ed8, ; 157: lib_Microsoft.Maui.Controls.Compatibility.dll.so => 216
	i64 u0x1da4110562816681, ; 158: Xamarin.AndroidX.Security.SecurityCrypto.dll => 318
	i64 u0x1db6820994506bf5, ; 159: System.IO.FileSystem.AccessControl.dll => 46
	i64 u0x1dbb0c2c6a999acb, ; 160: System.Diagnostics.StackTrace => 30
	i64 u0x1e3d87657e9659bc, ; 161: Xamarin.AndroidX.Navigation.UI => 311
	i64 u0x1e71143913d56c10, ; 162: lib-ko-Microsoft.Maui.Controls.resources.dll.so => 378
	i64 u0x1e7c31185e2fb266, ; 163: lib_System.Threading.Tasks.Parallel.dll.so => 142
	i64 u0x1ed8fcce5e9b50a0, ; 164: Microsoft.Extensions.Options.dll => 206
	i64 u0x1f055d15d807e1b2, ; 165: System.Xml.XmlSerializer => 161
	i64 u0x1f1ed22c1085f044, ; 166: lib_System.Diagnostics.FileVersionInfo.dll.so => 28
	i64 u0x1f61df9c5b94d2c1, ; 167: lib_System.Numerics.dll.so => 83
	i64 u0x1f750bb5421397de, ; 168: lib_Xamarin.AndroidX.Tracing.Tracing.dll.so => 322
	i64 u0x20237ea48006d7a8, ; 169: lib_System.Net.WebClient.dll.so => 76
	i64 u0x2029206e81fec6b7, ; 170: EFCore.BulkExtensions.Oracle => 178
	i64 u0x209375905fcc1bad, ; 171: lib_System.IO.Compression.Brotli.dll.so => 42
	i64 u0x20fab3cf2dfbc8df, ; 172: lib_System.Diagnostics.Process.dll.so => 29
	i64 u0x2110167c128cba15, ; 173: System.Globalization => 41
	i64 u0x21419508838f7547, ; 174: System.Runtime.CompilerServices.VisualC => 102
	i64 u0x2174319c0d835bc9, ; 175: System.Runtime => 116
	i64 u0x2198e5bc8b7153fa, ; 176: Xamarin.AndroidX.Annotation.Experimental.dll => 258
	i64 u0x2199f06354c82d3b, ; 177: System.ClientModel.dll => 237
	i64 u0x219ea1b751a4dee4, ; 178: lib_System.IO.Compression.ZipFile.dll.so => 44
	i64 u0x21cc7e445dcd5469, ; 179: System.Reflection.Emit.ILGeneration => 90
	i64 u0x220fd4f2e7c48170, ; 180: th/Microsoft.Maui.Controls.resources => 389
	i64 u0x224538d85ed15a82, ; 181: System.IO.Pipes => 55
	i64 u0x22908438c6bed1af, ; 182: lib_System.Threading.Timer.dll.so => 146
	i64 u0x22fbc14e981e3b45, ; 183: lib_Microsoft.VisualStudio.DesignTools.MobileTapContracts.dll.so => 407
	i64 u0x237be844f1f812c7, ; 184: System.Threading.Thread.dll => 144
	i64 u0x23807c59646ec4f3, ; 185: lib_Microsoft.EntityFrameworkCore.dll.so => 189
	i64 u0x23852b3bdc9f7096, ; 186: System.Resources.ResourceManager => 99
	i64 u0x23986dd7e5d4fc01, ; 187: System.IO.FileSystem.Primitives.dll => 48
	i64 u0x23f599165f90dd7a, ; 188: lib-cs-Microsoft.Data.SqlClient.resources.dll.so => 349
	i64 u0x2407aef2bbe8fadf, ; 189: System.Console => 20
	i64 u0x240abe014b27e7d3, ; 190: Xamarin.AndroidX.Core.dll => 277
	i64 u0x247619fe4413f8bf, ; 191: System.Runtime.Serialization.Primitives.dll => 113
	i64 u0x24de8d301281575e, ; 192: Xamarin.Android.Glide => 251
	i64 u0x252073cc3caa62c2, ; 193: fr/Microsoft.Maui.Controls.resources.dll => 370
	i64 u0x256b8d41255f01b1, ; 194: Xamarin.Google.Crypto.Tink.Android => 334
	i64 u0x25a0a7eff76ea08e, ; 195: SQLitePCLRaw.batteries_v2.dll => 233
	i64 u0x25e1850d10cdc8f7, ; 196: lib_Xamarin.AndroidX.Camera.Camera2.dll.so => 265
	i64 u0x2662c629b96b0b30, ; 197: lib_Xamarin.Kotlin.StdLib.dll.so => 338
	i64 u0x268c1439f13bcc29, ; 198: lib_Microsoft.Extensions.Primitives.dll.so => 207
	i64 u0x268f1dca6d06d437, ; 199: Xamarin.AndroidX.Camera.Core => 266
	i64 u0x26966e2539bcd4cc, ; 200: zh-Hant/Microsoft.SqlServer.Types.resources.dll => 405
	i64 u0x26a670e154a9c54b, ; 201: System.Reflection.Extensions.dll => 93
	i64 u0x26d077d9678fe34f, ; 202: System.IO.dll => 57
	i64 u0x270a44600c921861, ; 203: System.IdentityModel.Tokens.Jwt => 244
	i64 u0x273f3515de5faf0d, ; 204: id/Microsoft.Maui.Controls.resources.dll => 375
	i64 u0x2742545f9094896d, ; 205: hr/Microsoft.Maui.Controls.resources => 373
	i64 u0x2759af78ab94d39b, ; 206: System.Net.WebSockets => 80
	i64 u0x27b2b16f3e9de038, ; 207: Xamarin.Google.Crypto.Tink.Android.dll => 334
	i64 u0x27b410442fad6cf1, ; 208: Java.Interop.dll => 167
	i64 u0x27b97e0d52c3034a, ; 209: System.Diagnostics.Debug => 26
	i64 u0x2801845a2c71fbfb, ; 210: System.Net.Primitives.dll => 70
	i64 u0x286835e259162700, ; 211: lib_Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll.so => 313
	i64 u0x28c1b67181e65f11, ; 212: lib-es-Microsoft.SqlServer.Types.resources.dll.so => 397
	i64 u0x2949f3617a02c6b2, ; 213: Xamarin.AndroidX.ExifInterface => 287
	i64 u0x29f947844fb7fc11, ; 214: Microsoft.Maui.Controls.HotReload.Forms => 406
	i64 u0x2a128783efe70ba0, ; 215: uk/Microsoft.Maui.Controls.resources.dll => 391
	i64 u0x2a3b095612184159, ; 216: lib_System.Net.NetworkInformation.dll.so => 68
	i64 u0x2a6507a5ffabdf28, ; 217: System.Diagnostics.TraceSource.dll => 33
	i64 u0x2ad156c8e1354139, ; 218: fi/Microsoft.Maui.Controls.resources => 369
	i64 u0x2ad5d6b13b7a3e04, ; 219: System.ComponentModel.DataAnnotations.dll => 14
	i64 u0x2af298f63581d886, ; 220: System.Text.RegularExpressions.dll => 137
	i64 u0x2af615542f04da50, ; 221: System.IdentityModel.Tokens.Jwt.dll => 244
	i64 u0x2afc1c4f898552ee, ; 222: lib_System.Formats.Asn1.dll.so => 243
	i64 u0x2b148910ed40fbf9, ; 223: zh-Hant/Microsoft.Maui.Controls.resources.dll => 395
	i64 u0x2b6989d78cba9a15, ; 224: Xamarin.AndroidX.Concurrent.Futures.dll => 273
	i64 u0x2c8bd14bb93a7d82, ; 225: lib-pl-Microsoft.Maui.Controls.resources.dll.so => 382
	i64 u0x2cbd9262ca785540, ; 226: lib_System.Text.Encoding.CodePages.dll.so => 133
	i64 u0x2cc9e1fed6257257, ; 227: lib_System.Reflection.Emit.Lightweight.dll.so => 91
	i64 u0x2cd723e9fe623c7c, ; 228: lib_System.Private.Xml.Linq.dll.so => 87
	i64 u0x2ce66f4c8733e883, ; 229: pt-BR/Microsoft.Data.SqlClient.resources.dll => 357
	i64 u0x2d169d318a968379, ; 230: System.Threading.dll => 147
	i64 u0x2d47774b7d993f59, ; 231: sv/Microsoft.Maui.Controls.resources.dll => 388
	i64 u0x2d5ffcae1ad0aaca, ; 232: System.Data.dll => 24
	i64 u0x2db915caf23548d2, ; 233: System.Text.Json.dll => 248
	i64 u0x2dcaa0bb15a4117a, ; 234: System.IO.UnmanagedMemoryStream.dll => 56
	i64 u0x2e5a40c319acb800, ; 235: System.IO.FileSystem => 50
	i64 u0x2e6f1f226821322a, ; 236: el/Microsoft.Maui.Controls.resources.dll => 367
	i64 u0x2ece398cbf74c03b, ; 237: lib_EFCore.BulkExtensions.SqlServer.dll.so => 181
	i64 u0x2f02f94df3200fe5, ; 238: System.Diagnostics.Process => 29
	i64 u0x2f2e98e1c89b1aff, ; 239: System.Xml.ReaderWriter => 155
	i64 u0x2f40b2521deba305, ; 240: lib_Microsoft.SqlServer.Server.dll.so => 222
	i64 u0x2f5911d9ba814e4e, ; 241: System.Diagnostics.Tracing => 34
	i64 u0x2f84070a459bc31f, ; 242: lib_System.Xml.dll.so => 162
	i64 u0x2feb4d2fcda05cfd, ; 243: Microsoft.Extensions.Caching.Abstractions.dll => 196
	i64 u0x309ee9eeec09a71e, ; 244: lib_Xamarin.AndroidX.Fragment.dll.so => 288
	i64 u0x309f2bedefa9a318, ; 245: Microsoft.IdentityModel.Abstractions => 210
	i64 u0x30c6dda129408828, ; 246: System.IO.IsolatedStorage => 51
	i64 u0x30ef53e00b9230df, ; 247: NetTopologySuite.IO.SpatiaLite => 225
	i64 u0x31195fef5d8fb552, ; 248: _Microsoft.Android.Resource.Designer.dll => 409
	i64 u0x312c8ed623cbfc8d, ; 249: Xamarin.AndroidX.Window.dll => 329
	i64 u0x31496b779ed0663d, ; 250: lib_System.Reflection.DispatchProxy.dll.so => 89
	i64 u0x32243413e774362a, ; 251: Xamarin.AndroidX.CardView.dll => 269
	i64 u0x323062994a141225, ; 252: lib-zh-Hans-Microsoft.SqlServer.Types.resources.dll.so => 404
	i64 u0x3235427f8d12dae1, ; 253: lib_System.Drawing.Primitives.dll.so => 35
	i64 u0x329753a17a517811, ; 254: fr/Microsoft.Maui.Controls.resources => 370
	i64 u0x32aa989ff07a84ff, ; 255: lib_System.Xml.ReaderWriter.dll.so => 155
	i64 u0x33829542f112d59b, ; 256: System.Collections.Immutable => 9
	i64 u0x33a31443733849fe, ; 257: lib-es-Microsoft.Maui.Controls.resources.dll.so => 368
	i64 u0x341abc357fbb4ebf, ; 258: lib_System.Net.Sockets.dll.so => 75
	i64 u0x348d598f4054415e, ; 259: Microsoft.SqlServer.Server => 222
	i64 u0x3496c1e2dcaf5ecc, ; 260: lib_System.IO.Pipes.AccessControl.dll.so => 54
	i64 u0x34b2bc8bc64a1107, ; 261: System.Diagnostics.PerformanceCounter.dll => 241
	i64 u0x34c492cef793bb77, ; 262: lib_InputKit.Maui.dll.so => 183
	i64 u0x34dfd74fe2afcf37, ; 263: Microsoft.Maui => 219
	i64 u0x34e292762d9615df, ; 264: cs/Microsoft.Maui.Controls.resources.dll => 364
	i64 u0x3508234247f48404, ; 265: Microsoft.Maui.Controls => 217
	i64 u0x353590da528c9d22, ; 266: System.ComponentModel.Annotations => 13
	i64 u0x3549870798b4cd30, ; 267: lib_Xamarin.AndroidX.ViewPager2.dll.so => 328
	i64 u0x355282fc1c909694, ; 268: Microsoft.Extensions.Configuration => 198
	i64 u0x3552fc5d578f0fbf, ; 269: Xamarin.AndroidX.Arch.Core.Common => 262
	i64 u0x355c649948d55d97, ; 270: lib_System.Runtime.Intrinsics.dll.so => 108
	i64 u0x35ea9d1c6834bc8c, ; 271: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 304
	i64 u0x36263608556d5d42, ; 272: Npgsql.dll => 228
	i64 u0x3628ab68db23a01a, ; 273: lib_System.Diagnostics.Tools.dll.so => 32
	i64 u0x3673b042508f5b6b, ; 274: lib_System.Runtime.Extensions.dll.so => 103
	i64 u0x36740f1a8ecdc6c4, ; 275: System.Numerics => 83
	i64 u0x36b2b50fdf589ae2, ; 276: System.Reflection.Emit.Lightweight => 91
	i64 u0x36cada77dc79928b, ; 277: System.IO.MemoryMappedFiles => 52
	i64 u0x36d2129305806e75, ; 278: UraniumUI => 249
	i64 u0x37410855534260db, ; 279: fr/Microsoft.SqlServer.Types.resources.dll => 398
	i64 u0x374ef46b06791af6, ; 280: System.Reflection.Primitives.dll => 95
	i64 u0x376bf93e521a5417, ; 281: lib_Xamarin.Jetbrains.Annotations.dll.so => 337
	i64 u0x37bc29f3183003b6, ; 282: lib_System.IO.dll.so => 57
	i64 u0x380134e03b1e160a, ; 283: System.Collections.Immutable.dll => 9
	i64 u0x38049b5c59b39324, ; 284: System.Runtime.CompilerServices.Unsafe => 101
	i64 u0x382453cb85fe3f82, ; 285: lib_EFCore.BulkExtensions.Sqlite.dll.so => 180
	i64 u0x382b20286945c849, ; 286: lib_Microsoft.Bcl.Cryptography.dll.so => 186
	i64 u0x385c17636bb6fe6e, ; 287: Xamarin.AndroidX.CustomView.dll => 280
	i64 u0x38869c811d74050e, ; 288: System.Net.NameResolution.dll => 67
	i64 u0x38e93ec1c057cdf6, ; 289: Microsoft.IdentityModel.Protocols => 213
	i64 u0x39251dccb84bdcaa, ; 290: lib_System.Configuration.ConfigurationManager.dll.so => 238
	i64 u0x393c226616977fdb, ; 291: lib_Xamarin.AndroidX.ViewPager.dll.so => 327
	i64 u0x395e37c3334cf82a, ; 292: lib-ca-Microsoft.Maui.Controls.resources.dll.so => 363
	i64 u0x39aa39fda111d9d3, ; 293: Newtonsoft.Json => 227
	i64 u0x39d48361041cb258, ; 294: store.dll => 0
	i64 u0x3ab5859054645f72, ; 295: System.Security.Cryptography.Primitives.dll => 124
	i64 u0x3ad75090c3fac0e9, ; 296: lib_Xamarin.AndroidX.ResourceInspection.Annotation.dll.so => 315
	i64 u0x3ae44ac43a1fbdbb, ; 297: System.Runtime.Serialization => 115
	i64 u0x3b860f9932505633, ; 298: lib_System.Text.Encoding.Extensions.dll.so => 134
	i64 u0x3bea9ebe8c027c01, ; 299: lib_Microsoft.IdentityModel.Tokens.dll.so => 215
	i64 u0x3c3aafb6b3a00bf6, ; 300: lib_System.Security.Cryptography.X509Certificates.dll.so => 125
	i64 u0x3c4049146b59aa90, ; 301: System.Runtime.InteropServices.JavaScript => 105
	i64 u0x3c5f19e4acdcebd8, ; 302: lib_Microsoft.Data.SqlClient.dll.so => 187
	i64 u0x3c7c495f58ac5ee9, ; 303: Xamarin.Kotlin.StdLib => 338
	i64 u0x3c7e5ed3d5db71bb, ; 304: System.Security => 130
	i64 u0x3cd9d281d402eb9b, ; 305: Xamarin.AndroidX.Browser.dll => 264
	i64 u0x3ced6a4f3010aa96, ; 306: ZXing.Net.MAUI.Controls => 348
	i64 u0x3d196e782ed8c01a, ; 307: System.Data.SqlClient => 239
	i64 u0x3d1c50cc001a991e, ; 308: Xamarin.Google.Guava.ListenableFuture.dll => 336
	i64 u0x3d2b1913edfc08d7, ; 309: lib_System.Threading.ThreadPool.dll.so => 145
	i64 u0x3d46f0b995082740, ; 310: System.Xml.Linq => 154
	i64 u0x3d8a8f400514a790, ; 311: Xamarin.AndroidX.Fragment.Ktx.dll => 289
	i64 u0x3d9c2a242b040a50, ; 312: lib_Xamarin.AndroidX.Core.dll.so => 277
	i64 u0x3da7781d6333a8fe, ; 313: SQLitePCLRaw.batteries_v2 => 233
	i64 u0x3dbb6b9f5ab90fa7, ; 314: lib_Xamarin.AndroidX.DynamicAnimation.dll.so => 284
	i64 u0x3e0b360b2840f096, ; 315: it/Microsoft.Data.SqlClient.resources => 353
	i64 u0x3e5441657549b213, ; 316: Xamarin.AndroidX.ResourceInspection.Annotation => 315
	i64 u0x3e57d4d195c53c2e, ; 317: System.Reflection.TypeExtensions => 96
	i64 u0x3e616ab4ed1f3f15, ; 318: lib_System.Data.dll.so => 24
	i64 u0x3f1d226e6e06db7e, ; 319: Xamarin.AndroidX.SlidingPaneLayout.dll => 319
	i64 u0x3f3c8f45ab6f28c7, ; 320: Microsoft.Identity.Client.Extensions.Msal.dll => 209
	i64 u0x3f510adf788828dd, ; 321: System.Threading.Tasks.Extensions => 141
	i64 u0x407740ff2e914d86, ; 322: Xamarin.AndroidX.Print.dll => 312
	i64 u0x407a10bb4bf95829, ; 323: lib_Xamarin.AndroidX.Navigation.Common.dll.so => 308
	i64 u0x407a8d1779c33f16, ; 324: System.Diagnostics.PerformanceCounter => 241
	i64 u0x407ac43dee26bd5a, ; 325: lib_Azure.Identity.dll.so => 173
	i64 u0x40c98b6bd77346d4, ; 326: Microsoft.VisualBasic.dll => 3
	i64 u0x4104d92598b18888, ; 327: NetTopologySuite => 224
	i64 u0x415e36f6b13ff6f3, ; 328: System.Configuration.ConfigurationManager.dll => 238
	i64 u0x41833cf766d27d96, ; 329: mscorlib => 165
	i64 u0x41cab042be111c34, ; 330: lib_Xamarin.AndroidX.AppCompat.AppCompatResources.dll.so => 261
	i64 u0x423a9ecc4d905a88, ; 331: lib_System.Resources.ResourceManager.dll.so => 99
	i64 u0x423bf51ae7def810, ; 332: System.Xml.XPath => 159
	i64 u0x42462ff15ddba223, ; 333: System.Resources.Reader.dll => 98
	i64 u0x42a31b86e6ccc3f0, ; 334: System.Diagnostics.Contracts => 25
	i64 u0x430e95b891249788, ; 335: lib_System.Reflection.Emit.dll.so => 92
	i64 u0x43375950ec7c1b6a, ; 336: netstandard.dll => 166
	i64 u0x434c4e1d9284cdae, ; 337: Mono.Android.dll => 170
	i64 u0x43505013578652a0, ; 338: lib_Xamarin.AndroidX.Activity.Ktx.dll.so => 256
	i64 u0x437d06c381ed575a, ; 339: lib_Microsoft.VisualBasic.dll.so => 3
	i64 u0x4394150249e83099, ; 340: lib_store.dll.so => 0
	i64 u0x43950f84de7cc79a, ; 341: pl/Microsoft.Maui.Controls.resources.dll => 382
	i64 u0x4396b4cdb6b3bafc, ; 342: lib-ru-Microsoft.SqlServer.Types.resources.dll.so => 403
	i64 u0x43e8ca5bc927ff37, ; 343: lib_Xamarin.AndroidX.Emoji2.ViewsHelper.dll.so => 286
	i64 u0x448bd33429269b19, ; 344: Microsoft.CSharp => 1
	i64 u0x4499fa3c8e494654, ; 345: lib_System.Runtime.Serialization.Primitives.dll.so => 113
	i64 u0x4515080865a951a5, ; 346: Xamarin.Kotlin.StdLib.dll => 338
	i64 u0x453c1277f85cf368, ; 347: lib_Microsoft.EntityFrameworkCore.Abstractions.dll.so => 190
	i64 u0x4545802489b736b9, ; 348: Xamarin.AndroidX.Fragment.Ktx => 289
	i64 u0x454b4d1e66bb783c, ; 349: Xamarin.AndroidX.Lifecycle.Process => 297
	i64 u0x458d2df79ac57c1d, ; 350: lib_System.IdentityModel.Tokens.Jwt.dll.so => 244
	i64 u0x45c40276a42e283e, ; 351: System.Diagnostics.TraceSource => 33
	i64 u0x45d443f2a29adc37, ; 352: System.AppContext.dll => 6
	i64 u0x45fcc9fd66f25095, ; 353: Microsoft.Extensions.DependencyModel => 202
	i64 u0x46a4213bc97fe5ae, ; 354: lib-ru-Microsoft.Maui.Controls.resources.dll.so => 386
	i64 u0x47358bd471172e1d, ; 355: lib_System.Xml.Linq.dll.so => 154
	i64 u0x4787a936949fcac2, ; 356: System.Memory.Data.dll => 245
	i64 u0x47daf4e1afbada10, ; 357: pt/Microsoft.Maui.Controls.resources => 384
	i64 u0x480c0a47dd42dd81, ; 358: lib_System.IO.MemoryMappedFiles.dll.so => 52
	i64 u0x488d293220a4fe37, ; 359: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 291
	i64 u0x49e952f19a4e2022, ; 360: System.ObjectModel => 84
	i64 u0x49f9e6948a8131e4, ; 361: lib_Xamarin.AndroidX.VersionedParcelable.dll.so => 326
	i64 u0x4a5667b2462a664b, ; 362: lib_Xamarin.AndroidX.Navigation.UI.dll.so => 311
	i64 u0x4a7a18981dbd56bc, ; 363: System.IO.Compression.FileSystem.dll => 43
	i64 u0x4aa5c60350917c06, ; 364: lib_Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll.so => 296
	i64 u0x4b07a0ed0ab33ff4, ; 365: System.Runtime.Extensions.dll => 103
	i64 u0x4b576d47ac054f3c, ; 366: System.IO.FileSystem.AccessControl => 46
	i64 u0x4b7b6532ded934b7, ; 367: System.Text.Json => 248
	i64 u0x4b8f8ea3c2df6bb0, ; 368: System.ClientModel => 237
	i64 u0x4c7755cf07ad2d5f, ; 369: System.Net.Http.Json.dll => 63
	i64 u0x4ca014ceac582c86, ; 370: Microsoft.EntityFrameworkCore.Relational.dll => 191
	i64 u0x4cc5f15266470798, ; 371: lib_Xamarin.AndroidX.Loader.dll.so => 306
	i64 u0x4cf6f67dc77aacd2, ; 372: System.Net.NetworkInformation.dll => 68
	i64 u0x4d3183dd245425d4, ; 373: System.Net.WebSockets.Client.dll => 79
	i64 u0x4d479f968a05e504, ; 374: System.Linq.Expressions.dll => 58
	i64 u0x4d55a010ffc4faff, ; 375: System.Private.Xml => 88
	i64 u0x4d5cbe77561c5b2e, ; 376: System.Web.dll => 152
	i64 u0x4d6001db23f8cd87, ; 377: lib_System.ClientModel.dll.so => 237
	i64 u0x4d77512dbd86ee4c, ; 378: lib_Xamarin.AndroidX.Arch.Core.Common.dll.so => 262
	i64 u0x4d7793536e79c309, ; 379: System.ServiceProcess => 132
	i64 u0x4d91e5c949c8f5e5, ; 380: InputKit.Maui.dll => 183
	i64 u0x4d95fccc1f67c7ca, ; 381: System.Runtime.Loader.dll => 109
	i64 u0x4da4a8f0f6a70fdc, ; 382: Microsoft.Maui.Controls.Compatibility.dll => 216
	i64 u0x4dcf44c3c9b076a2, ; 383: it/Microsoft.Maui.Controls.resources.dll => 376
	i64 u0x4dd9247f1d2c3235, ; 384: Xamarin.AndroidX.Loader.dll => 306
	i64 u0x4e2aeee78e2c4a87, ; 385: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 313
	i64 u0x4e32f00cb0937401, ; 386: Mono.Android.Runtime => 169
	i64 u0x4e5eea4668ac2b18, ; 387: System.Text.Encoding.CodePages => 133
	i64 u0x4ebd0c4b82c5eefc, ; 388: lib_System.Threading.Channels.dll.so => 138
	i64 u0x4ee8eaa9c9c1151a, ; 389: System.Globalization.Calendars => 39
	i64 u0x4f21ee6ef9eb527e, ; 390: ca/Microsoft.Maui.Controls.resources => 363
	i64 u0x4f27ca9d6e02176c, ; 391: cs/Microsoft.Data.SqlClient.resources => 349
	i64 u0x4f3ba6ee468f1365, ; 392: es/Microsoft.SqlServer.Types.resources.dll => 397
	i64 u0x4fd5f3ee53d0a4f0, ; 393: SQLitePCLRaw.lib.e_sqlite3.android => 235
	i64 u0x4ffd65baff757598, ; 394: Microsoft.IdentityModel.Tokens => 215
	i64 u0x50320f2a19424f3f, ; 395: lib-it-Microsoft.Data.SqlClient.resources.dll.so => 353
	i64 u0x5037f0be3c28c7a3, ; 396: lib_Microsoft.Maui.Controls.dll.so => 217
	i64 u0x505aa0ca2d672b22, ; 397: Microsoft.EntityFrameworkCore.SqlServer.HierarchyId => 195
	i64 u0x506203448c473a65, ; 398: Xamarin.Google.AutoValue.Annotations => 332
	i64 u0x50c3a29b21050d45, ; 399: System.Linq.Parallel.dll => 59
	i64 u0x5112ed116d87baf8, ; 400: CommunityToolkit.Mvvm => 176
	i64 u0x5131bbe80989093f, ; 401: Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll => 303
	i64 u0x5146d4e23aed3198, ; 402: ja/Microsoft.Data.SqlClient.resources => 354
	i64 u0x516324a5050a7e3c, ; 403: System.Net.WebProxy => 78
	i64 u0x516d6f0b21a303de, ; 404: lib_System.Diagnostics.Contracts.dll.so => 25
	i64 u0x51bb8a2afe774e32, ; 405: System.Drawing => 36
	i64 u0x5247c5c32a4140f0, ; 406: System.Resources.Reader => 98
	i64 u0x526bb15e3c386364, ; 407: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 300
	i64 u0x526ce79eb8e90527, ; 408: lib_System.Net.Primitives.dll.so => 70
	i64 u0x52829f00b4467c38, ; 409: lib_System.Data.Common.dll.so => 22
	i64 u0x5290402954d7bce0, ; 410: zh-Hans/Microsoft.Data.SqlClient.resources => 360
	i64 u0x529ffe06f39ab8db, ; 411: Xamarin.AndroidX.Core => 277
	i64 u0x52ff996554dbf352, ; 412: Microsoft.Maui.Graphics => 221
	i64 u0x53128e94caa50e17, ; 413: Oracle.ManagedDataAccess => 231
	i64 u0x535f7e40e8fef8af, ; 414: lib-sk-Microsoft.Maui.Controls.resources.dll.so => 387
	i64 u0x53978aac584c666e, ; 415: lib_System.Security.Cryptography.Cng.dll.so => 120
	i64 u0x53a96d5c86c9e194, ; 416: System.Net.NetworkInformation => 68
	i64 u0x53be1038a61e8d44, ; 417: System.Runtime.InteropServices.RuntimeInformation.dll => 106
	i64 u0x53c3014b9437e684, ; 418: lib-zh-HK-Microsoft.Maui.Controls.resources.dll.so => 393
	i64 u0x53e450ebd586f842, ; 419: lib_Xamarin.AndroidX.LocalBroadcastManager.dll.so => 307
	i64 u0x5435e6f049e9bc37, ; 420: System.Security.Claims.dll => 118
	i64 u0x54795225dd1587af, ; 421: lib_System.Runtime.dll.so => 116
	i64 u0x547a34f14e5f6210, ; 422: Xamarin.AndroidX.Lifecycle.Common.dll => 292
	i64 u0x556e8b63b660ab8b, ; 423: Xamarin.AndroidX.Lifecycle.Common.Jvm.dll => 293
	i64 u0x5588627c9a108ec9, ; 424: System.Collections.Specialized => 11
	i64 u0x55a898e4f42e3fae, ; 425: Microsoft.VisualBasic.Core.dll => 2
	i64 u0x55fa0c610fe93bb1, ; 426: lib_System.Security.Cryptography.OpenSsl.dll.so => 123
	i64 u0x56442b99bc64bb47, ; 427: System.Runtime.Serialization.Xml.dll => 114
	i64 u0x56a8b26e1aeae27b, ; 428: System.Threading.Tasks.Dataflow => 140
	i64 u0x56f932d61e93c07f, ; 429: System.Globalization.Extensions => 40
	i64 u0x571c5cfbec5ae8e2, ; 430: System.Private.Uri => 86
	i64 u0x576499c9f52fea31, ; 431: Xamarin.AndroidX.Annotation => 257
	i64 u0x578cd35c91d7b347, ; 432: lib_SQLitePCLRaw.core.dll.so => 234
	i64 u0x579a06fed6eec900, ; 433: System.Private.CoreLib.dll => 171
	i64 u0x57c542c14049b66d, ; 434: System.Diagnostics.DiagnosticSource => 27
	i64 u0x581a8bd5cfda563e, ; 435: System.Threading.Timer => 146
	i64 u0x58601b2dda4a27b9, ; 436: lib-ja-Microsoft.Maui.Controls.resources.dll.so => 377
	i64 u0x58688d9af496b168, ; 437: Microsoft.Extensions.DependencyInjection.dll => 200
	i64 u0x588c167a79db6bfb, ; 438: lib_Xamarin.Google.ErrorProne.Annotations.dll.so => 335
	i64 u0x5906028ae5151104, ; 439: Xamarin.AndroidX.Activity.Ktx => 256
	i64 u0x595a356d23e8da9a, ; 440: lib_Microsoft.CSharp.dll.so => 1
	i64 u0x59f9e60b9475085f, ; 441: lib_Xamarin.AndroidX.Annotation.Experimental.dll.so => 258
	i64 u0x5a70033ca9d003cb, ; 442: lib_System.Memory.Data.dll.so => 245
	i64 u0x5a745f5101a75527, ; 443: lib_System.IO.Compression.FileSystem.dll.so => 43
	i64 u0x5a89a886ae30258d, ; 444: lib_Xamarin.AndroidX.CoordinatorLayout.dll.so => 276
	i64 u0x5a8f6699f4a1caa9, ; 445: lib_System.Threading.dll.so => 147
	i64 u0x5ae8e4f3eae4d547, ; 446: Xamarin.AndroidX.Legacy.Support.Core.Utils => 291
	i64 u0x5ae9cd33b15841bf, ; 447: System.ComponentModel => 18
	i64 u0x5b54391bdc6fcfe6, ; 448: System.Private.DataContractSerialization => 85
	i64 u0x5b5f0e240a06a2a2, ; 449: da/Microsoft.Maui.Controls.resources.dll => 365
	i64 u0x5b8109e8e14c5e3e, ; 450: System.Globalization.Extensions.dll => 40
	i64 u0x5bddd04d72a9e350, ; 451: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 296
	i64 u0x5bdf16b09da116ab, ; 452: Xamarin.AndroidX.Collection => 270
	i64 u0x5bf46332cc09e9b2, ; 453: lib_System.Data.SqlClient.dll.so => 239
	i64 u0x5c019d5266093159, ; 454: lib_Xamarin.AndroidX.Lifecycle.Runtime.Ktx.Android.dll.so => 301
	i64 u0x5c30a4a35f9cc8c4, ; 455: lib_System.Reflection.Extensions.dll.so => 93
	i64 u0x5c393624b8176517, ; 456: lib_Microsoft.Extensions.Logging.dll.so => 203
	i64 u0x5c53c29f5073b0c9, ; 457: System.Diagnostics.FileVersionInfo => 28
	i64 u0x5c87463c575c7616, ; 458: lib_System.Globalization.Extensions.dll.so => 40
	i64 u0x5ce309995937d5a0, ; 459: pt-BR/Microsoft.SqlServer.Types.resources.dll => 402
	i64 u0x5d0a4a29b02d9d3c, ; 460: System.Net.WebHeaderCollection.dll => 77
	i64 u0x5d1b514fc45c92d4, ; 461: ZXing.Net.MAUI => 347
	i64 u0x5d33da2f84c1de97, ; 462: lib-pt-BR-Microsoft.Data.SqlClient.resources.dll.so => 357
	i64 u0x5d40c9b15181641f, ; 463: lib_Xamarin.AndroidX.Emoji2.dll.so => 285
	i64 u0x5d6ca10d35e9485b, ; 464: lib_Xamarin.AndroidX.Concurrent.Futures.dll.so => 273
	i64 u0x5d7960d446a1890e, ; 465: lib-pl-Microsoft.Data.SqlClient.resources.dll.so => 356
	i64 u0x5d7ec76c1c703055, ; 466: System.Threading.Tasks.Parallel => 142
	i64 u0x5db0cbbd1028510e, ; 467: lib_System.Runtime.InteropServices.dll.so => 107
	i64 u0x5db30905d3e5013b, ; 468: Xamarin.AndroidX.Collection.Jvm.dll => 271
	i64 u0x5e467bc8f09ad026, ; 469: System.Collections.Specialized.dll => 11
	i64 u0x5e5173b3208d97e7, ; 470: System.Runtime.Handles.dll => 104
	i64 u0x5ea92fdb19ec8c4c, ; 471: System.Text.Encodings.Web.dll => 136
	i64 u0x5eb8046dd40e9ac3, ; 472: System.ComponentModel.Primitives => 16
	i64 u0x5ec272d219c9aba4, ; 473: System.Security.Cryptography.Csp.dll => 121
	i64 u0x5eee1376d94c7f5e, ; 474: System.Net.HttpListener.dll => 65
	i64 u0x5f0980ab8131b542, ; 475: EFCore.BulkExtensions.Sqlite => 180
	i64 u0x5f36ccf5c6a57e24, ; 476: System.Xml.ReaderWriter.dll => 155
	i64 u0x5f4294b9b63cb842, ; 477: System.Data.Common => 22
	i64 u0x5f5be00b819666f1, ; 478: ru/Microsoft.SqlServer.Types.resources => 403
	i64 u0x5f7399e166075632, ; 479: lib_SQLitePCLRaw.lib.e_sqlite3.android.dll.so => 235
	i64 u0x5f9a2d823f664957, ; 480: lib-el-Microsoft.Maui.Controls.resources.dll.so => 367
	i64 u0x5fa6da9c3cd8142a, ; 481: lib_Xamarin.KotlinX.Serialization.Core.dll.so => 344
	i64 u0x5fac98e0b37a5b9d, ; 482: System.Runtime.CompilerServices.Unsafe.dll => 101
	i64 u0x609f4b7b63d802d4, ; 483: lib_Microsoft.Extensions.DependencyInjection.dll.so => 200
	i64 u0x60cd4e33d7e60134, ; 484: Xamarin.KotlinX.Coroutines.Core.Jvm => 343
	i64 u0x60f62d786afcf130, ; 485: System.Memory => 62
	i64 u0x61bb78c89f867353, ; 486: System.IO => 57
	i64 u0x61be8d1299194243, ; 487: Microsoft.Maui.Controls.Xaml => 218
	i64 u0x61d2cba29557038f, ; 488: de/Microsoft.Maui.Controls.resources => 366
	i64 u0x61d88f399afb2f45, ; 489: lib_System.Runtime.Loader.dll.so => 109
	i64 u0x6219beeff33faa04, ; 490: cs/Microsoft.Data.SqlClient.resources.dll => 349
	i64 u0x622eef6f9e59068d, ; 491: System.Private.CoreLib => 171
	i64 u0x625def565caafc1c, ; 492: tr/Microsoft.Data.SqlClient.resources.dll => 359
	i64 u0x62812a93be7f3265, ; 493: Microsoft.Bcl.Cryptography => 186
	i64 u0x63d5e3aa4ef9b931, ; 494: Xamarin.KotlinX.Coroutines.Android.dll => 341
	i64 u0x63f1f6883c1e23c2, ; 495: lib_System.Collections.Immutable.dll.so => 9
	i64 u0x6400f68068c1e9f1, ; 496: Xamarin.Google.Android.Material.dll => 331
	i64 u0x640e3b14dbd325c2, ; 497: System.Security.Cryptography.Algorithms.dll => 119
	i64 u0x641bebf7cee18d1c, ; 498: Microsoft.EntityFrameworkCore.SqlServer.Abstractions.dll => 194
	i64 u0x64587004560099b9, ; 499: System.Reflection => 97
	i64 u0x6468947914df5c9c, ; 500: Microsoft.Bcl.Cryptography.dll => 186
	i64 u0x64b1529a438a3c45, ; 501: lib_System.Runtime.Handles.dll.so => 104
	i64 u0x6565fba2cd8f235b, ; 502: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 304
	i64 u0x658f524e4aba7dad, ; 503: CommunityToolkit.Maui.dll => 174
	i64 u0x65ecac39144dd3cc, ; 504: Microsoft.Maui.Controls.dll => 217
	i64 u0x65ece51227bfa724, ; 505: lib_System.Runtime.Numerics.dll.so => 110
	i64 u0x661722438787b57f, ; 506: Xamarin.AndroidX.Annotation.Jvm.dll => 259
	i64 u0x6679b2337ee6b22a, ; 507: lib_System.IO.FileSystem.Primitives.dll.so => 48
	i64 u0x6692e924eade1b29, ; 508: lib_System.Console.dll.so => 20
	i64 u0x66a4e5c6a3fb0bae, ; 509: lib_Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll.so => 303
	i64 u0x66d13304ce1a3efa, ; 510: Xamarin.AndroidX.CursorAdapter => 279
	i64 u0x674303f65d8fad6f, ; 511: lib_System.Net.Quic.dll.so => 71
	i64 u0x6756ca4cad62e9d6, ; 512: lib_Xamarin.AndroidX.ConstraintLayout.Core.dll.so => 275
	i64 u0x677569b965946273, ; 513: ko/Microsoft.SqlServer.Types.resources.dll => 401
	i64 u0x67c0802770244408, ; 514: System.Windows.dll => 153
	i64 u0x67c0d6eb5a84aa5a, ; 515: lib_System.Diagnostics.PerformanceCounter.dll.so => 241
	i64 u0x68100b69286e27cd, ; 516: lib_System.Formats.Tar.dll.so => 38
	i64 u0x68558ec653afa616, ; 517: lib-da-Microsoft.Maui.Controls.resources.dll.so => 365
	i64 u0x6872ec7a2e36b1ac, ; 518: System.Drawing.Primitives.dll => 35
	i64 u0x68bb2c417aa9b61c, ; 519: Xamarin.KotlinX.AtomicFU.dll => 339
	i64 u0x68fbbbe2eb455198, ; 520: System.Formats.Asn1 => 243
	i64 u0x69063fc0ba8e6bdd, ; 521: he/Microsoft.Maui.Controls.resources.dll => 371
	i64 u0x699dffb2427a2d71, ; 522: SQLitePCLRaw.lib.e_sqlite3.android.dll => 235
	i64 u0x69a3e26c76f6eec4, ; 523: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 330
	i64 u0x6a4d7577b2317255, ; 524: System.Runtime.InteropServices.dll => 107
	i64 u0x6ace3b74b15ee4a4, ; 525: nb/Microsoft.Maui.Controls.resources => 380
	i64 u0x6afcedb171067e2b, ; 526: System.Core.dll => 21
	i64 u0x6bef98e124147c24, ; 527: Xamarin.Jetbrains.Annotations => 337
	i64 u0x6c7d5f4d06aadeaa, ; 528: EFCore.BulkExtensions.SqlServer.dll => 181
	i64 u0x6cd97f370311a542, ; 529: Microsoft.EntityFrameworkCore.SqlServer => 193
	i64 u0x6ce874bff138ce2b, ; 530: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 302
	i64 u0x6d0a12b2adba20d8, ; 531: System.Security.Cryptography.ProtectedData.dll => 247
	i64 u0x6d12bfaa99c72b1f, ; 532: lib_Microsoft.Maui.Graphics.dll.so => 221
	i64 u0x6d3b7628f8253e93, ; 533: pl/Microsoft.Data.SqlClient.resources => 356
	i64 u0x6d70755158ca866e, ; 534: lib_System.ComponentModel.EventBasedAsync.dll.so => 15
	i64 u0x6d79993361e10ef2, ; 535: Microsoft.Extensions.Primitives => 207
	i64 u0x6d7eeca99577fc8b, ; 536: lib_System.Net.WebProxy.dll.so => 78
	i64 u0x6d8515b19946b6a2, ; 537: System.Net.WebProxy.dll => 78
	i64 u0x6d86d56b84c8eb71, ; 538: lib_Xamarin.AndroidX.CursorAdapter.dll.so => 279
	i64 u0x6d9bea6b3e895cf7, ; 539: Microsoft.Extensions.Primitives.dll => 207
	i64 u0x6dd9bf4083de3f6a, ; 540: Xamarin.AndroidX.DocumentFile.dll => 282
	i64 u0x6e25a02c3833319a, ; 541: lib_Xamarin.AndroidX.Navigation.Fragment.dll.so => 309
	i64 u0x6e79c6bd8627412a, ; 542: Xamarin.AndroidX.SavedState.SavedState.Ktx => 317
	i64 u0x6e838d9a2a6f6c9e, ; 543: lib_System.ValueTuple.dll.so => 150
	i64 u0x6e9965ce1095e60a, ; 544: lib_System.Core.dll.so => 21
	i64 u0x6fd2265da78b93a4, ; 545: lib_Microsoft.Maui.dll.so => 219
	i64 u0x6fdfc7de82c33008, ; 546: cs/Microsoft.Maui.Controls.resources => 364
	i64 u0x6ffc4967cc47ba57, ; 547: System.IO.FileSystem.Watcher.dll => 49
	i64 u0x701cd46a1c25a5fe, ; 548: System.IO.FileSystem.dll => 50
	i64 u0x706442eb8d0ca9f8, ; 549: Plainer.Maui.dll => 232
	i64 u0x70e99f48c05cb921, ; 550: tr/Microsoft.Maui.Controls.resources.dll => 390
	i64 u0x70fd3deda22442d2, ; 551: lib-nb-Microsoft.Maui.Controls.resources.dll.so => 380
	i64 u0x71485e7ffdb4b958, ; 552: System.Reflection.Extensions => 93
	i64 u0x7162a2fce67a945f, ; 553: lib_Xamarin.Android.Glide.Annotations.dll.so => 252
	i64 u0x71a495ea3761dde8, ; 554: lib-it-Microsoft.Maui.Controls.resources.dll.so => 376
	i64 u0x71ad672adbe48f35, ; 555: System.ComponentModel.Primitives.dll => 16
	i64 u0x71bc142d620e986a, ; 556: lib_System.Security.Cryptography.Pkcs.dll.so => 246
	i64 u0x725f5a9e82a45c81, ; 557: System.Security.Cryptography.Encoding => 122
	i64 u0x72b1fb4109e08d7b, ; 558: lib-hr-Microsoft.Maui.Controls.resources.dll.so => 373
	i64 u0x72e0300099accce1, ; 559: System.Xml.XPath.XDocument => 158
	i64 u0x730bfb248998f67a, ; 560: System.IO.Compression.ZipFile => 44
	i64 u0x732b2d67b9e5c47b, ; 561: Xamarin.Google.ErrorProne.Annotations.dll => 335
	i64 u0x734b76fdc0dc05bb, ; 562: lib_GoogleGson.dll.so => 182
	i64 u0x73a22de3db7e3506, ; 563: lib-ko-Microsoft.SqlServer.Types.resources.dll.so => 401
	i64 u0x73a6be34e822f9d1, ; 564: lib_System.Runtime.Serialization.dll.so => 115
	i64 u0x73e4ce94e2eb6ffc, ; 565: lib_System.Memory.dll.so => 62
	i64 u0x73f2645914262879, ; 566: lib_Microsoft.EntityFrameworkCore.Sqlite.dll.so => 192
	i64 u0x743a1eccf080489a, ; 567: WindowsBase.dll => 164
	i64 u0x74770d0c84d62bee, ; 568: EFCore.BulkExtensions.SqlServer => 181
	i64 u0x74d88540363e57e3, ; 569: MedallionTopologicalSort => 184
	i64 u0x755a91767330b3d4, ; 570: lib_Microsoft.Extensions.Configuration.dll.so => 198
	i64 u0x75c326eb821b85c4, ; 571: lib_System.ComponentModel.DataAnnotations.dll.so => 14
	i64 u0x76012e7334db86e5, ; 572: lib_Xamarin.AndroidX.SavedState.dll.so => 316
	i64 u0x76ca07b878f44da0, ; 573: System.Runtime.Numerics.dll => 110
	i64 u0x770e0cc2309fe21d, ; 574: lib-pt-BR-Microsoft.SqlServer.Types.resources.dll.so => 402
	i64 u0x7736c8a96e51a061, ; 575: lib_Xamarin.AndroidX.Annotation.Jvm.dll.so => 259
	i64 u0x778a805e625329ef, ; 576: System.Linq.Parallel => 59
	i64 u0x779290cc2b801eb7, ; 577: Xamarin.KotlinX.AtomicFU.Jvm => 340
	i64 u0x77bf40592cd67602, ; 578: Xamarin.Google.AutoValue.Annotations.dll => 332
	i64 u0x77f8a4acc2fdc449, ; 579: System.Security.Cryptography.Cng.dll => 120
	i64 u0x780bc73597a503a9, ; 580: lib-ms-Microsoft.Maui.Controls.resources.dll.so => 379
	i64 u0x782c5d8eb99ff201, ; 581: lib_Microsoft.VisualBasic.Core.dll.so => 2
	i64 u0x783606d1e53e7a1a, ; 582: th/Microsoft.Maui.Controls.resources.dll => 389
	i64 u0x78a45e51311409b6, ; 583: Xamarin.AndroidX.Fragment.dll => 288
	i64 u0x78ed4ab8f9d800a1, ; 584: Xamarin.AndroidX.Lifecycle.ViewModel => 302
	i64 u0x79eb916f2d11e1f0, ; 585: zh-Hans/Microsoft.Data.SqlClient.resources.dll => 360
	i64 u0x7a39601d6f0bb831, ; 586: lib_Xamarin.KotlinX.AtomicFU.dll.so => 339
	i64 u0x7a7e7eddf79c5d26, ; 587: lib_Xamarin.AndroidX.Lifecycle.ViewModel.dll.so => 302
	i64 u0x7a9a57d43b0845fa, ; 588: System.AppContext => 6
	i64 u0x7ad0f4f1e5d08183, ; 589: Xamarin.AndroidX.Collection.dll => 270
	i64 u0x7adb8da2ac89b647, ; 590: fi/Microsoft.Maui.Controls.resources.dll => 369
	i64 u0x7b13d9eaa944ade8, ; 591: Xamarin.AndroidX.DynamicAnimation.dll => 284
	i64 u0x7b150145c0a9058c, ; 592: Microsoft.Data.Sqlite => 188
	i64 u0x7b4927e421291c41, ; 593: Microsoft.IdentityModel.JsonWebTokens.dll => 211
	i64 u0x7bef86a4335c4870, ; 594: System.ComponentModel.TypeConverter => 17
	i64 u0x7c0820144cd34d6a, ; 595: sk/Microsoft.Maui.Controls.resources.dll => 387
	i64 u0x7c2a0bd1e0f988fc, ; 596: lib-de-Microsoft.Maui.Controls.resources.dll.so => 366
	i64 u0x7c41d387501568ba, ; 597: System.Net.WebClient.dll => 76
	i64 u0x7c482cd79bd24b13, ; 598: lib_Xamarin.AndroidX.ConstraintLayout.dll.so => 274
	i64 u0x7c8cb8cf04bee12b, ; 599: lib_Xamarin.Google.AutoValue.Annotations.dll.so => 332
	i64 u0x7cc637f941f716d0, ; 600: CommunityToolkit.Maui.Core => 175
	i64 u0x7cd2ec8eaf5241cd, ; 601: System.Security.dll => 130
	i64 u0x7cf9ae50dd350622, ; 602: Xamarin.Jetbrains.Annotations.dll => 337
	i64 u0x7d649b75d580bb42, ; 603: ms/Microsoft.Maui.Controls.resources.dll => 379
	i64 u0x7d8ee2bdc8e3aad1, ; 604: System.Numerics.Vectors => 82
	i64 u0x7df5df8db8eaa6ac, ; 605: Microsoft.Extensions.Logging.Debug => 205
	i64 u0x7dfc3d6d9d8d7b70, ; 606: System.Collections => 12
	i64 u0x7e034293328f139a, ; 607: EFCore.BulkExtensions.PostgreSql => 179
	i64 u0x7e2e564fa2f76c65, ; 608: lib_System.Diagnostics.Tracing.dll.so => 34
	i64 u0x7e302e110e1e1346, ; 609: lib_System.Security.Claims.dll.so => 118
	i64 u0x7e4465b3f78ad8d0, ; 610: Xamarin.KotlinX.Serialization.Core.dll => 344
	i64 u0x7e571cad5915e6c3, ; 611: lib_Xamarin.AndroidX.Lifecycle.Process.dll.so => 297
	i64 u0x7e6b1ca712437d7d, ; 612: Xamarin.AndroidX.Emoji2.ViewsHelper => 286
	i64 u0x7e946809d6008ef2, ; 613: lib_System.ObjectModel.dll.so => 84
	i64 u0x7ea0272c1b4a9635, ; 614: lib_Xamarin.Android.Glide.dll.so => 251
	i64 u0x7ecc13347c8fd849, ; 615: lib_System.ComponentModel.dll.so => 18
	i64 u0x7f00ddd9b9ca5a13, ; 616: Xamarin.AndroidX.ViewPager.dll => 327
	i64 u0x7f9351cd44b1273f, ; 617: Microsoft.Extensions.Configuration.Abstractions => 199
	i64 u0x7fae0ef4dc4770fe, ; 618: Microsoft.Identity.Client => 208
	i64 u0x7fbd557c99b3ce6f, ; 619: lib_Xamarin.AndroidX.Lifecycle.LiveData.Core.dll.so => 295
	i64 u0x8076a9a44a2ca331, ; 620: System.Net.Quic => 71
	i64 u0x80b7e726b0280681, ; 621: Microsoft.VisualStudio.DesignTools.MobileTapContracts => 407
	i64 u0x80da183a87731838, ; 622: System.Reflection.Metadata => 94
	i64 u0x80fa55b6d1b0be99, ; 623: SQLitePCLRaw.provider.e_sqlite3 => 236
	i64 u0x812c069d5cdecc17, ; 624: System.dll => 163
	i64 u0x81381be520a60adb, ; 625: Xamarin.AndroidX.Interpolator.dll => 290
	i64 u0x81657cec2b31e8aa, ; 626: System.Net => 81
	i64 u0x81ab745f6c0f5ce6, ; 627: zh-Hant/Microsoft.Maui.Controls.resources => 395
	i64 u0x8277f2be6b5ce05f, ; 628: Xamarin.AndroidX.AppCompat => 260
	i64 u0x828f06563b30bc50, ; 629: lib_Xamarin.AndroidX.CardView.dll.so => 269
	i64 u0x82920a8d9194a019, ; 630: Xamarin.KotlinX.AtomicFU.Jvm.dll => 340
	i64 u0x82b399cb01b531c4, ; 631: lib_System.Web.dll.so => 152
	i64 u0x82df8f5532a10c59, ; 632: lib_System.Drawing.dll.so => 36
	i64 u0x82f0b6e911d13535, ; 633: lib_System.Transactions.dll.so => 149
	i64 u0x82f6403342e12049, ; 634: uk/Microsoft.Maui.Controls.resources => 391
	i64 u0x83a7afd2c49adc86, ; 635: lib_Microsoft.IdentityModel.Abstractions.dll.so => 210
	i64 u0x83c14ba66c8e2b8c, ; 636: zh-Hans/Microsoft.Maui.Controls.resources => 394
	i64 u0x844ac8f64fd78edc, ; 637: Xamarin.AndroidX.Camera.View.dll => 268
	i64 u0x846ce984efea52c7, ; 638: System.Threading.Tasks.Parallel.dll => 142
	i64 u0x84ae73148a4557d2, ; 639: lib_System.IO.Pipes.dll.so => 55
	i64 u0x84b01102c12a9232, ; 640: System.Runtime.Serialization.Json.dll => 112
	i64 u0x84bc82b42469a609, ; 641: Oracle.EntityFrameworkCore => 230
	i64 u0x84cd5cdec0f54bcc, ; 642: lib_Microsoft.EntityFrameworkCore.Relational.dll.so => 191
	i64 u0x850c5ba0b57ce8e7, ; 643: lib_Xamarin.AndroidX.Collection.dll.so => 270
	i64 u0x851d02edd334b044, ; 644: Xamarin.AndroidX.VectorDrawable => 324
	i64 u0x8528b82bdbc15371, ; 645: ko/Microsoft.Data.SqlClient.resources => 355
	i64 u0x8533cf0079a66e49, ; 646: lib_Oracle.EntityFrameworkCore.dll.so => 230
	i64 u0x85c919db62150978, ; 647: Xamarin.AndroidX.Transition.dll => 323
	i64 u0x8662aaeb94fef37f, ; 648: lib_System.Dynamic.Runtime.dll.so => 37
	i64 u0x86a909228dc7657b, ; 649: lib-zh-Hant-Microsoft.Maui.Controls.resources.dll.so => 395
	i64 u0x86b3e00c36b84509, ; 650: Microsoft.Extensions.Configuration.dll => 198
	i64 u0x86b62cb077ec4fd7, ; 651: System.Runtime.Serialization.Xml => 114
	i64 u0x8706ffb12bf3f53d, ; 652: Xamarin.AndroidX.Annotation.Experimental => 258
	i64 u0x872a5b14c18d328c, ; 653: System.ComponentModel.DataAnnotations => 14
	i64 u0x872fb9615bc2dff0, ; 654: Xamarin.Android.Glide.Annotations.dll => 252
	i64 u0x87c4b8a492b176ad, ; 655: Microsoft.EntityFrameworkCore.Abstractions => 190
	i64 u0x87c69b87d9283884, ; 656: lib_System.Threading.Thread.dll.so => 144
	i64 u0x87f6569b25707834, ; 657: System.IO.Compression.Brotli.dll => 42
	i64 u0x8842b3a5d2d3fb36, ; 658: Microsoft.Maui.Essentials => 220
	i64 u0x88926583efe7ee86, ; 659: Xamarin.AndroidX.Activity.Ktx.dll => 256
	i64 u0x88ba6bc4f7762b03, ; 660: lib_System.Reflection.dll.so => 97
	i64 u0x88bda98e0cffb7a9, ; 661: lib_Xamarin.KotlinX.Coroutines.Core.Jvm.dll.so => 343
	i64 u0x8930322c7bd8f768, ; 662: netstandard => 166
	i64 u0x894dbdd1ac38f4e1, ; 663: Plainer.Maui => 232
	i64 u0x897a606c9e39c75f, ; 664: lib_System.ComponentModel.Primitives.dll.so => 16
	i64 u0x89911a22005b92b7, ; 665: System.IO.FileSystem.DriveInfo.dll => 47
	i64 u0x89c5188089ec2cd5, ; 666: lib_System.Runtime.InteropServices.RuntimeInformation.dll.so => 106
	i64 u0x8a19e3dc71b34b2c, ; 667: System.Reflection.TypeExtensions.dll => 96
	i64 u0x8a399a706fcbce4b, ; 668: Microsoft.Extensions.Caching.Abstractions => 196
	i64 u0x8ad229ea26432ee2, ; 669: Xamarin.AndroidX.Loader => 306
	i64 u0x8b4ff5d0fdd5faa1, ; 670: lib_System.Diagnostics.DiagnosticSource.dll.so => 27
	i64 u0x8b541d476eb3774c, ; 671: System.Security.Principal.Windows => 127
	i64 u0x8b8d01333a96d0b5, ; 672: System.Diagnostics.Process.dll => 29
	i64 u0x8b9ceca7acae3451, ; 673: lib-he-Microsoft.Maui.Controls.resources.dll.so => 371
	i64 u0x8c156fe7f184f137, ; 674: tr/Microsoft.Data.SqlClient.resources => 359
	i64 u0x8c53ae18581b14f0, ; 675: Azure.Core => 172
	i64 u0x8cb6d28731d97279, ; 676: System.DirectoryServices.Protocols => 242
	i64 u0x8cb8f612b633affb, ; 677: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 317
	i64 u0x8cdfdb4ce85fb925, ; 678: lib_System.Security.Principal.Windows.dll.so => 127
	i64 u0x8cdfe7b8f4caa426, ; 679: System.IO.Compression.FileSystem => 43
	i64 u0x8cf51f1eb9e90658, ; 680: lib_Microsoft.EntityFrameworkCore.SqlServer.dll.so => 193
	i64 u0x8d0f420977c2c1c7, ; 681: Xamarin.AndroidX.CursorAdapter.dll => 279
	i64 u0x8d2551476f2e2ef7, ; 682: lib_UraniumUI.Material.dll.so => 250
	i64 u0x8d52a25632e81824, ; 683: Microsoft.EntityFrameworkCore.Sqlite.dll => 192
	i64 u0x8d52f7ea2796c531, ; 684: Xamarin.AndroidX.Emoji2.dll => 285
	i64 u0x8d7b8ab4b3310ead, ; 685: System.Threading => 147
	i64 u0x8da188285aadfe8e, ; 686: System.Collections.Concurrent => 8
	i64 u0x8e7b0d6c6f6404e3, ; 687: fr/Microsoft.SqlServer.Types.resources => 398
	i64 u0x8e937db395a74375, ; 688: lib_Microsoft.Identity.Client.dll.so => 208
	i64 u0x8e9b88b113d62c7d, ; 689: zh-Hant/Microsoft.SqlServer.Types.resources => 405
	i64 u0x8ebba9258a550f92, ; 690: lib_Plainer.Maui.dll.so => 232
	i64 u0x8ec6e06a61c1baeb, ; 691: lib_Newtonsoft.Json.dll.so => 227
	i64 u0x8ed3cdd722b4d782, ; 692: System.Diagnostics.EventLog => 240
	i64 u0x8ed807bfe9858dfc, ; 693: Xamarin.AndroidX.Navigation.Common => 308
	i64 u0x8ee08b8194a30f48, ; 694: lib-hi-Microsoft.Maui.Controls.resources.dll.so => 372
	i64 u0x8ef7601039857a44, ; 695: lib-ro-Microsoft.Maui.Controls.resources.dll.so => 385
	i64 u0x8ef9414937d93a0a, ; 696: SQLitePCLRaw.core.dll => 234
	i64 u0x8f32c6f611f6ffab, ; 697: pt/Microsoft.Maui.Controls.resources.dll => 384
	i64 u0x8f44b45eb046bbd1, ; 698: System.ServiceModel.Web.dll => 131
	i64 u0x8f8829d21c8985a4, ; 699: lib-pt-BR-Microsoft.Maui.Controls.resources.dll.so => 383
	i64 u0x8fbf5b0114c6dcef, ; 700: System.Globalization.dll => 41
	i64 u0x8fcc8c2a81f3d9e7, ; 701: Xamarin.KotlinX.Serialization.Core => 344
	i64 u0x8fd27d934d7b3a55, ; 702: SQLitePCLRaw.core => 234
	i64 u0x90263f8448b8f572, ; 703: lib_System.Diagnostics.TraceSource.dll.so => 33
	i64 u0x9027f725f74f5c08, ; 704: lib_NetTopologySuite.IO.SpatiaLite.dll.so => 225
	i64 u0x902d31dbd7d7d78e, ; 705: InputKit.Maui => 183
	i64 u0x903101b46fb73a04, ; 706: _Microsoft.Android.Resource.Designer => 409
	i64 u0x90393bd4865292f3, ; 707: lib_System.IO.Compression.dll.so => 45
	i64 u0x905e2b8e7ae91ae6, ; 708: System.Threading.Tasks.Extensions.dll => 141
	i64 u0x90634f86c5ebe2b5, ; 709: Xamarin.AndroidX.Lifecycle.ViewModel.Android => 303
	i64 u0x907b636704ad79ef, ; 710: lib_Microsoft.Maui.Controls.Xaml.dll.so => 218
	i64 u0x90e9efbfd68593e0, ; 711: lib_Xamarin.AndroidX.Lifecycle.LiveData.dll.so => 294
	i64 u0x91418dc638b29e68, ; 712: lib_Xamarin.AndroidX.CustomView.dll.so => 280
	i64 u0x9157bd523cd7ed36, ; 713: lib_System.Text.Json.dll.so => 248
	i64 u0x91a74f07b30d37e2, ; 714: System.Linq.dll => 61
	i64 u0x91cb86ea3b17111d, ; 715: System.ServiceModel.Web => 131
	i64 u0x91fa41a87223399f, ; 716: ca/Microsoft.Maui.Controls.resources.dll => 363
	i64 u0x92054e486c0c7ea7, ; 717: System.IO.FileSystem.DriveInfo => 47
	i64 u0x928614058c40c4cd, ; 718: lib_System.Xml.XPath.XDocument.dll.so => 158
	i64 u0x92b138fffca2b01e, ; 719: lib_Xamarin.AndroidX.Arch.Core.Runtime.dll.so => 263
	i64 u0x92dfc2bfc6c6a888, ; 720: Xamarin.AndroidX.Lifecycle.LiveData => 294
	i64 u0x933da2c779423d68, ; 721: Xamarin.Android.Glide.Annotations => 252
	i64 u0x93489853b6098685, ; 722: es/Microsoft.Data.SqlClient.resources.dll => 351
	i64 u0x9388aad9b7ae40ce, ; 723: lib_Xamarin.AndroidX.Lifecycle.Common.dll.so => 292
	i64 u0x93cfa73ab28d6e35, ; 724: ms/Microsoft.Maui.Controls.resources => 379
	i64 u0x941c00d21e5c0679, ; 725: lib_Xamarin.AndroidX.Transition.dll.so => 323
	i64 u0x944077d8ca3c6580, ; 726: System.IO.Compression.dll => 45
	i64 u0x948cffedc8ed7960, ; 727: System.Xml => 162
	i64 u0x948d746a7702861f, ; 728: Microsoft.IdentityModel.Logging.dll => 212
	i64 u0x94c8990839c4bdb1, ; 729: lib_Xamarin.AndroidX.Interpolator.dll.so => 290
	i64 u0x9502fd818eed2359, ; 730: lib_Microsoft.IdentityModel.Protocols.OpenIdConnect.dll.so => 214
	i64 u0x9564283c37ed59a9, ; 731: lib_Microsoft.IdentityModel.Logging.dll.so => 212
	i64 u0x95c6b36f5f5d7039, ; 732: Xamarin.AndroidX.Camera.Camera2 => 265
	i64 u0x95d757769563d0d3, ; 733: Xamarin.AndroidX.Camera.Lifecycle.dll => 267
	i64 u0x965d480cfb8de46d, ; 734: pl/Microsoft.Data.SqlClient.resources.dll => 356
	i64 u0x967fc325e09bfa8c, ; 735: es/Microsoft.Maui.Controls.resources => 368
	i64 u0x9686161486d34b81, ; 736: lib_Xamarin.AndroidX.ExifInterface.dll.so => 287
	i64 u0x96e49b31fe33d427, ; 737: Microsoft.Identity.Client.Extensions.Msal => 209
	i64 u0x9732d8dbddea3d9a, ; 738: id/Microsoft.Maui.Controls.resources => 375
	i64 u0x978be80e5210d31b, ; 739: Microsoft.Maui.Graphics.dll => 221
	i64 u0x97b8c771ea3e4220, ; 740: System.ComponentModel.dll => 18
	i64 u0x97e144c9d3c6976e, ; 741: System.Collections.Concurrent.dll => 8
	i64 u0x984184e3c70d4419, ; 742: GoogleGson => 182
	i64 u0x9843944103683dd3, ; 743: Xamarin.AndroidX.Core.Core.Ktx => 278
	i64 u0x98d720cc4597562c, ; 744: System.Security.Cryptography.OpenSsl => 123
	i64 u0x99052c1297204af4, ; 745: lib_Xamarin.AndroidX.Camera.Core.dll.so => 266
	i64 u0x991d510397f92d9d, ; 746: System.Linq.Expressions => 58
	i64 u0x993cc632e821c001, ; 747: Microsoft.Maui.Controls.Compatibility => 216
	i64 u0x996ceeb8a3da3d67, ; 748: System.Threading.Overlapped.dll => 139
	i64 u0x999cb19e1a04ffd3, ; 749: CommunityToolkit.Mvvm.dll => 176
	i64 u0x99a00ca5270c6878, ; 750: Xamarin.AndroidX.Navigation.Runtime => 310
	i64 u0x99a8098eef99f8b4, ; 751: Oracle.ManagedDataAccess.dll => 231
	i64 u0x99cdc6d1f2d3a72f, ; 752: ko/Microsoft.Maui.Controls.resources.dll => 378
	i64 u0x9a01b1da98b6ee10, ; 753: Xamarin.AndroidX.Lifecycle.Runtime.dll => 298
	i64 u0x9a0cc42c6f36dfc9, ; 754: lib_Microsoft.IdentityModel.Protocols.dll.so => 213
	i64 u0x9a5ccc274fd6e6ee, ; 755: Jsr305Binding.dll => 333
	i64 u0x9a8abd23ef81c977, ; 756: NetTopologySuite.dll => 224
	i64 u0x9acfd25e735d5594, ; 757: lib_Npgsql.dll.so => 228
	i64 u0x9ae6940b11c02876, ; 758: lib_Xamarin.AndroidX.Window.dll.so => 329
	i64 u0x9af128bb65641ae6, ; 759: NetTopologySuite.IO.SpatiaLite.dll => 225
	i64 u0x9b211a749105beac, ; 760: System.Transactions.Local => 148
	i64 u0x9b8734714671022d, ; 761: System.Threading.Tasks.Dataflow.dll => 140
	i64 u0x9bc6aea27fbf034f, ; 762: lib_Xamarin.KotlinX.Coroutines.Core.dll.so => 342
	i64 u0x9bd8cc74558ad4c7, ; 763: Xamarin.KotlinX.AtomicFU => 339
	i64 u0x9c08d13c4e6dfa63, ; 764: Microsoft.EntityFrameworkCore.SqlServer.Abstractions => 194
	i64 u0x9c244ac7cda32d26, ; 765: System.Security.Cryptography.X509Certificates.dll => 125
	i64 u0x9c465f280cf43733, ; 766: lib_Xamarin.KotlinX.Coroutines.Android.dll.so => 341
	i64 u0x9c8f6872beab6408, ; 767: System.Xml.XPath.XDocument.dll => 158
	i64 u0x9cded46e202841cc, ; 768: NetTopologySuite.IO.SqlServerBytes.dll => 226
	i64 u0x9ce01cf91101ae23, ; 769: System.Xml.XmlDocument => 160
	i64 u0x9d128180c81d7ce6, ; 770: Xamarin.AndroidX.CustomView.PoolingContainer => 281
	i64 u0x9d5dbcf5a48583fe, ; 771: lib_Xamarin.AndroidX.Activity.dll.so => 255
	i64 u0x9d74dee1a7725f34, ; 772: Microsoft.Extensions.Configuration.Abstractions.dll => 199
	i64 u0x9da48bf5f6df6c80, ; 773: UraniumUI.dll => 249
	i64 u0x9e4534b6adaf6e84, ; 774: nl/Microsoft.Maui.Controls.resources => 381
	i64 u0x9e4b95dec42769f7, ; 775: System.Diagnostics.Debug.dll => 26
	i64 u0x9eaf1efdf6f7267e, ; 776: Xamarin.AndroidX.Navigation.Common.dll => 308
	i64 u0x9ef542cf1f78c506, ; 777: Xamarin.AndroidX.Lifecycle.LiveData.Core => 295
	i64 u0x9fba0d4c57451526, ; 778: ko/Microsoft.SqlServer.Types.resources => 401
	i64 u0x9ff334e3cf272fd6, ; 779: lib_Xamarin.AndroidX.Camera.Lifecycle.dll.so => 267
	i64 u0x9ffbb6b1434ad2df, ; 780: Microsoft.Identity.Client.dll => 208
	i64 u0xa00832eb975f56a8, ; 781: lib_System.Net.dll.so => 81
	i64 u0xa0ad78236b7b267f, ; 782: Xamarin.AndroidX.Window => 329
	i64 u0xa0d8259f4cc284ec, ; 783: lib_System.Security.Cryptography.dll.so => 126
	i64 u0xa0e17ca50c77a225, ; 784: lib_Xamarin.Google.Crypto.Tink.Android.dll.so => 334
	i64 u0xa0ff9b3e34d92f11, ; 785: lib_System.Resources.Writer.dll.so => 100
	i64 u0xa12fbfb4da97d9f3, ; 786: System.Threading.Timer.dll => 146
	i64 u0xa13763df740e071e, ; 787: store => 0
	i64 u0xa1440773ee9d341e, ; 788: Xamarin.Google.Android.Material => 331
	i64 u0xa1b9d7c27f47219f, ; 789: Xamarin.AndroidX.Navigation.UI.dll => 311
	i64 u0xa1cfec8d4a8d7c32, ; 790: Npgsql.EntityFrameworkCore.PostgreSQL.dll => 229
	i64 u0xa2572680829d2c7c, ; 791: System.IO.Pipelines.dll => 53
	i64 u0xa26597e57ee9c7f6, ; 792: System.Xml.XmlDocument.dll => 160
	i64 u0xa308401900e5bed3, ; 793: lib_mscorlib.dll.so => 165
	i64 u0xa375c81cb42e7ef8, ; 794: lib_Microsoft.EntityFrameworkCore.SqlServer.Abstractions.dll.so => 194
	i64 u0xa395572e7da6c99d, ; 795: lib_System.Security.dll.so => 130
	i64 u0xa3c64c49e90a9987, ; 796: System.Security.Cryptography.Pkcs => 246
	i64 u0xa3e683f24b43af6f, ; 797: System.Dynamic.Runtime.dll => 37
	i64 u0xa4145becdee3dc4f, ; 798: Xamarin.AndroidX.VectorDrawable.Animated => 325
	i64 u0xa46aa1eaa214539b, ; 799: ko/Microsoft.Maui.Controls.resources => 378
	i64 u0xa4d20d2ff0563d26, ; 800: lib_CommunityToolkit.Mvvm.dll.so => 176
	i64 u0xa4edc8f2ceae241a, ; 801: System.Data.Common.dll => 22
	i64 u0xa526fadd66308051, ; 802: Microsoft.EntityFrameworkCore.SqlServer.dll => 193
	i64 u0xa5494f40f128ce6a, ; 803: System.Runtime.Serialization.Formatters.dll => 111
	i64 u0xa54b74df83dce92b, ; 804: System.Reflection.DispatchProxy => 89
	i64 u0xa579ed010d7e5215, ; 805: Xamarin.AndroidX.DocumentFile => 282
	i64 u0xa581c333c3c7cdb4, ; 806: ja/Microsoft.SqlServer.Types.resources => 400
	i64 u0xa5b7152421ed6d98, ; 807: lib_System.IO.FileSystem.Watcher.dll.so => 49
	i64 u0xa5b931bd164e087b, ; 808: Oracle.EntityFrameworkCore.dll => 230
	i64 u0xa5c3844f17b822db, ; 809: lib_System.Linq.Parallel.dll.so => 59
	i64 u0xa5ce5c755bde8cb8, ; 810: lib_System.Security.Cryptography.Csp.dll.so => 121
	i64 u0xa5e599d1e0524750, ; 811: System.Numerics.Vectors.dll => 82
	i64 u0xa5f1ba49b85dd355, ; 812: System.Security.Cryptography.dll => 126
	i64 u0xa61975a5a37873ea, ; 813: lib_System.Xml.XmlSerializer.dll.so => 161
	i64 u0xa6593e21584384d2, ; 814: lib_Jsr305Binding.dll.so => 333
	i64 u0xa66cbee0130865f7, ; 815: lib_WindowsBase.dll.so => 164
	i64 u0xa67dbee13e1df9ca, ; 816: Xamarin.AndroidX.SavedState.dll => 316
	i64 u0xa684b098dd27b296, ; 817: lib_Xamarin.AndroidX.Security.SecurityCrypto.dll.so => 318
	i64 u0xa68a420042bb9b1f, ; 818: Xamarin.AndroidX.DrawerLayout.dll => 283
	i64 u0xa6d26156d1cacc7c, ; 819: Xamarin.Android.Glide.dll => 251
	i64 u0xa71fe7d6f6f93efd, ; 820: Microsoft.Data.SqlClient => 187
	i64 u0xa75386b5cb9595aa, ; 821: Xamarin.AndroidX.Lifecycle.Runtime.Android => 299
	i64 u0xa763fbb98df8d9fb, ; 822: lib_Microsoft.Win32.Primitives.dll.so => 4
	i64 u0xa78ce3745383236a, ; 823: Xamarin.AndroidX.Lifecycle.Common.Jvm => 293
	i64 u0xa7c31b56b4dc7b33, ; 824: hu/Microsoft.Maui.Controls.resources => 374
	i64 u0xa7eab29ed44b4e7a, ; 825: Mono.Android.Export => 168
	i64 u0xa8195217cbf017b7, ; 826: Microsoft.VisualBasic.Core => 2
	i64 u0xa859a95830f367ff, ; 827: lib_Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll.so => 304
	i64 u0xa87ff9cd1c5ac806, ; 828: lib_MedallionTopologicalSort.dll.so => 184
	i64 u0xa8b52f21e0dbe690, ; 829: System.Runtime.Serialization.dll => 115
	i64 u0xa8e6320dd07580ef, ; 830: lib_Microsoft.IdentityModel.JsonWebTokens.dll.so => 211
	i64 u0xa8ee4ed7de2efaee, ; 831: Xamarin.AndroidX.Annotation.dll => 257
	i64 u0xa95590e7c57438a4, ; 832: System.Configuration => 19
	i64 u0xa964304b5631e28a, ; 833: CommunityToolkit.Maui.Core.dll => 175
	i64 u0xaa2219c8e3449ff5, ; 834: Microsoft.Extensions.Logging.Abstractions => 204
	i64 u0xaa443ac34067eeef, ; 835: System.Private.Xml.dll => 88
	i64 u0xaa52de307ef5d1dd, ; 836: System.Net.Http => 64
	i64 u0xaa9a7b0214a5cc5c, ; 837: System.Diagnostics.StackTrace.dll => 30
	i64 u0xaaaf86367285a918, ; 838: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 201
	i64 u0xaaf84bb3f052a265, ; 839: el/Microsoft.Maui.Controls.resources => 367
	i64 u0xab9af77b5b67a0b8, ; 840: Xamarin.AndroidX.ConstraintLayout.Core => 275
	i64 u0xab9c1b2687d86b0b, ; 841: lib_System.Linq.Expressions.dll.so => 58
	i64 u0xabc4d26016505655, ; 842: lib_Microsoft.SqlServer.Types.dll.so => 223
	i64 u0xac2af3fa195a15ce, ; 843: System.Runtime.Numerics => 110
	i64 u0xac5376a2a538dc10, ; 844: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 295
	i64 u0xac5acae88f60357e, ; 845: System.Diagnostics.Tools.dll => 32
	i64 u0xac79c7e46047ad98, ; 846: System.Security.Principal.Windows.dll => 127
	i64 u0xac98d31068e24591, ; 847: System.Xml.XDocument => 157
	i64 u0xacd46e002c3ccb97, ; 848: ro/Microsoft.Maui.Controls.resources => 385
	i64 u0xacdd9e4180d56dda, ; 849: Xamarin.AndroidX.Concurrent.Futures => 273
	i64 u0xacf42eea7ef9cd12, ; 850: System.Threading.Channels => 138
	i64 u0xad7e82ed3b0f16d0, ; 851: lib_Xamarin.AndroidX.DocumentFile.dll.so => 282
	i64 u0xad89c07347f1bad6, ; 852: nl/Microsoft.Maui.Controls.resources.dll => 381
	i64 u0xadbb53caf78a79d2, ; 853: System.Web.HttpUtility => 151
	i64 u0xadc90ab061a9e6e4, ; 854: System.ComponentModel.TypeConverter.dll => 17
	i64 u0xadca1b9030b9317e, ; 855: Xamarin.AndroidX.Collection.Ktx => 272
	i64 u0xadd8eda2edf396ad, ; 856: Xamarin.Android.Glide.GifDecoder => 254
	i64 u0xadf4cf30debbeb9a, ; 857: System.Net.ServicePoint.dll => 74
	i64 u0xadf511667bef3595, ; 858: System.Net.Security => 73
	i64 u0xae0aaa94fdcfce0f, ; 859: System.ComponentModel.EventBasedAsync.dll => 15
	i64 u0xae282bcd03739de7, ; 860: Java.Interop => 167
	i64 u0xae53579c90db1107, ; 861: System.ObjectModel.dll => 84
	i64 u0xaec7c0c7e2ed4575, ; 862: lib_Xamarin.KotlinX.AtomicFU.Jvm.dll.so => 340
	i64 u0xaf12fb8133ac3fbb, ; 863: Microsoft.EntityFrameworkCore.Sqlite => 192
	i64 u0xaf732d0b2193b8f5, ; 864: System.Security.Cryptography.OpenSsl.dll => 123
	i64 u0xafdb94dbccd9d11c, ; 865: Xamarin.AndroidX.Lifecycle.LiveData.dll => 294
	i64 u0xafe29f45095518e7, ; 866: lib_Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll.so => 305
	i64 u0xb03ae931fb25607e, ; 867: Xamarin.AndroidX.ConstraintLayout => 274
	i64 u0xb05cc42cd94c6d9d, ; 868: lib-sv-Microsoft.Maui.Controls.resources.dll.so => 388
	i64 u0xb0ac21bec8f428c5, ; 869: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.Android.dll => 301
	i64 u0xb0bb43dc52ea59f9, ; 870: System.Diagnostics.Tracing.dll => 34
	i64 u0xb1dd05401aa8ee63, ; 871: System.Security.AccessControl => 117
	i64 u0xb220631954820169, ; 872: System.Text.RegularExpressions => 137
	i64 u0xb2376e1dbf8b4ed7, ; 873: System.Security.Cryptography.Csp => 121
	i64 u0xb2a1959fe95c5402, ; 874: lib_System.Runtime.InteropServices.JavaScript.dll.so => 105
	i64 u0xb2a3f67f3bf29fce, ; 875: da/Microsoft.Maui.Controls.resources => 365
	i64 u0xb2d3ad98fce223fd, ; 876: UraniumUI.Material => 250
	i64 u0xb3011a0a57f7ffb2, ; 877: Microsoft.VisualStudio.DesignTools.MobileTapContracts.dll => 407
	i64 u0xb3874072ee0ecf8c, ; 878: Xamarin.AndroidX.VectorDrawable.Animated.dll => 325
	i64 u0xb398860d6ed7ba2f, ; 879: System.Security.Cryptography.ProtectedData => 247
	i64 u0xb3f0a0fcda8d3ebc, ; 880: Xamarin.AndroidX.CardView => 269
	i64 u0xb46be1aa6d4fff93, ; 881: hi/Microsoft.Maui.Controls.resources => 372
	i64 u0xb477491be13109d8, ; 882: ar/Microsoft.Maui.Controls.resources => 362
	i64 u0xb4bd7015ecee9d86, ; 883: System.IO.Pipelines => 53
	i64 u0xb4c53d9749c5f226, ; 884: lib_System.IO.FileSystem.AccessControl.dll.so => 46
	i64 u0xb4ff710863453fda, ; 885: System.Diagnostics.FileVersionInfo.dll => 28
	i64 u0xb5c38bf497a4cfe2, ; 886: lib_System.Threading.Tasks.dll.so => 143
	i64 u0xb5c7fcdafbc67ee4, ; 887: Microsoft.Extensions.Logging.Abstractions.dll => 204
	i64 u0xb5ea31d5244c6626, ; 888: System.Threading.ThreadPool.dll => 145
	i64 u0xb6ca291529a2056e, ; 889: MedallionTopologicalSort.dll => 184
	i64 u0xb7212c4683a94afe, ; 890: System.Drawing.Primitives => 35
	i64 u0xb7b7753d1f319409, ; 891: sv/Microsoft.Maui.Controls.resources => 388
	i64 u0xb81a2c6e0aee50fe, ; 892: lib_System.Private.CoreLib.dll.so => 171
	i64 u0xb8b0a9b3dfbc5cb7, ; 893: Xamarin.AndroidX.Window.Extensions.Core.Core => 330
	i64 u0xb8c60af47c08d4da, ; 894: System.Net.ServicePoint => 74
	i64 u0xb8e68d20aad91196, ; 895: lib_System.Xml.XPath.dll.so => 159
	i64 u0xb9185c33a1643eed, ; 896: Microsoft.CSharp.dll => 1
	i64 u0xb9b8001adf4ed7cc, ; 897: lib_Xamarin.AndroidX.SlidingPaneLayout.dll.so => 319
	i64 u0xb9f64d3b230def68, ; 898: lib-pt-Microsoft.Maui.Controls.resources.dll.so => 384
	i64 u0xb9fc3c8a556e3691, ; 899: ja/Microsoft.Maui.Controls.resources => 377
	i64 u0xba4670aa94a2b3c6, ; 900: lib_System.Xml.XDocument.dll.so => 157
	i64 u0xba48785529705af9, ; 901: System.Collections.dll => 12
	i64 u0xba965b8c86359996, ; 902: lib_System.Windows.dll.so => 153
	i64 u0xbb286883bc35db36, ; 903: System.Transactions.dll => 149
	i64 u0xbb65706fde942ce3, ; 904: System.Net.Sockets => 75
	i64 u0xbb6dc0b35452c1a0, ; 905: ZXing.Net.MAUI.dll => 347
	i64 u0xbb8c8d165ef11460, ; 906: lib_Microsoft.Identity.Client.Extensions.Msal.dll.so => 209
	i64 u0xbba28979413cad9e, ; 907: lib_System.Runtime.CompilerServices.VisualC.dll.so => 102
	i64 u0xbbd180354b67271a, ; 908: System.Runtime.Serialization.Formatters => 111
	i64 u0xbc22a245dab70cb4, ; 909: lib_SQLitePCLRaw.provider.e_sqlite3.dll.so => 236
	i64 u0xbc260cdba33291a3, ; 910: Xamarin.AndroidX.Arch.Core.Common.dll => 262
	i64 u0xbcd22b365b764643, ; 911: lib-zh-Hans-Microsoft.Data.SqlClient.resources.dll.so => 360
	i64 u0xbcef2cc19d49603f, ; 912: EFCore.BulkExtensions.PostgreSql.dll => 179
	i64 u0xbd0aaf9dbfcc3376, ; 913: fr/Microsoft.Data.SqlClient.resources.dll => 352
	i64 u0xbd0e2c0d55246576, ; 914: System.Net.Http.dll => 64
	i64 u0xbd3c2d7a8325e11b, ; 915: lib-fr-Microsoft.Data.SqlClient.resources.dll.so => 352
	i64 u0xbd3fbd85b9e1cb29, ; 916: lib_System.Net.HttpListener.dll.so => 65
	i64 u0xbd437a2cdb333d0d, ; 917: Xamarin.AndroidX.ViewPager2 => 328
	i64 u0xbd4aef17dbfb0390, ; 918: ru/Microsoft.Data.SqlClient.resources => 358
	i64 u0xbd4f572d2bd0a789, ; 919: System.IO.Compression.ZipFile.dll => 44
	i64 u0xbd5d0b88d3d647a5, ; 920: lib_Xamarin.AndroidX.Browser.dll.so => 264
	i64 u0xbd877b14d0b56392, ; 921: System.Runtime.Intrinsics.dll => 108
	i64 u0xbe08e3083025c53d, ; 922: ZXing.Net.MAUI.Controls.dll => 348
	i64 u0xbe532a80075c3dc8, ; 923: Xamarin.AndroidX.Camera.Core.dll => 266
	i64 u0xbe65a49036345cf4, ; 924: lib_System.Buffers.dll.so => 7
	i64 u0xbee38d4a88835966, ; 925: Xamarin.AndroidX.AppCompat.AppCompatResources => 261
	i64 u0xbef9919db45b4ca7, ; 926: System.IO.Pipes.AccessControl => 54
	i64 u0xbf0fa68611139208, ; 927: lib_Xamarin.AndroidX.Annotation.dll.so => 257
	i64 u0xbfc1e1fb3095f2b3, ; 928: lib_System.Net.Http.Json.dll.so => 63
	i64 u0xc040a4ab55817f58, ; 929: ar/Microsoft.Maui.Controls.resources.dll => 362
	i64 u0xc07cadab29efeba0, ; 930: Xamarin.AndroidX.Core.Core.Ktx.dll => 278
	i64 u0xc0ca0108a1384ed5, ; 931: lib_EFCore.BulkExtensions.Core.dll.so => 177
	i64 u0xc0d928351ab5ca77, ; 932: System.Console.dll => 20
	i64 u0xc0f5a221a9383aea, ; 933: System.Runtime.Intrinsics => 108
	i64 u0xc111030af54d7191, ; 934: System.Resources.Writer => 100
	i64 u0xc1182977a92df85f, ; 935: lib-fr-Microsoft.SqlServer.Types.resources.dll.so => 398
	i64 u0xc12b8b3afa48329c, ; 936: lib_System.Linq.dll.so => 61
	i64 u0xc183ca0b74453aa9, ; 937: lib_System.Threading.Tasks.Dataflow.dll.so => 140
	i64 u0xc1c2cb7af77b8858, ; 938: Microsoft.EntityFrameworkCore => 189
	i64 u0xc1ff9ae3cdb6e1e6, ; 939: Xamarin.AndroidX.Activity.dll => 255
	i64 u0xc26c064effb1dea9, ; 940: System.Buffers.dll => 7
	i64 u0xc278de356ad8a9e3, ; 941: Microsoft.IdentityModel.Logging => 212
	i64 u0xc28c50f32f81cc73, ; 942: ja/Microsoft.Maui.Controls.resources.dll => 377
	i64 u0xc2902f6cf5452577, ; 943: lib_Mono.Android.Export.dll.so => 168
	i64 u0xc2a3bca55b573141, ; 944: System.IO.FileSystem.Watcher => 49
	i64 u0xc2bcfec99f69365e, ; 945: Xamarin.AndroidX.ViewPager2.dll => 328
	i64 u0xc2eb95e1f02ee46b, ; 946: it/Microsoft.SqlServer.Types.resources.dll => 399
	i64 u0xc30b52815b58ac2c, ; 947: lib_System.Runtime.Serialization.Xml.dll.so => 114
	i64 u0xc3492f8f90f96ce4, ; 948: lib_Microsoft.Extensions.DependencyModel.dll.so => 202
	i64 u0xc36d7d89c652f455, ; 949: System.Threading.Overlapped => 139
	i64 u0xc396b285e59e5493, ; 950: GoogleGson.dll => 182
	i64 u0xc3c86c1e5e12f03d, ; 951: WindowsBase => 164
	i64 u0xc3f0e03e56ce7b69, ; 952: zxing => 346
	i64 u0xc421b61fd853169d, ; 953: lib_System.Net.WebSockets.Client.dll.so => 79
	i64 u0xc463e077917aa21d, ; 954: System.Runtime.Serialization.Json => 112
	i64 u0xc472ce300460ccb6, ; 955: Microsoft.EntityFrameworkCore.dll => 189
	i64 u0xc4d3858ed4d08512, ; 956: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 305
	i64 u0xc4d69851fe06342f, ; 957: lib_Microsoft.Extensions.Caching.Memory.dll.so => 197
	i64 u0xc50fded0ded1418c, ; 958: lib_System.ComponentModel.TypeConverter.dll.so => 17
	i64 u0xc519125d6bc8fb11, ; 959: lib_System.Net.Requests.dll.so => 72
	i64 u0xc5293b19e4dc230e, ; 960: Xamarin.AndroidX.Navigation.Fragment => 309
	i64 u0xc5325b2fcb37446f, ; 961: lib_System.Private.Xml.dll.so => 88
	i64 u0xc535cb9a21385d9b, ; 962: lib_Xamarin.Android.Glide.DiskLruCache.dll.so => 253
	i64 u0xc583d8477b5d3bac, ; 963: zh-Hant/Microsoft.Data.SqlClient.resources.dll => 361
	i64 u0xc5a0f4b95a699af7, ; 964: lib_System.Private.Uri.dll.so => 86
	i64 u0xc5cdcd5b6277579e, ; 965: lib_System.Security.Cryptography.Algorithms.dll.so => 119
	i64 u0xc5ec286825cb0bf4, ; 966: Xamarin.AndroidX.Tracing.Tracing => 322
	i64 u0xc6706bc8aa7fe265, ; 967: Xamarin.AndroidX.Annotation.Jvm => 259
	i64 u0xc7c01e7d7c93a110, ; 968: System.Text.Encoding.Extensions.dll => 134
	i64 u0xc7ce851898a4548e, ; 969: lib_System.Web.HttpUtility.dll.so => 151
	i64 u0xc809d4089d2556b2, ; 970: System.Runtime.InteropServices.JavaScript.dll => 105
	i64 u0xc858a28d9ee5a6c5, ; 971: lib_System.Collections.Specialized.dll.so => 11
	i64 u0xc8ac7c6bf1c2ec51, ; 972: System.Reflection.DispatchProxy.dll => 89
	i64 u0xc95a1178aef91462, ; 973: lib_Microsoft.EntityFrameworkCore.SqlServer.HierarchyId.dll.so => 195
	i64 u0xc9c62c8f354ac568, ; 974: lib_System.Diagnostics.TextWriterTraceListener.dll.so => 31
	i64 u0xc9d61d6a8d51fe6c, ; 975: lib_NetTopologySuite.IO.SqlServerBytes.dll.so => 226
	i64 u0xc9e54b32fc19baf3, ; 976: lib_CommunityToolkit.Maui.dll.so => 174
	i64 u0xca32340d8d54dcd5, ; 977: Microsoft.Extensions.Caching.Memory.dll => 197
	i64 u0xca3a723e7342c5b6, ; 978: lib-tr-Microsoft.Maui.Controls.resources.dll.so => 390
	i64 u0xca5801070d9fccfb, ; 979: System.Text.Encoding => 135
	i64 u0xcab3493c70141c2d, ; 980: pl/Microsoft.Maui.Controls.resources => 382
	i64 u0xcacfddc9f7c6de76, ; 981: ro/Microsoft.Maui.Controls.resources.dll => 385
	i64 u0xcadbc92899a777f0, ; 982: Xamarin.AndroidX.Startup.StartupRuntime => 320
	i64 u0xcb45618372c47127, ; 983: Microsoft.EntityFrameworkCore.Relational => 191
	i64 u0xcb6f731cbdfa3dd8, ; 984: Npgsql.EntityFrameworkCore.PostgreSQL => 229
	i64 u0xcba1cb79f45292b5, ; 985: Xamarin.Android.Glide.GifDecoder.dll => 254
	i64 u0xcbb5f80c7293e696, ; 986: lib_System.Globalization.Calendars.dll.so => 39
	i64 u0xcbd4fdd9cef4a294, ; 987: lib__Microsoft.Android.Resource.Designer.dll.so => 409
	i64 u0xcc15da1e07bbd994, ; 988: Xamarin.AndroidX.SlidingPaneLayout => 319
	i64 u0xcc182c3afdc374d6, ; 989: Microsoft.Bcl.AsyncInterfaces => 185
	i64 u0xcc2876b32ef2794c, ; 990: lib_System.Text.RegularExpressions.dll.so => 137
	i64 u0xcc5c3bb714c4561e, ; 991: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 343
	i64 u0xcc76886e09b88260, ; 992: Xamarin.KotlinX.Serialization.Core.Jvm.dll => 345
	i64 u0xcc9fa2923aa1c9ef, ; 993: System.Diagnostics.Contracts.dll => 25
	i64 u0xccf25c4b634ccd3a, ; 994: zh-Hans/Microsoft.Maui.Controls.resources.dll => 394
	i64 u0xcd10a42808629144, ; 995: System.Net.Requests => 72
	i64 u0xcdca1b920e9f53ba, ; 996: Xamarin.AndroidX.Interpolator => 290
	i64 u0xcdd0c48b6937b21c, ; 997: Xamarin.AndroidX.SwipeRefreshLayout => 321
	i64 u0xce366153aaa26f70, ; 998: System.DirectoryServices.Protocols.dll => 242
	i64 u0xceb28d385f84f441, ; 999: Azure.Core.dll => 172
	i64 u0xcf140ed700bc8e66, ; 1000: Microsoft.SqlServer.Server.dll => 222
	i64 u0xcf23d8093f3ceadf, ; 1001: System.Diagnostics.DiagnosticSource.dll => 27
	i64 u0xcf4d55b5fe223cd6, ; 1002: NetTopologySuite.IO.SqlServerBytes => 226
	i64 u0xcf5ff6b6b2c4c382, ; 1003: System.Net.Mail.dll => 66
	i64 u0xcf8fc898f98b0d34, ; 1004: System.Private.Xml.Linq => 87
	i64 u0xcfa869564d903308, ; 1005: EFCore.BulkExtensions.Core => 177
	i64 u0xd04b5f59ed596e31, ; 1006: System.Reflection.Metadata.dll => 94
	i64 u0xd063299fcfc0c93f, ; 1007: lib_System.Runtime.Serialization.Json.dll.so => 112
	i64 u0xd0de8a113e976700, ; 1008: System.Diagnostics.TextWriterTraceListener => 31
	i64 u0xd0fc33d5ae5d4cb8, ; 1009: System.Runtime.Extensions => 103
	i64 u0xd1194e1d8a8de83c, ; 1010: lib_Xamarin.AndroidX.Lifecycle.Common.Jvm.dll.so => 293
	i64 u0xd12beacdfc14f696, ; 1011: System.Dynamic.Runtime => 37
	i64 u0xd198e7ce1b6a8344, ; 1012: System.Net.Quic.dll => 71
	i64 u0xd22a0c4630f2fe66, ; 1013: lib_System.Security.Cryptography.ProtectedData.dll.so => 247
	i64 u0xd2b39754bb800974, ; 1014: es/Microsoft.SqlServer.Types.resources => 397
	i64 u0xd2dffb59201927bd, ; 1015: de/Microsoft.Data.SqlClient.resources.dll => 350
	i64 u0xd3144156a3727ebe, ; 1016: Xamarin.Google.Guava.ListenableFuture => 336
	i64 u0xd333d0af9e423810, ; 1017: System.Runtime.InteropServices => 107
	i64 u0xd33a415cb4278969, ; 1018: System.Security.Cryptography.Encoding.dll => 122
	i64 u0xd3426d966bb704f5, ; 1019: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 261
	i64 u0xd3651b6fc3125825, ; 1020: System.Private.Uri.dll => 86
	i64 u0xd373685349b1fe8b, ; 1021: Microsoft.Extensions.Logging.dll => 203
	i64 u0xd3801faafafb7698, ; 1022: System.Private.DataContractSerialization.dll => 85
	i64 u0xd3e4c8d6a2d5d470, ; 1023: it/Microsoft.Maui.Controls.resources => 376
	i64 u0xd3edcc1f25459a50, ; 1024: System.Reflection.Emit => 92
	i64 u0xd42655883bb8c19f, ; 1025: Microsoft.EntityFrameworkCore.Abstractions.dll => 190
	i64 u0xd4645626dffec99d, ; 1026: lib_Microsoft.Extensions.DependencyInjection.Abstractions.dll.so => 201
	i64 u0xd4fa0abb79079ea9, ; 1027: System.Security.Principal.dll => 128
	i64 u0xd5507e11a2b2839f, ; 1028: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 305
	i64 u0xd567f168deeeaf3c, ; 1029: lib_zxing.dll.so => 346
	i64 u0xd5858610826f1c08, ; 1030: lib-ru-Microsoft.Data.SqlClient.resources.dll.so => 358
	i64 u0xd5d04bef8478ea19, ; 1031: Xamarin.AndroidX.Tracing.Tracing.dll => 322
	i64 u0xd60815f26a12e140, ; 1032: Microsoft.Extensions.Logging.Debug.dll => 205
	i64 u0xd63b432ec9306914, ; 1033: zxing.dll => 346
	i64 u0xd65786d27a4ad960, ; 1034: lib_Microsoft.Maui.Controls.HotReload.Forms.dll.so => 406
	i64 u0xd6694f8359737e4e, ; 1035: Xamarin.AndroidX.SavedState => 316
	i64 u0xd67e431fe2ca996e, ; 1036: zh-Hans/Microsoft.SqlServer.Types.resources.dll => 404
	i64 u0xd6949e129339eae5, ; 1037: lib_Xamarin.AndroidX.Core.Core.Ktx.dll.so => 278
	i64 u0xd6d21782156bc35b, ; 1038: Xamarin.AndroidX.SwipeRefreshLayout.dll => 321
	i64 u0xd6de019f6af72435, ; 1039: Xamarin.AndroidX.ConstraintLayout.Core.dll => 275
	i64 u0xd70956d1e6deefb9, ; 1040: Jsr305Binding => 333
	i64 u0xd72329819cbbbc44, ; 1041: lib_Microsoft.Extensions.Configuration.Abstractions.dll.so => 199
	i64 u0xd72c760af136e863, ; 1042: System.Xml.XmlSerializer.dll => 161
	i64 u0xd753f071e44c2a03, ; 1043: lib_System.Security.SecureString.dll.so => 129
	i64 u0xd7b3764ada9d341d, ; 1044: lib_Microsoft.Extensions.Logging.Abstractions.dll.so => 204
	i64 u0xd7f0088bc5ad71f2, ; 1045: Xamarin.AndroidX.VersionedParcelable => 326
	i64 u0xd8fb25e28ae30a12, ; 1046: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 313
	i64 u0xd9d04d95a2671e29, ; 1047: lib_ZXing.Net.MAUI.Controls.dll.so => 348
	i64 u0xda1dfa4c534a9251, ; 1048: Microsoft.Extensions.DependencyInjection => 200
	i64 u0xdad05a11827959a3, ; 1049: System.Collections.NonGeneric.dll => 10
	i64 u0xdaefdfe71aa53cf9, ; 1050: System.IO.FileSystem.Primitives => 48
	i64 u0xdb5383ab5865c007, ; 1051: lib-vi-Microsoft.Maui.Controls.resources.dll.so => 392
	i64 u0xdb58816721c02a59, ; 1052: lib_System.Reflection.Emit.ILGeneration.dll.so => 90
	i64 u0xdbeda89f832aa805, ; 1053: vi/Microsoft.Maui.Controls.resources.dll => 392
	i64 u0xdbf2a779fbc3ac31, ; 1054: System.Transactions.Local.dll => 148
	i64 u0xdbf9607a441b4505, ; 1055: System.Linq => 61
	i64 u0xdbfc90157a0de9b0, ; 1056: lib_System.Text.Encoding.dll.so => 135
	i64 u0xdc75032002d1a212, ; 1057: lib_System.Transactions.Local.dll.so => 148
	i64 u0xdca8be7403f92d4f, ; 1058: lib_System.Linq.Queryable.dll.so => 60
	i64 u0xdce2c53525640bf3, ; 1059: Microsoft.Extensions.Logging => 203
	i64 u0xdd2b722d78ef5f43, ; 1060: System.Runtime.dll => 116
	i64 u0xdd67031857c72f96, ; 1061: lib_System.Text.Encodings.Web.dll.so => 136
	i64 u0xdd92e229ad292030, ; 1062: System.Numerics.dll => 83
	i64 u0xdddcdd701e911af1, ; 1063: lib_Xamarin.AndroidX.Legacy.Support.Core.Utils.dll.so => 291
	i64 u0xdde30e6b77aa6f6c, ; 1064: lib-zh-Hans-Microsoft.Maui.Controls.resources.dll.so => 394
	i64 u0xde110ae80fa7c2e2, ; 1065: System.Xml.XDocument.dll => 157
	i64 u0xde4726fcdf63a198, ; 1066: Xamarin.AndroidX.Transition => 323
	i64 u0xde572c2b2fb32f93, ; 1067: lib_System.Threading.Tasks.Extensions.dll.so => 141
	i64 u0xde8769ebda7d8647, ; 1068: hr/Microsoft.Maui.Controls.resources.dll => 373
	i64 u0xdee075f3477ef6be, ; 1069: Xamarin.AndroidX.ExifInterface.dll => 287
	i64 u0xdf4b773de8fb1540, ; 1070: System.Net.dll => 81
	i64 u0xdfa254ebb4346068, ; 1071: System.Net.Ping => 69
	i64 u0xe0142572c095a480, ; 1072: Xamarin.AndroidX.AppCompat.dll => 260
	i64 u0xe021eaa401792a05, ; 1073: System.Text.Encoding.dll => 135
	i64 u0xe02f89350ec78051, ; 1074: Xamarin.AndroidX.CoordinatorLayout.dll => 276
	i64 u0xe0496b9d65ef5474, ; 1075: Xamarin.Android.Glide.DiskLruCache.dll => 253
	i64 u0xe0ea30f1ac5b7731, ; 1076: ko/Microsoft.Data.SqlClient.resources.dll => 355
	i64 u0xe0ee2e61123c1478, ; 1077: lib-es-Microsoft.Data.SqlClient.resources.dll.so => 351
	i64 u0xe10b760bb1462e7a, ; 1078: lib_System.Security.Cryptography.Primitives.dll.so => 124
	i64 u0xe12265280d0b036d, ; 1079: fr/Microsoft.Data.SqlClient.resources => 352
	i64 u0xe1566bbdb759c5af, ; 1080: Microsoft.Maui.Controls.HotReload.Forms.dll => 406
	i64 u0xe192a588d4410686, ; 1081: lib_System.IO.Pipelines.dll.so => 53
	i64 u0xe1a08bd3fa539e0d, ; 1082: System.Runtime.Loader => 109
	i64 u0xe1a77eb8831f7741, ; 1083: System.Security.SecureString.dll => 129
	i64 u0xe1b52f9f816c70ef, ; 1084: System.Private.Xml.Linq.dll => 87
	i64 u0xe1e199c8ab02e356, ; 1085: System.Data.DataSetExtensions.dll => 23
	i64 u0xe1ecfdb7fff86067, ; 1086: System.Net.Security.dll => 73
	i64 u0xe2252a80fe853de4, ; 1087: lib_System.Security.Principal.dll.so => 128
	i64 u0xe22fa4c9c645db62, ; 1088: System.Diagnostics.TextWriterTraceListener.dll => 31
	i64 u0xe2420585aeceb728, ; 1089: System.Net.Requests.dll => 72
	i64 u0xe26692647e6bcb62, ; 1090: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 300
	i64 u0xe29b73bc11392966, ; 1091: lib-id-Microsoft.Maui.Controls.resources.dll.so => 375
	i64 u0xe2ad448dee50fbdf, ; 1092: System.Xml.Serialization => 156
	i64 u0xe2d920f978f5d85c, ; 1093: System.Data.DataSetExtensions => 23
	i64 u0xe2e426c7714fa0bc, ; 1094: Microsoft.Win32.Primitives.dll => 4
	i64 u0xe332bacb3eb4a806, ; 1095: Mono.Android.Export.dll => 168
	i64 u0xe3811d68d4fe8463, ; 1096: pt-BR/Microsoft.Maui.Controls.resources.dll => 383
	i64 u0xe3b7cbae5ad66c75, ; 1097: lib_System.Security.Cryptography.Encoding.dll.so => 122
	i64 u0xe494f7ced4ecd10a, ; 1098: hu/Microsoft.Maui.Controls.resources.dll => 374
	i64 u0xe4a9b1e40d1e8917, ; 1099: lib-fi-Microsoft.Maui.Controls.resources.dll.so => 369
	i64 u0xe4f74a0b5bf9703f, ; 1100: System.Runtime.Serialization.Primitives => 113
	i64 u0xe5434e8a119ceb69, ; 1101: lib_Mono.Android.dll.so => 170
	i64 u0xe55703b9ce5c038a, ; 1102: System.Diagnostics.Tools => 32
	i64 u0xe57013c8afc270b5, ; 1103: Microsoft.VisualBasic => 3
	i64 u0xe57d22ca4aeb4900, ; 1104: System.Configuration.ConfigurationManager => 238
	i64 u0xe62913cc36bc07ec, ; 1105: System.Xml.dll => 162
	i64 u0xe67e4f4689949049, ; 1106: zh-Hans/Microsoft.SqlServer.Types.resources => 404
	i64 u0xe7bea09c4900a191, ; 1107: Xamarin.AndroidX.VectorDrawable.dll => 324
	i64 u0xe7e03cc18dcdeb49, ; 1108: lib_System.Diagnostics.StackTrace.dll.so => 30
	i64 u0xe7e147ff99a7a380, ; 1109: lib_System.Configuration.dll.so => 19
	i64 u0xe86b0df4ba9e5db8, ; 1110: lib_Xamarin.AndroidX.Lifecycle.Runtime.Android.dll.so => 299
	i64 u0xe896622fe0902957, ; 1111: System.Reflection.Emit.dll => 92
	i64 u0xe89a2a9ef110899b, ; 1112: System.Drawing.dll => 36
	i64 u0xe8c5f8c100b5934b, ; 1113: Microsoft.Win32.Registry => 5
	i64 u0xe957c3976986ab72, ; 1114: lib_Xamarin.AndroidX.Window.Extensions.Core.Core.dll.so => 330
	i64 u0xe98163eb702ae5c5, ; 1115: Xamarin.AndroidX.Arch.Core.Runtime => 263
	i64 u0xe994f23ba4c143e5, ; 1116: Xamarin.KotlinX.Coroutines.Android => 341
	i64 u0xe9b9c8c0458fd92a, ; 1117: System.Windows => 153
	i64 u0xe9d166d87a7f2bdb, ; 1118: lib_Xamarin.AndroidX.Startup.StartupRuntime.dll.so => 320
	i64 u0xea5a4efc2ad81d1b, ; 1119: Xamarin.Google.ErrorProne.Annotations => 335
	i64 u0xeae68e81c894c13d, ; 1120: UraniumUI.Material.dll => 250
	i64 u0xeb2313fe9d65b785, ; 1121: Xamarin.AndroidX.ConstraintLayout.dll => 274
	i64 u0xeb6e275e78cb8d42, ; 1122: Xamarin.AndroidX.LocalBroadcastManager.dll => 307
	i64 u0xed19c616b3fcb7eb, ; 1123: Xamarin.AndroidX.VersionedParcelable.dll => 326
	i64 u0xed60c6fa891c051a, ; 1124: lib_Microsoft.VisualStudio.DesignTools.TapContract.dll.so => 408
	i64 u0xed6ef763c6fb395f, ; 1125: System.Diagnostics.EventLog.dll => 240
	i64 u0xed88ac16d5217c50, ; 1126: lib_EFCore.BulkExtensions.Oracle.dll.so => 178
	i64 u0xedc4817167106c23, ; 1127: System.Net.Sockets.dll => 75
	i64 u0xedc632067fb20ff3, ; 1128: System.Memory.dll => 62
	i64 u0xedc8e4ca71a02a8b, ; 1129: Xamarin.AndroidX.Navigation.Runtime.dll => 310
	i64 u0xee04c435dc04d4d7, ; 1130: EFCore.BulkExtensions.Core.dll => 177
	i64 u0xee81f5b3f1c4f83b, ; 1131: System.Threading.ThreadPool => 145
	i64 u0xeeb7ebb80150501b, ; 1132: lib_Xamarin.AndroidX.Collection.Jvm.dll.so => 271
	i64 u0xeef850486aa78956, ; 1133: lib-de-Microsoft.SqlServer.Types.resources.dll.so => 396
	i64 u0xeefc635595ef57f0, ; 1134: System.Security.Cryptography.Cng => 120
	i64 u0xef03b1b5a04e9709, ; 1135: System.Text.Encoding.CodePages.dll => 133
	i64 u0xef2f805e5d8b8230, ; 1136: lib_Oracle.ManagedDataAccess.dll.so => 231
	i64 u0xef432781d5667f61, ; 1137: Xamarin.AndroidX.Print => 312
	i64 u0xef602c523fe2e87a, ; 1138: lib_Xamarin.Google.Guava.ListenableFuture.dll.so => 336
	i64 u0xef72742e1bcca27a, ; 1139: Microsoft.Maui.Essentials.dll => 220
	i64 u0xefd0396433f04886, ; 1140: pt-BR/Microsoft.Data.SqlClient.resources => 357
	i64 u0xefd1e0c4e5c9b371, ; 1141: System.Resources.ResourceManager.dll => 99
	i64 u0xefe24f02e90841a9, ; 1142: ru/Microsoft.SqlServer.Types.resources.dll => 403
	i64 u0xefe8f8d5ed3c72ea, ; 1143: System.Formats.Tar.dll => 38
	i64 u0xefec0b7fdc57ec42, ; 1144: Xamarin.AndroidX.Activity => 255
	i64 u0xf00c29406ea45e19, ; 1145: es/Microsoft.Maui.Controls.resources.dll => 368
	i64 u0xf09e47b6ae914f6e, ; 1146: System.Net.NameResolution => 67
	i64 u0xf0ac2b489fed2e35, ; 1147: lib_System.Diagnostics.Debug.dll.so => 26
	i64 u0xf0bb49dadd3a1fe1, ; 1148: lib_System.Net.ServicePoint.dll.so => 74
	i64 u0xf0de2537ee19c6ca, ; 1149: lib_System.Net.WebHeaderCollection.dll.so => 77
	i64 u0xf1138779fa181c68, ; 1150: lib_Xamarin.AndroidX.Lifecycle.Runtime.dll.so => 298
	i64 u0xf11b621fc87b983f, ; 1151: Microsoft.Maui.Controls.Xaml.dll => 218
	i64 u0xf161f4f3c3b7e62c, ; 1152: System.Data => 24
	i64 u0xf16eb650d5a464bc, ; 1153: System.ValueTuple => 150
	i64 u0xf1c4b4005493d871, ; 1154: System.Formats.Asn1.dll => 243
	i64 u0xf238bd79489d3a96, ; 1155: lib-nl-Microsoft.Maui.Controls.resources.dll.so => 381
	i64 u0xf25203d36c6e85c4, ; 1156: lib-ja-Microsoft.SqlServer.Types.resources.dll.so => 400
	i64 u0xf2feea356ba760af, ; 1157: Xamarin.AndroidX.Arch.Core.Runtime.dll => 263
	i64 u0xf300e085f8acd238, ; 1158: lib_System.ServiceProcess.dll.so => 132
	i64 u0xf34e52b26e7e059d, ; 1159: System.Runtime.CompilerServices.VisualC.dll => 102
	i64 u0xf37221fda4ef8830, ; 1160: lib_Xamarin.Google.Android.Material.dll.so => 331
	i64 u0xf3ad9b8fb3eefd12, ; 1161: lib_System.IO.UnmanagedMemoryStream.dll.so => 56
	i64 u0xf3ddfe05336abf29, ; 1162: System => 163
	i64 u0xf408654b2a135055, ; 1163: System.Reflection.Emit.ILGeneration.dll => 90
	i64 u0xf4103170a1de5bd0, ; 1164: System.Linq.Queryable.dll => 60
	i64 u0xf42d20c23173d77c, ; 1165: lib_System.ServiceModel.Web.dll.so => 131
	i64 u0xf4c1dd70a5496a17, ; 1166: System.IO.Compression => 45
	i64 u0xf4ecf4b9afc64781, ; 1167: System.ServiceProcess.dll => 132
	i64 u0xf4eeeaa566e9b970, ; 1168: lib_Xamarin.AndroidX.CustomView.PoolingContainer.dll.so => 281
	i64 u0xf502029ca9ac09c4, ; 1169: Microsoft.EntityFrameworkCore.SqlServer.HierarchyId.dll => 195
	i64 u0xf518f63ead11fcd1, ; 1170: System.Threading.Tasks => 143
	i64 u0xf5e59d7ac34b50aa, ; 1171: Microsoft.IdentityModel.Protocols.dll => 213
	i64 u0xf5fc7602fe27b333, ; 1172: System.Net.WebHeaderCollection => 77
	i64 u0xf6077741019d7428, ; 1173: Xamarin.AndroidX.CoordinatorLayout => 276
	i64 u0xf61ade9836ad4692, ; 1174: Microsoft.IdentityModel.Tokens.dll => 215
	i64 u0xf6742cbf457c450b, ; 1175: Xamarin.AndroidX.Lifecycle.Runtime.Android.dll => 299
	i64 u0xf6ae7832fd9c9009, ; 1176: lib-it-Microsoft.SqlServer.Types.resources.dll.so => 399
	i64 u0xf6c0e7d55a7a4e4f, ; 1177: Microsoft.IdentityModel.JsonWebTokens => 211
	i64 u0xf70c0a7bf8ccf5af, ; 1178: System.Web => 152
	i64 u0xf77b20923f07c667, ; 1179: de/Microsoft.Maui.Controls.resources.dll => 366
	i64 u0xf79cbf52994c8548, ; 1180: Npgsql => 228
	i64 u0xf7be8a85d06b4b64, ; 1181: ru/Microsoft.Data.SqlClient.resources.dll => 358
	i64 u0xf7e2cac4c45067b3, ; 1182: lib_System.Numerics.Vectors.dll.so => 82
	i64 u0xf7e74930e0e3d214, ; 1183: zh-HK/Microsoft.Maui.Controls.resources.dll => 393
	i64 u0xf7fa0bf77fe677cc, ; 1184: Newtonsoft.Json.dll => 227
	i64 u0xf83775f330791063, ; 1185: ja/Microsoft.Data.SqlClient.resources.dll => 354
	i64 u0xf84773b5c81e3cef, ; 1186: lib-uk-Microsoft.Maui.Controls.resources.dll.so => 391
	i64 u0xf8aac5ea82de1348, ; 1187: System.Linq.Queryable => 60
	i64 u0xf8abd63acd77d37b, ; 1188: Xamarin.AndroidX.Camera.View => 268
	i64 u0xf8b77539b362d3ba, ; 1189: lib_System.Reflection.Primitives.dll.so => 95
	i64 u0xf8cd217ba1bbfdc8, ; 1190: lib-zh-Hant-Microsoft.Data.SqlClient.resources.dll.so => 361
	i64 u0xf8e045dc345b2ea3, ; 1191: lib_Xamarin.AndroidX.RecyclerView.dll.so => 314
	i64 u0xf915dc29808193a1, ; 1192: System.Web.HttpUtility.dll => 151
	i64 u0xf96c777a2a0686f4, ; 1193: hi/Microsoft.Maui.Controls.resources.dll => 372
	i64 u0xf9be54c8bcf8ff3b, ; 1194: System.Security.AccessControl.dll => 117
	i64 u0xf9eec5bb3a6aedc6, ; 1195: Microsoft.Extensions.Options => 206
	i64 u0xfa0e82300e67f913, ; 1196: lib_System.AppContext.dll.so => 6
	i64 u0xfa2fdb27e8a2c8e8, ; 1197: System.ComponentModel.EventBasedAsync => 15
	i64 u0xfa3f278f288b0e84, ; 1198: lib_System.Net.Security.dll.so => 73
	i64 u0xfa5ed7226d978949, ; 1199: lib-ar-Microsoft.Maui.Controls.resources.dll.so => 362
	i64 u0xfa645d91e9fc4cba, ; 1200: System.Threading.Thread => 144
	i64 u0xfad4d2c770e827f9, ; 1201: lib_System.IO.IsolatedStorage.dll.so => 51
	i64 u0xfaef53f942a29695, ; 1202: pt-BR/Microsoft.SqlServer.Types.resources => 402
	i64 u0xfb022853d73b7fa5, ; 1203: lib_SQLitePCLRaw.batteries_v2.dll.so => 233
	i64 u0xfb06dd2338e6f7c4, ; 1204: System.Net.Ping.dll => 69
	i64 u0xfb087abe5365e3b7, ; 1205: lib_System.Data.DataSetExtensions.dll.so => 23
	i64 u0xfb846e949baff5ea, ; 1206: System.Xml.Serialization.dll => 156
	i64 u0xfbad3e4ce4b98145, ; 1207: System.Security.Cryptography.X509Certificates => 125
	i64 u0xfbf0a31c9fc34bc4, ; 1208: lib_System.Net.Http.dll.so => 64
	i64 u0xfc61ddcf78dd1f54, ; 1209: Xamarin.AndroidX.LocalBroadcastManager => 307
	i64 u0xfc6b7527cc280b3f, ; 1210: lib_System.Runtime.Serialization.Formatters.dll.so => 111
	i64 u0xfc719aec26adf9d9, ; 1211: Xamarin.AndroidX.Navigation.Fragment.dll => 309
	i64 u0xfc82690c2fe2735c, ; 1212: Xamarin.AndroidX.Lifecycle.Process.dll => 297
	i64 u0xfc93fc307d279893, ; 1213: System.IO.Pipes.AccessControl.dll => 54
	i64 u0xfcd302092ada6328, ; 1214: System.IO.MemoryMappedFiles.dll => 52
	i64 u0xfcd5b90cf101e36b, ; 1215: System.Data.SqlClient.dll => 239
	i64 u0xfd22f00870e40ae0, ; 1216: lib_Xamarin.AndroidX.DrawerLayout.dll.so => 283
	i64 u0xfd49b3c1a76e2748, ; 1217: System.Runtime.InteropServices.RuntimeInformation => 106
	i64 u0xfd536c702f64dc47, ; 1218: System.Text.Encoding.Extensions => 134
	i64 u0xfd583f7657b6a1cb, ; 1219: Xamarin.AndroidX.Fragment => 288
	i64 u0xfd8dd91a2c26bd5d, ; 1220: Xamarin.AndroidX.Lifecycle.Runtime => 298
	i64 u0xfda36abccf05cf5c, ; 1221: System.Net.WebSockets.Client => 79
	i64 u0xfdbe4710aa9beeff, ; 1222: CommunityToolkit.Maui => 174
	i64 u0xfddbe9695626a7f5, ; 1223: Xamarin.AndroidX.Lifecycle.Common => 292
	i64 u0xfeae9952cf03b8cb, ; 1224: tr/Microsoft.Maui.Controls.resources => 390
	i64 u0xfebe1950717515f9, ; 1225: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 296
	i64 u0xff270a55858bac8d, ; 1226: System.Security.Principal => 128
	i64 u0xff9b54613e0d2cc8, ; 1227: System.Net.Http.Json => 63
	i64 u0xffdb7a971be4ec73, ; 1228: System.ValueTuple.dll => 150
	i64 u0xfff40914e0b38d3d ; 1229: Azure.Identity.dll => 173
], align 16

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [1230 x i32] [
	i32 41, i32 342, i32 224, i32 350, i32 321, i32 223, i32 13, i32 347,
	i32 310, i32 175, i32 246, i32 104, i32 355, i32 197, i32 169, i32 47,
	i32 260, i32 7, i32 236, i32 85, i32 386, i32 364, i32 392, i32 210,
	i32 284, i32 70, i32 400, i32 314, i32 188, i32 12, i32 219, i32 101,
	i32 223, i32 361, i32 188, i32 359, i32 393, i32 154, i32 19, i32 289,
	i32 271, i32 159, i32 286, i32 324, i32 165, i32 386, i32 10, i32 353,
	i32 205, i32 325, i32 172, i32 95, i32 281, i32 405, i32 283, i32 13,
	i32 206, i32 10, i32 245, i32 126, i32 94, i32 196, i32 138, i32 187,
	i32 180, i32 38, i32 387, i32 345, i32 327, i32 383, i32 267, i32 170,
	i32 254, i32 242, i32 5, i32 220, i32 66, i32 318, i32 129, i32 185,
	i32 178, i32 317, i32 285, i32 67, i32 272, i32 65, i32 354, i32 56,
	i32 185, i32 280, i32 51, i32 351, i32 42, i32 124, i32 399, i32 265,
	i32 66, i32 80, i32 300, i32 408, i32 156, i32 91, i32 98, i32 314,
	i32 214, i32 139, i32 149, i32 264, i32 370, i32 160, i32 167, i32 371,
	i32 214, i32 201, i32 179, i32 80, i32 408, i32 272, i32 4, i32 5,
	i32 240, i32 50, i32 100, i32 202, i32 350, i32 55, i32 119, i32 97,
	i32 166, i32 117, i32 342, i32 21, i32 229, i32 374, i32 136, i32 96,
	i32 345, i32 76, i32 380, i32 312, i32 320, i32 118, i32 268, i32 249,
	i32 173, i32 8, i32 163, i32 389, i32 396, i32 69, i32 253, i32 301,
	i32 315, i32 169, i32 143, i32 39, i32 396, i32 216, i32 318, i32 46,
	i32 30, i32 311, i32 378, i32 142, i32 206, i32 161, i32 28, i32 83,
	i32 322, i32 76, i32 178, i32 42, i32 29, i32 41, i32 102, i32 116,
	i32 258, i32 237, i32 44, i32 90, i32 389, i32 55, i32 146, i32 407,
	i32 144, i32 189, i32 99, i32 48, i32 349, i32 20, i32 277, i32 113,
	i32 251, i32 370, i32 334, i32 233, i32 265, i32 338, i32 207, i32 266,
	i32 405, i32 93, i32 57, i32 244, i32 375, i32 373, i32 80, i32 334,
	i32 167, i32 26, i32 70, i32 313, i32 397, i32 287, i32 406, i32 391,
	i32 68, i32 33, i32 369, i32 14, i32 137, i32 244, i32 243, i32 395,
	i32 273, i32 382, i32 133, i32 91, i32 87, i32 357, i32 147, i32 388,
	i32 24, i32 248, i32 56, i32 50, i32 367, i32 181, i32 29, i32 155,
	i32 222, i32 34, i32 162, i32 196, i32 288, i32 210, i32 51, i32 225,
	i32 409, i32 329, i32 89, i32 269, i32 404, i32 35, i32 370, i32 155,
	i32 9, i32 368, i32 75, i32 222, i32 54, i32 241, i32 183, i32 219,
	i32 364, i32 217, i32 13, i32 328, i32 198, i32 262, i32 108, i32 304,
	i32 228, i32 32, i32 103, i32 83, i32 91, i32 52, i32 249, i32 398,
	i32 95, i32 337, i32 57, i32 9, i32 101, i32 180, i32 186, i32 280,
	i32 67, i32 213, i32 238, i32 327, i32 363, i32 227, i32 0, i32 124,
	i32 315, i32 115, i32 134, i32 215, i32 125, i32 105, i32 187, i32 338,
	i32 130, i32 264, i32 348, i32 239, i32 336, i32 145, i32 154, i32 289,
	i32 277, i32 233, i32 284, i32 353, i32 315, i32 96, i32 24, i32 319,
	i32 209, i32 141, i32 312, i32 308, i32 241, i32 173, i32 3, i32 224,
	i32 238, i32 165, i32 261, i32 99, i32 159, i32 98, i32 25, i32 92,
	i32 166, i32 170, i32 256, i32 3, i32 0, i32 382, i32 403, i32 286,
	i32 1, i32 113, i32 338, i32 190, i32 289, i32 297, i32 244, i32 33,
	i32 6, i32 202, i32 386, i32 154, i32 245, i32 384, i32 52, i32 291,
	i32 84, i32 326, i32 311, i32 43, i32 296, i32 103, i32 46, i32 248,
	i32 237, i32 63, i32 191, i32 306, i32 68, i32 79, i32 58, i32 88,
	i32 152, i32 237, i32 262, i32 132, i32 183, i32 109, i32 216, i32 376,
	i32 306, i32 313, i32 169, i32 133, i32 138, i32 39, i32 363, i32 349,
	i32 397, i32 235, i32 215, i32 353, i32 217, i32 195, i32 332, i32 59,
	i32 176, i32 303, i32 354, i32 78, i32 25, i32 36, i32 98, i32 300,
	i32 70, i32 22, i32 360, i32 277, i32 221, i32 231, i32 387, i32 120,
	i32 68, i32 106, i32 393, i32 307, i32 118, i32 116, i32 292, i32 293,
	i32 11, i32 2, i32 123, i32 114, i32 140, i32 40, i32 86, i32 257,
	i32 234, i32 171, i32 27, i32 146, i32 377, i32 200, i32 335, i32 256,
	i32 1, i32 258, i32 245, i32 43, i32 276, i32 147, i32 291, i32 18,
	i32 85, i32 365, i32 40, i32 296, i32 270, i32 239, i32 301, i32 93,
	i32 203, i32 28, i32 40, i32 402, i32 77, i32 347, i32 357, i32 285,
	i32 273, i32 356, i32 142, i32 107, i32 271, i32 11, i32 104, i32 136,
	i32 16, i32 121, i32 65, i32 180, i32 155, i32 22, i32 403, i32 235,
	i32 367, i32 344, i32 101, i32 200, i32 343, i32 62, i32 57, i32 218,
	i32 366, i32 109, i32 349, i32 171, i32 359, i32 186, i32 341, i32 9,
	i32 331, i32 119, i32 194, i32 97, i32 186, i32 104, i32 304, i32 174,
	i32 217, i32 110, i32 259, i32 48, i32 20, i32 303, i32 279, i32 71,
	i32 275, i32 401, i32 153, i32 241, i32 38, i32 365, i32 35, i32 339,
	i32 243, i32 371, i32 235, i32 330, i32 107, i32 380, i32 21, i32 337,
	i32 181, i32 193, i32 302, i32 247, i32 221, i32 356, i32 15, i32 207,
	i32 78, i32 78, i32 279, i32 207, i32 282, i32 309, i32 317, i32 150,
	i32 21, i32 219, i32 364, i32 49, i32 50, i32 232, i32 390, i32 380,
	i32 93, i32 252, i32 376, i32 16, i32 246, i32 122, i32 373, i32 158,
	i32 44, i32 335, i32 182, i32 401, i32 115, i32 62, i32 192, i32 164,
	i32 181, i32 184, i32 198, i32 14, i32 316, i32 110, i32 402, i32 259,
	i32 59, i32 340, i32 332, i32 120, i32 379, i32 2, i32 389, i32 288,
	i32 302, i32 360, i32 339, i32 302, i32 6, i32 270, i32 369, i32 284,
	i32 188, i32 211, i32 17, i32 387, i32 366, i32 76, i32 274, i32 332,
	i32 175, i32 130, i32 337, i32 379, i32 82, i32 205, i32 12, i32 179,
	i32 34, i32 118, i32 344, i32 297, i32 286, i32 84, i32 251, i32 18,
	i32 327, i32 199, i32 208, i32 295, i32 71, i32 407, i32 94, i32 236,
	i32 163, i32 290, i32 81, i32 395, i32 260, i32 269, i32 340, i32 152,
	i32 36, i32 149, i32 391, i32 210, i32 394, i32 268, i32 142, i32 55,
	i32 112, i32 230, i32 191, i32 270, i32 324, i32 355, i32 230, i32 323,
	i32 37, i32 395, i32 198, i32 114, i32 258, i32 14, i32 252, i32 190,
	i32 144, i32 42, i32 220, i32 256, i32 97, i32 343, i32 166, i32 232,
	i32 16, i32 47, i32 106, i32 96, i32 196, i32 306, i32 27, i32 127,
	i32 29, i32 371, i32 359, i32 172, i32 242, i32 317, i32 127, i32 43,
	i32 193, i32 279, i32 250, i32 192, i32 285, i32 147, i32 8, i32 398,
	i32 208, i32 405, i32 232, i32 227, i32 240, i32 308, i32 372, i32 385,
	i32 234, i32 384, i32 131, i32 383, i32 41, i32 344, i32 234, i32 33,
	i32 225, i32 183, i32 409, i32 45, i32 141, i32 303, i32 218, i32 294,
	i32 280, i32 248, i32 61, i32 131, i32 363, i32 47, i32 158, i32 263,
	i32 294, i32 252, i32 351, i32 292, i32 379, i32 323, i32 45, i32 162,
	i32 212, i32 290, i32 214, i32 212, i32 265, i32 267, i32 356, i32 368,
	i32 287, i32 209, i32 375, i32 221, i32 18, i32 8, i32 182, i32 278,
	i32 123, i32 266, i32 58, i32 216, i32 139, i32 176, i32 310, i32 231,
	i32 378, i32 298, i32 213, i32 333, i32 224, i32 228, i32 329, i32 225,
	i32 148, i32 140, i32 342, i32 339, i32 194, i32 125, i32 341, i32 158,
	i32 226, i32 160, i32 281, i32 255, i32 199, i32 249, i32 381, i32 26,
	i32 308, i32 295, i32 401, i32 267, i32 208, i32 81, i32 329, i32 126,
	i32 334, i32 100, i32 146, i32 0, i32 331, i32 311, i32 229, i32 53,
	i32 160, i32 165, i32 194, i32 130, i32 246, i32 37, i32 325, i32 378,
	i32 176, i32 22, i32 193, i32 111, i32 89, i32 282, i32 400, i32 49,
	i32 230, i32 59, i32 121, i32 82, i32 126, i32 161, i32 333, i32 164,
	i32 316, i32 318, i32 283, i32 251, i32 187, i32 299, i32 4, i32 293,
	i32 374, i32 168, i32 2, i32 304, i32 184, i32 115, i32 211, i32 257,
	i32 19, i32 175, i32 204, i32 88, i32 64, i32 30, i32 201, i32 367,
	i32 275, i32 58, i32 223, i32 110, i32 295, i32 32, i32 127, i32 157,
	i32 385, i32 273, i32 138, i32 282, i32 381, i32 151, i32 17, i32 272,
	i32 254, i32 74, i32 73, i32 15, i32 167, i32 84, i32 340, i32 192,
	i32 123, i32 294, i32 305, i32 274, i32 388, i32 301, i32 34, i32 117,
	i32 137, i32 121, i32 105, i32 365, i32 250, i32 407, i32 325, i32 247,
	i32 269, i32 372, i32 362, i32 53, i32 46, i32 28, i32 143, i32 204,
	i32 145, i32 184, i32 35, i32 388, i32 171, i32 330, i32 74, i32 159,
	i32 1, i32 319, i32 384, i32 377, i32 157, i32 12, i32 153, i32 149,
	i32 75, i32 347, i32 209, i32 102, i32 111, i32 236, i32 262, i32 360,
	i32 179, i32 352, i32 64, i32 352, i32 65, i32 328, i32 358, i32 44,
	i32 264, i32 108, i32 348, i32 266, i32 7, i32 261, i32 54, i32 257,
	i32 63, i32 362, i32 278, i32 177, i32 20, i32 108, i32 100, i32 398,
	i32 61, i32 140, i32 189, i32 255, i32 7, i32 212, i32 377, i32 168,
	i32 49, i32 328, i32 399, i32 114, i32 202, i32 139, i32 182, i32 164,
	i32 346, i32 79, i32 112, i32 189, i32 305, i32 197, i32 17, i32 72,
	i32 309, i32 88, i32 253, i32 361, i32 86, i32 119, i32 322, i32 259,
	i32 134, i32 151, i32 105, i32 11, i32 89, i32 195, i32 31, i32 226,
	i32 174, i32 197, i32 390, i32 135, i32 382, i32 385, i32 320, i32 191,
	i32 229, i32 254, i32 39, i32 409, i32 319, i32 185, i32 137, i32 343,
	i32 345, i32 25, i32 394, i32 72, i32 290, i32 321, i32 242, i32 172,
	i32 222, i32 27, i32 226, i32 66, i32 87, i32 177, i32 94, i32 112,
	i32 31, i32 103, i32 293, i32 37, i32 71, i32 247, i32 397, i32 350,
	i32 336, i32 107, i32 122, i32 261, i32 86, i32 203, i32 85, i32 376,
	i32 92, i32 190, i32 201, i32 128, i32 305, i32 346, i32 358, i32 322,
	i32 205, i32 346, i32 406, i32 316, i32 404, i32 278, i32 321, i32 275,
	i32 333, i32 199, i32 161, i32 129, i32 204, i32 326, i32 313, i32 348,
	i32 200, i32 10, i32 48, i32 392, i32 90, i32 392, i32 148, i32 61,
	i32 135, i32 148, i32 60, i32 203, i32 116, i32 136, i32 83, i32 291,
	i32 394, i32 157, i32 323, i32 141, i32 373, i32 287, i32 81, i32 69,
	i32 260, i32 135, i32 276, i32 253, i32 355, i32 351, i32 124, i32 352,
	i32 406, i32 53, i32 109, i32 129, i32 87, i32 23, i32 73, i32 128,
	i32 31, i32 72, i32 300, i32 375, i32 156, i32 23, i32 4, i32 168,
	i32 383, i32 122, i32 374, i32 369, i32 113, i32 170, i32 32, i32 3,
	i32 238, i32 162, i32 404, i32 324, i32 30, i32 19, i32 299, i32 92,
	i32 36, i32 5, i32 330, i32 263, i32 341, i32 153, i32 320, i32 335,
	i32 250, i32 274, i32 307, i32 326, i32 408, i32 240, i32 178, i32 75,
	i32 62, i32 310, i32 177, i32 145, i32 271, i32 396, i32 120, i32 133,
	i32 231, i32 312, i32 336, i32 220, i32 357, i32 99, i32 403, i32 38,
	i32 255, i32 368, i32 67, i32 26, i32 74, i32 77, i32 298, i32 218,
	i32 24, i32 150, i32 243, i32 381, i32 400, i32 263, i32 132, i32 102,
	i32 331, i32 56, i32 163, i32 90, i32 60, i32 131, i32 45, i32 132,
	i32 281, i32 195, i32 143, i32 213, i32 77, i32 276, i32 215, i32 299,
	i32 399, i32 211, i32 152, i32 366, i32 228, i32 358, i32 82, i32 393,
	i32 227, i32 354, i32 391, i32 60, i32 268, i32 95, i32 361, i32 314,
	i32 151, i32 372, i32 117, i32 206, i32 6, i32 15, i32 73, i32 362,
	i32 144, i32 51, i32 402, i32 233, i32 69, i32 23, i32 156, i32 125,
	i32 64, i32 307, i32 111, i32 309, i32 297, i32 54, i32 52, i32 239,
	i32 283, i32 106, i32 134, i32 288, i32 298, i32 79, i32 174, i32 292,
	i32 390, i32 296, i32 128, i32 63, i32 150, i32 173
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
!2 = !{!".NET for Android remotes/origin/release/9.0.1xx @ 4b20432d95ea8965a41cc73997e459d7fa561233"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
