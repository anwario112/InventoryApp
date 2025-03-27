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

@assembly_image_cache = dso_local local_unnamed_addr global [274 x ptr] zeroinitializer, align 8

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [822 x i64] [
	i64 u0x004df92dbfbd34f0, ; 0: lib_NetTopologySuite.dll.so => 110
	i64 u0x006b9d7c1c7e1c42, ; 1: de/Microsoft.Data.SqlClient.resources => 1
	i64 u0x0071cf2d27b7d61e, ; 2: lib_Xamarin.AndroidX.SwipeRefreshLayout.dll.so => 170
	i64 u0x00c57621600ce92e, ; 3: Microsoft.SqlServer.Types.dll => 109
	i64 u0x01109b0e4d99e61f, ; 4: System.ComponentModel.Annotations.dll => 190
	i64 u0x01af0bd6467d518e, ; 5: lib_ZXing.Net.MAUI.dll.so => 179
	i64 u0x02123411c4e01926, ; 6: lib_Xamarin.AndroidX.Navigation.Runtime.dll.so => 166
	i64 u0x022e81ea9c46e03a, ; 7: lib_CommunityToolkit.Maui.Core.dll.so => 61
	i64 u0x02827b47e97f2378, ; 8: System.Security.Cryptography.Pkcs.dll => 138
	i64 u0x029b2c18aaa0996c, ; 9: lib-ko-Microsoft.Data.SqlClient.resources.dll.so => 6
	i64 u0x02a4c5a44384f885, ; 10: Microsoft.Extensions.Caching.Memory => 84
	i64 u0x02abedc11addc1ed, ; 11: lib_Mono.Android.Runtime.dll.so => 272
	i64 u0x032267b2a94db371, ; 12: lib_Xamarin.AndroidX.AppCompat.dll.so => 144
	i64 u0x03621c804933a890, ; 13: System.Buffers => 184
	i64 u0x0363ac97a4cb84e6, ; 14: SQLitePCLRaw.provider.e_sqlite3.dll => 125
	i64 u0x0399610510a38a38, ; 15: lib_System.Private.DataContractSerialization.dll.so => 227
	i64 u0x043032f1d071fae0, ; 16: ru/Microsoft.Maui.Controls.resources => 37
	i64 u0x044440a55165631e, ; 17: lib-cs-Microsoft.Maui.Controls.resources.dll.so => 15
	i64 u0x046eb1581a80c6b0, ; 18: vi/Microsoft.Maui.Controls.resources => 43
	i64 u0x0470607fd33c32db, ; 19: Microsoft.IdentityModel.Abstractions.dll => 96
	i64 u0x0517ef04e06e9f76, ; 20: System.Net.Primitives => 219
	i64 u0x0531da14b48c1e10, ; 21: ja/Microsoft.SqlServer.Types.resources.dll => 51
	i64 u0x0565d18c6da3de38, ; 22: Xamarin.AndroidX.RecyclerView => 168
	i64 u0x057bf9fa9fb09f7c, ; 23: Microsoft.Data.Sqlite.dll => 75
	i64 u0x0581db89237110e9, ; 24: lib_System.Collections.dll.so => 189
	i64 u0x05989cb940b225a9, ; 25: Microsoft.Maui.dll => 105
	i64 u0x05a0cd02a6c1cd3c, ; 26: Svg.Skia.dll => 128
	i64 u0x05c6334bc4836f1a, ; 27: Microsoft.SqlServer.Types => 109
	i64 u0x05d8ca8ee551619f, ; 28: zh-Hant/Microsoft.Data.SqlClient.resources => 12
	i64 u0x05ef98b6a1db882c, ; 29: lib_Microsoft.Data.Sqlite.dll.so => 75
	i64 u0x0600544dd3961080, ; 30: HarfBuzzSharp => 70
	i64 u0x06073ed944b92dc4, ; 31: lib-tr-Microsoft.Data.SqlClient.resources.dll.so => 10
	i64 u0x06076b5d2b581f08, ; 32: zh-HK/Microsoft.Maui.Controls.resources => 44
	i64 u0x06388ffe9f6c161a, ; 33: System.Xml.Linq.dll => 264
	i64 u0x0680a433c781bb3d, ; 34: Xamarin.AndroidX.Collection.Jvm => 151
	i64 u0x07c57877c7ba78ad, ; 35: ru/Microsoft.Maui.Controls.resources.dll => 37
	i64 u0x07dcdc7460a0c5e4, ; 36: System.Collections.NonGeneric => 187
	i64 u0x08015600dcbf6dc7, ; 37: it/Microsoft.Data.SqlClient.resources.dll => 4
	i64 u0x08881a0a9768df86, ; 38: lib_Azure.Core.dll.so => 58
	i64 u0x08a7c865576bbde7, ; 39: System.Reflection.Primitives => 234
	i64 u0x08d348803591587f, ; 40: lib-zh-Hant-Microsoft.SqlServer.Types.resources.dll.so => 56
	i64 u0x08f3c9788ee2153c, ; 41: Xamarin.AndroidX.DrawerLayout => 156
	i64 u0x09138715c92dba90, ; 42: lib_System.ComponentModel.Annotations.dll.so => 190
	i64 u0x0919c28b89381a0b, ; 43: lib_Microsoft.Extensions.Options.dll.so => 92
	i64 u0x092266563089ae3e, ; 44: lib_System.Collections.NonGeneric.dll.so => 187
	i64 u0x095cacaf6b6a32e4, ; 45: System.Memory.Data => 137
	i64 u0x09d144a7e214d457, ; 46: System.Security.Cryptography => 250
	i64 u0x09e2b9f743db21a8, ; 47: lib_System.Reflection.Metadata.dll.so => 233
	i64 u0x0a4ff7e2ead194a4, ; 48: lib_SkiaSharp.HarfBuzz.dll.so => 121
	i64 u0x0a805f95d98f597b, ; 49: lib_Microsoft.Extensions.Caching.Abstractions.dll.so => 83
	i64 u0x0abb3e2b271edc45, ; 50: System.Threading.Channels.dll => 256
	i64 u0x0adeb6c0f5699d33, ; 51: Microsoft.Data.SqlClient.dll => 74
	i64 u0x0af14ac472d816c7, ; 52: EFCore.BulkExtensions.Sqlite.dll => 66
	i64 u0x0b3b632c3bbee20c, ; 53: sk/Microsoft.Maui.Controls.resources => 38
	i64 u0x0b6aff547b84fbe9, ; 54: Xamarin.KotlinX.Serialization.Core.Jvm => 177
	i64 u0x0be2e1f8ce4064ed, ; 55: Xamarin.AndroidX.ViewPager => 171
	i64 u0x0c3ca6cc978e2aae, ; 56: pt-BR/Microsoft.Maui.Controls.resources => 34
	i64 u0x0c3d7adcdb333bf0, ; 57: Xamarin.AndroidX.Camera.Lifecycle => 148
	i64 u0x0c59ad9fbbd43abe, ; 58: Mono.Android => 273
	i64 u0x0c6924c4d04dd909, ; 59: lib_System.DirectoryServices.Protocols.dll.so => 134
	i64 u0x0c7790f60165fc06, ; 60: lib_Microsoft.Maui.Essentials.dll.so => 106
	i64 u0x0cfd116e78cbc305, ; 61: lib_ShimSkiaSharp.dll.so => 119
	i64 u0x0d3b5ab8b2766190, ; 62: lib_Microsoft.Bcl.AsyncInterfaces.dll.so => 73
	i64 u0x0d573c83ae0263d7, ; 63: EFCore.BulkExtensions.Oracle.dll => 64
	i64 u0x0d5c95da1348bb1c, ; 64: Svg.Model => 127
	i64 u0x0e14e73a54dda68e, ; 65: lib_System.Net.NameResolution.dll.so => 217
	i64 u0x0fbe06392ef90569, ; 66: lib-ja-Microsoft.Data.SqlClient.resources.dll.so => 5
	i64 u0x102861e4055f511a, ; 67: Microsoft.Bcl.AsyncInterfaces.dll => 73
	i64 u0x102a31b45304b1da, ; 68: Xamarin.AndroidX.CustomView => 155
	i64 u0x108cf0e0ba098a51, ; 69: es/Microsoft.Data.SqlClient.resources => 2
	i64 u0x10f6cfcbcf801616, ; 70: System.IO.Compression.Brotli => 205
	i64 u0x114443cdcf2091f1, ; 71: System.Security.Cryptography.Primitives => 248
	i64 u0x115c94fcc3878c6a, ; 72: it/Microsoft.SqlServer.Types.resources => 50
	i64 u0x123639456fb056da, ; 73: System.Reflection.Emit.Lightweight.dll => 232
	i64 u0x125b7f94acb989db, ; 74: Xamarin.AndroidX.RecyclerView.dll => 168
	i64 u0x126ee4b0de53cbfd, ; 75: Microsoft.IdentityModel.Protocols.OpenIdConnect.dll => 100
	i64 u0x138567fa954faa55, ; 76: Xamarin.AndroidX.Browser => 146
	i64 u0x13a01de0cbc3f06c, ; 77: lib-fr-Microsoft.Maui.Controls.resources.dll.so => 21
	i64 u0x13f1e5e209e91af4, ; 78: lib_Java.Interop.dll.so => 271
	i64 u0x13f1e880c25d96d1, ; 79: he/Microsoft.Maui.Controls.resources => 22
	i64 u0x143a1f6e62b82b56, ; 80: Microsoft.IdentityModel.Protocols.OpenIdConnect => 100
	i64 u0x143d8ea60a6a4011, ; 81: Microsoft.Extensions.DependencyInjection.Abstractions => 88
	i64 u0x1486e3d77f17a017, ; 82: lib_EFCore.BulkExtensions.PostgreSql.dll.so => 65
	i64 u0x152a448bd1e745a7, ; 83: Microsoft.Win32.Primitives => 183
	i64 u0x159cc6c81072f00e, ; 84: lib_System.Diagnostics.EventLog.dll.so => 132
	i64 u0x16054fdcb6b3098b, ; 85: Microsoft.Extensions.DependencyModel.dll => 89
	i64 u0x162be8a76b00cd97, ; 86: lib-de-Microsoft.Data.SqlClient.resources.dll.so => 1
	i64 u0x16bf2a22df043a09, ; 87: System.IO.Pipes.dll => 211
	i64 u0x16ea2b318ad2d830, ; 88: System.Security.Cryptography.Algorithms => 246
	i64 u0x17125c9a85b4929f, ; 89: lib_netstandard.dll.so => 269
	i64 u0x1716866f7416792e, ; 90: lib_System.Security.AccessControl.dll.so => 244
	i64 u0x1791d47293d97a1b, ; 91: lib_Npgsql.EntityFrameworkCore.PostgreSQL.dll.so => 115
	i64 u0x17b56e25558a5d36, ; 92: lib-hu-Microsoft.Maui.Controls.resources.dll.so => 25
	i64 u0x17f9358913beb16a, ; 93: System.Text.Encodings.Web => 254
	i64 u0x18402a709e357f3b, ; 94: lib_Xamarin.KotlinX.Serialization.Core.Jvm.dll.so => 177
	i64 u0x18a9befae51bb361, ; 95: System.Net.WebClient => 223
	i64 u0x18f0ce884e87d89a, ; 96: nb/Microsoft.Maui.Controls.resources.dll => 31
	i64 u0x19a4c090f14ebb66, ; 97: System.Security.Claims => 245
	i64 u0x1a040febb58bf51e, ; 98: lib_Xamarin.AndroidX.Camera.View.dll.so => 149
	i64 u0x1a21ad8fb8814a23, ; 99: lib_UraniumUI.dll.so => 141
	i64 u0x1a6fceea64859810, ; 100: Azure.Identity => 59
	i64 u0x1a91866a319e9259, ; 101: lib_System.Collections.Concurrent.dll.so => 185
	i64 u0x1aac34d1917ba5d3, ; 102: lib_System.dll.so => 268
	i64 u0x1aad60783ffa3e5b, ; 103: lib-th-Microsoft.Maui.Controls.resources.dll.so => 40
	i64 u0x1ad25954979b4239, ; 104: de/Microsoft.SqlServer.Types.resources => 47
	i64 u0x1c753b5ff15bce1b, ; 105: Mono.Android.Runtime.dll => 272
	i64 u0x1d36e5f6bd20345e, ; 106: de/Microsoft.SqlServer.Types.resources.dll => 47
	i64 u0x1d4c109ca6e27ed8, ; 107: lib_Microsoft.Maui.Controls.Compatibility.dll.so => 102
	i64 u0x1db6820994506bf5, ; 108: System.IO.FileSystem.AccessControl.dll => 207
	i64 u0x1dbb0c2c6a999acb, ; 109: System.Diagnostics.StackTrace => 199
	i64 u0x1e3d87657e9659bc, ; 110: Xamarin.AndroidX.Navigation.UI => 167
	i64 u0x1e71143913d56c10, ; 111: lib-ko-Microsoft.Maui.Controls.resources.dll.so => 29
	i64 u0x1e7c31185e2fb266, ; 112: lib_System.Threading.Tasks.Parallel.dll.so => 258
	i64 u0x1ed8fcce5e9b50a0, ; 113: Microsoft.Extensions.Options.dll => 92
	i64 u0x1f055d15d807e1b2, ; 114: System.Xml.XmlSerializer => 267
	i64 u0x1f1ed22c1085f044, ; 115: lib_System.Diagnostics.FileVersionInfo.dll.so => 197
	i64 u0x20237ea48006d7a8, ; 116: lib_System.Net.WebClient.dll.so => 223
	i64 u0x2029206e81fec6b7, ; 117: EFCore.BulkExtensions.Oracle => 64
	i64 u0x209375905fcc1bad, ; 118: lib_System.IO.Compression.Brotli.dll.so => 205
	i64 u0x20fab3cf2dfbc8df, ; 119: lib_System.Diagnostics.Process.dll.so => 198
	i64 u0x2174319c0d835bc9, ; 120: System.Runtime => 243
	i64 u0x2199f06354c82d3b, ; 121: System.ClientModel.dll => 129
	i64 u0x21cc7e445dcd5469, ; 122: System.Reflection.Emit.ILGeneration => 231
	i64 u0x220fd4f2e7c48170, ; 123: th/Microsoft.Maui.Controls.resources => 40
	i64 u0x224538d85ed15a82, ; 124: System.IO.Pipes => 211
	i64 u0x237be844f1f812c7, ; 125: System.Threading.Thread.dll => 259
	i64 u0x23807c59646ec4f3, ; 126: lib_Microsoft.EntityFrameworkCore.dll.so => 76
	i64 u0x23f599165f90dd7a, ; 127: lib-cs-Microsoft.Data.SqlClient.resources.dll.so => 0
	i64 u0x2407aef2bbe8fadf, ; 128: System.Console => 194
	i64 u0x240abe014b27e7d3, ; 129: Xamarin.AndroidX.Core.dll => 153
	i64 u0x247619fe4413f8bf, ; 130: System.Runtime.Serialization.Primitives.dll => 241
	i64 u0x252073cc3caa62c2, ; 131: fr/Microsoft.Maui.Controls.resources.dll => 21
	i64 u0x25a0a7eff76ea08e, ; 132: SQLitePCLRaw.batteries_v2.dll => 122
	i64 u0x2662c629b96b0b30, ; 133: lib_Xamarin.Kotlin.StdLib.dll.so => 175
	i64 u0x268c1439f13bcc29, ; 134: lib_Microsoft.Extensions.Primitives.dll.so => 93
	i64 u0x268f1dca6d06d437, ; 135: Xamarin.AndroidX.Camera.Core => 147
	i64 u0x26966e2539bcd4cc, ; 136: zh-Hant/Microsoft.SqlServer.Types.resources.dll => 56
	i64 u0x270a44600c921861, ; 137: System.IdentityModel.Tokens.Jwt => 136
	i64 u0x273f3515de5faf0d, ; 138: id/Microsoft.Maui.Controls.resources.dll => 26
	i64 u0x2742545f9094896d, ; 139: hr/Microsoft.Maui.Controls.resources => 24
	i64 u0x27b410442fad6cf1, ; 140: Java.Interop.dll => 271
	i64 u0x2801845a2c71fbfb, ; 141: System.Net.Primitives.dll => 219
	i64 u0x28c1b67181e65f11, ; 142: lib-es-Microsoft.SqlServer.Types.resources.dll.so => 48
	i64 u0x2927d345f3daec35, ; 143: SkiaSharp.dll => 120
	i64 u0x2a128783efe70ba0, ; 144: uk/Microsoft.Maui.Controls.resources.dll => 42
	i64 u0x2a3b095612184159, ; 145: lib_System.Net.NetworkInformation.dll.so => 218
	i64 u0x2a45e6c17076bfbd, ; 146: SkiaSharp.HarfBuzz.dll => 121
	i64 u0x2a6507a5ffabdf28, ; 147: System.Diagnostics.TraceSource.dll => 201
	i64 u0x2ad156c8e1354139, ; 148: fi/Microsoft.Maui.Controls.resources => 20
	i64 u0x2af298f63581d886, ; 149: System.Text.RegularExpressions.dll => 255
	i64 u0x2af615542f04da50, ; 150: System.IdentityModel.Tokens.Jwt.dll => 136
	i64 u0x2afc1c4f898552ee, ; 151: lib_System.Formats.Asn1.dll.so => 135
	i64 u0x2b148910ed40fbf9, ; 152: zh-Hant/Microsoft.Maui.Controls.resources.dll => 46
	i64 u0x2c8bd14bb93a7d82, ; 153: lib-pl-Microsoft.Maui.Controls.resources.dll.so => 33
	i64 u0x2cbd9262ca785540, ; 154: lib_System.Text.Encoding.CodePages.dll.so => 252
	i64 u0x2cc9e1fed6257257, ; 155: lib_System.Reflection.Emit.Lightweight.dll.so => 232
	i64 u0x2cd723e9fe623c7c, ; 156: lib_System.Private.Xml.Linq.dll.so => 229
	i64 u0x2ce66f4c8733e883, ; 157: pt-BR/Microsoft.Data.SqlClient.resources.dll => 8
	i64 u0x2d169d318a968379, ; 158: System.Threading.dll => 261
	i64 u0x2d47774b7d993f59, ; 159: sv/Microsoft.Maui.Controls.resources.dll => 39
	i64 u0x2db915caf23548d2, ; 160: System.Text.Json.dll => 140
	i64 u0x2e6f1f226821322a, ; 161: el/Microsoft.Maui.Controls.resources.dll => 18
	i64 u0x2ece398cbf74c03b, ; 162: lib_EFCore.BulkExtensions.SqlServer.dll.so => 67
	i64 u0x2f02f94df3200fe5, ; 163: System.Diagnostics.Process => 198
	i64 u0x2f2e98e1c89b1aff, ; 164: System.Xml.ReaderWriter => 265
	i64 u0x2f40b2521deba305, ; 165: lib_Microsoft.SqlServer.Server.dll.so => 108
	i64 u0x2f5911d9ba814e4e, ; 166: System.Diagnostics.Tracing => 202
	i64 u0x2feb4d2fcda05cfd, ; 167: Microsoft.Extensions.Caching.Abstractions.dll => 83
	i64 u0x309ee9eeec09a71e, ; 168: lib_Xamarin.AndroidX.Fragment.dll.so => 157
	i64 u0x309f2bedefa9a318, ; 169: Microsoft.IdentityModel.Abstractions => 96
	i64 u0x30ef53e00b9230df, ; 170: NetTopologySuite.IO.SpatiaLite => 111
	i64 u0x31195fef5d8fb552, ; 171: _Microsoft.Android.Resource.Designer.dll => 57
	i64 u0x32243413e774362a, ; 172: Xamarin.AndroidX.CardView.dll => 150
	i64 u0x323062994a141225, ; 173: lib-zh-Hans-Microsoft.SqlServer.Types.resources.dll.so => 55
	i64 u0x3235427f8d12dae1, ; 174: lib_System.Drawing.Primitives.dll.so => 203
	i64 u0x329753a17a517811, ; 175: fr/Microsoft.Maui.Controls.resources => 21
	i64 u0x32aa989ff07a84ff, ; 176: lib_System.Xml.ReaderWriter.dll.so => 265
	i64 u0x33829542f112d59b, ; 177: System.Collections.Immutable => 186
	i64 u0x33a31443733849fe, ; 178: lib-es-Microsoft.Maui.Controls.resources.dll.so => 19
	i64 u0x341abc357fbb4ebf, ; 179: lib_System.Net.Sockets.dll.so => 222
	i64 u0x348d598f4054415e, ; 180: Microsoft.SqlServer.Server => 108
	i64 u0x34b2bc8bc64a1107, ; 181: System.Diagnostics.PerformanceCounter.dll => 133
	i64 u0x34c492cef793bb77, ; 182: lib_InputKit.Maui.dll.so => 71
	i64 u0x34dfd74fe2afcf37, ; 183: Microsoft.Maui => 105
	i64 u0x34e292762d9615df, ; 184: cs/Microsoft.Maui.Controls.resources.dll => 15
	i64 u0x3508234247f48404, ; 185: Microsoft.Maui.Controls => 103
	i64 u0x353590da528c9d22, ; 186: System.ComponentModel.Annotations => 190
	i64 u0x3549870798b4cd30, ; 187: lib_Xamarin.AndroidX.ViewPager2.dll.so => 172
	i64 u0x355282fc1c909694, ; 188: Microsoft.Extensions.Configuration => 85
	i64 u0x360a66b9f4afb47e, ; 189: ShimSkiaSharp => 119
	i64 u0x36263608556d5d42, ; 190: Npgsql.dll => 114
	i64 u0x36b2b50fdf589ae2, ; 191: System.Reflection.Emit.Lightweight => 232
	i64 u0x36cada77dc79928b, ; 192: System.IO.MemoryMappedFiles => 209
	i64 u0x36d2129305806e75, ; 193: UraniumUI => 141
	i64 u0x37410855534260db, ; 194: fr/Microsoft.SqlServer.Types.resources.dll => 49
	i64 u0x374ef46b06791af6, ; 195: System.Reflection.Primitives.dll => 234
	i64 u0x380134e03b1e160a, ; 196: System.Collections.Immutable.dll => 186
	i64 u0x382453cb85fe3f82, ; 197: lib_EFCore.BulkExtensions.Sqlite.dll.so => 66
	i64 u0x385c17636bb6fe6e, ; 198: Xamarin.AndroidX.CustomView.dll => 155
	i64 u0x38869c811d74050e, ; 199: System.Net.NameResolution.dll => 217
	i64 u0x38e93ec1c057cdf6, ; 200: Microsoft.IdentityModel.Protocols => 99
	i64 u0x39251dccb84bdcaa, ; 201: lib_System.Configuration.ConfigurationManager.dll.so => 130
	i64 u0x393c226616977fdb, ; 202: lib_Xamarin.AndroidX.ViewPager.dll.so => 171
	i64 u0x395e37c3334cf82a, ; 203: lib-ca-Microsoft.Maui.Controls.resources.dll.so => 14
	i64 u0x39aa39fda111d9d3, ; 204: Newtonsoft.Json => 113
	i64 u0x39d48361041cb258, ; 205: store.dll => 181
	i64 u0x3ab5859054645f72, ; 206: System.Security.Cryptography.Primitives.dll => 248
	i64 u0x3b860f9932505633, ; 207: lib_System.Text.Encoding.Extensions.dll.so => 253
	i64 u0x3bea9ebe8c027c01, ; 208: lib_Microsoft.IdentityModel.Tokens.dll.so => 101
	i64 u0x3c3aafb6b3a00bf6, ; 209: lib_System.Security.Cryptography.X509Certificates.dll.so => 249
	i64 u0x3c5f19e4acdcebd8, ; 210: lib_Microsoft.Data.SqlClient.dll.so => 74
	i64 u0x3c7c495f58ac5ee9, ; 211: Xamarin.Kotlin.StdLib => 175
	i64 u0x3cd9d281d402eb9b, ; 212: Xamarin.AndroidX.Browser.dll => 146
	i64 u0x3ced6a4f3010aa96, ; 213: ZXing.Net.MAUI.Controls => 180
	i64 u0x3d196e782ed8c01a, ; 214: System.Data.SqlClient => 131
	i64 u0x3d1c50cc001a991e, ; 215: Xamarin.Google.Guava.ListenableFuture.dll => 174
	i64 u0x3d2b1913edfc08d7, ; 216: lib_System.Threading.ThreadPool.dll.so => 260
	i64 u0x3d46f0b995082740, ; 217: System.Xml.Linq => 264
	i64 u0x3d9c2a242b040a50, ; 218: lib_Xamarin.AndroidX.Core.dll.so => 153
	i64 u0x3da7781d6333a8fe, ; 219: SQLitePCLRaw.batteries_v2 => 122
	i64 u0x3e0b360b2840f096, ; 220: it/Microsoft.Data.SqlClient.resources => 4
	i64 u0x3f3c8f45ab6f28c7, ; 221: Microsoft.Identity.Client.Extensions.Msal.dll => 95
	i64 u0x3f510adf788828dd, ; 222: System.Threading.Tasks.Extensions => 257
	i64 u0x407a10bb4bf95829, ; 223: lib_Xamarin.AndroidX.Navigation.Common.dll.so => 164
	i64 u0x407a8d1779c33f16, ; 224: System.Diagnostics.PerformanceCounter => 133
	i64 u0x407ac43dee26bd5a, ; 225: lib_Azure.Identity.dll.so => 59
	i64 u0x4104d92598b18888, ; 226: NetTopologySuite => 110
	i64 u0x415e36f6b13ff6f3, ; 227: System.Configuration.ConfigurationManager.dll => 130
	i64 u0x41cab042be111c34, ; 228: lib_Xamarin.AndroidX.AppCompat.AppCompatResources.dll.so => 145
	i64 u0x43375950ec7c1b6a, ; 229: netstandard.dll => 269
	i64 u0x434c4e1d9284cdae, ; 230: Mono.Android.dll => 273
	i64 u0x4394150249e83099, ; 231: lib_store.dll.so => 181
	i64 u0x43950f84de7cc79a, ; 232: pl/Microsoft.Maui.Controls.resources.dll => 33
	i64 u0x4396b4cdb6b3bafc, ; 233: lib-ru-Microsoft.SqlServer.Types.resources.dll.so => 54
	i64 u0x448bd33429269b19, ; 234: Microsoft.CSharp => 182
	i64 u0x4499fa3c8e494654, ; 235: lib_System.Runtime.Serialization.Primitives.dll.so => 241
	i64 u0x4515080865a951a5, ; 236: Xamarin.Kotlin.StdLib.dll => 175
	i64 u0x453c1277f85cf368, ; 237: lib_Microsoft.EntityFrameworkCore.Abstractions.dll.so => 77
	i64 u0x458d2df79ac57c1d, ; 238: lib_System.IdentityModel.Tokens.Jwt.dll.so => 136
	i64 u0x45aceb3561dbf4e7, ; 239: Svg.Custom => 126
	i64 u0x45c40276a42e283e, ; 240: System.Diagnostics.TraceSource => 201
	i64 u0x45d124f3a617a7d2, ; 241: lib_Svg.Custom.dll.so => 126
	i64 u0x45fcc9fd66f25095, ; 242: Microsoft.Extensions.DependencyModel => 89
	i64 u0x46a4213bc97fe5ae, ; 243: lib-ru-Microsoft.Maui.Controls.resources.dll.so => 37
	i64 u0x47358bd471172e1d, ; 244: lib_System.Xml.Linq.dll.so => 264
	i64 u0x4787a936949fcac2, ; 245: System.Memory.Data.dll => 137
	i64 u0x47daf4e1afbada10, ; 246: pt/Microsoft.Maui.Controls.resources => 35
	i64 u0x480c0a47dd42dd81, ; 247: lib_System.IO.MemoryMappedFiles.dll.so => 209
	i64 u0x49e952f19a4e2022, ; 248: System.ObjectModel => 226
	i64 u0x4a5667b2462a664b, ; 249: lib_Xamarin.AndroidX.Navigation.UI.dll.so => 167
	i64 u0x4b576d47ac054f3c, ; 250: System.IO.FileSystem.AccessControl => 207
	i64 u0x4b7b6532ded934b7, ; 251: System.Text.Json => 140
	i64 u0x4b8f8ea3c2df6bb0, ; 252: System.ClientModel => 129
	i64 u0x4ca014ceac582c86, ; 253: Microsoft.EntityFrameworkCore.Relational.dll => 78
	i64 u0x4cc5f15266470798, ; 254: lib_Xamarin.AndroidX.Loader.dll.so => 163
	i64 u0x4cf6f67dc77aacd2, ; 255: System.Net.NetworkInformation.dll => 218
	i64 u0x4d447523346ce7e7, ; 256: lib_Svg.Skia.dll.so => 128
	i64 u0x4d479f968a05e504, ; 257: System.Linq.Expressions.dll => 212
	i64 u0x4d55a010ffc4faff, ; 258: System.Private.Xml => 230
	i64 u0x4d6001db23f8cd87, ; 259: lib_System.ClientModel.dll.so => 129
	i64 u0x4d91e5c949c8f5e5, ; 260: InputKit.Maui.dll => 71
	i64 u0x4d95fccc1f67c7ca, ; 261: System.Runtime.Loader.dll => 237
	i64 u0x4da4a8f0f6a70fdc, ; 262: Microsoft.Maui.Controls.Compatibility.dll => 102
	i64 u0x4dcf44c3c9b076a2, ; 263: it/Microsoft.Maui.Controls.resources.dll => 27
	i64 u0x4dd9247f1d2c3235, ; 264: Xamarin.AndroidX.Loader.dll => 163
	i64 u0x4e32f00cb0937401, ; 265: Mono.Android.Runtime => 272
	i64 u0x4e5eea4668ac2b18, ; 266: System.Text.Encoding.CodePages => 252
	i64 u0x4ebd0c4b82c5eefc, ; 267: lib_System.Threading.Channels.dll.so => 256
	i64 u0x4f21ee6ef9eb527e, ; 268: ca/Microsoft.Maui.Controls.resources => 14
	i64 u0x4f27ca9d6e02176c, ; 269: cs/Microsoft.Data.SqlClient.resources => 0
	i64 u0x4f3ba6ee468f1365, ; 270: es/Microsoft.SqlServer.Types.resources.dll => 48
	i64 u0x4fd5f3ee53d0a4f0, ; 271: SQLitePCLRaw.lib.e_sqlite3.android => 124
	i64 u0x4ffd65baff757598, ; 272: Microsoft.IdentityModel.Tokens => 101
	i64 u0x50320f2a19424f3f, ; 273: lib-it-Microsoft.Data.SqlClient.resources.dll.so => 4
	i64 u0x5037f0be3c28c7a3, ; 274: lib_Microsoft.Maui.Controls.dll.so => 103
	i64 u0x505aa0ca2d672b22, ; 275: Microsoft.EntityFrameworkCore.SqlServer.HierarchyId => 82
	i64 u0x5112ed116d87baf8, ; 276: CommunityToolkit.Mvvm => 62
	i64 u0x5131bbe80989093f, ; 277: Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll => 161
	i64 u0x5146d4e23aed3198, ; 278: ja/Microsoft.Data.SqlClient.resources => 5
	i64 u0x51bb8a2afe774e32, ; 279: System.Drawing => 204
	i64 u0x526ce79eb8e90527, ; 280: lib_System.Net.Primitives.dll.so => 219
	i64 u0x52829f00b4467c38, ; 281: lib_System.Data.Common.dll.so => 195
	i64 u0x5290402954d7bce0, ; 282: zh-Hans/Microsoft.Data.SqlClient.resources => 11
	i64 u0x529ffe06f39ab8db, ; 283: Xamarin.AndroidX.Core => 153
	i64 u0x52ff996554dbf352, ; 284: Microsoft.Maui.Graphics => 107
	i64 u0x53128e94caa50e17, ; 285: Oracle.ManagedDataAccess => 117
	i64 u0x535f7e40e8fef8af, ; 286: lib-sk-Microsoft.Maui.Controls.resources.dll.so => 38
	i64 u0x53a96d5c86c9e194, ; 287: System.Net.NetworkInformation => 218
	i64 u0x53be1038a61e8d44, ; 288: System.Runtime.InteropServices.RuntimeInformation.dll => 235
	i64 u0x53c3014b9437e684, ; 289: lib-zh-HK-Microsoft.Maui.Controls.resources.dll.so => 44
	i64 u0x5435e6f049e9bc37, ; 290: System.Security.Claims.dll => 245
	i64 u0x54795225dd1587af, ; 291: lib_System.Runtime.dll.so => 243
	i64 u0x547a34f14e5f6210, ; 292: Xamarin.AndroidX.Lifecycle.Common.dll => 158
	i64 u0x556e8b63b660ab8b, ; 293: Xamarin.AndroidX.Lifecycle.Common.Jvm.dll => 159
	i64 u0x5588627c9a108ec9, ; 294: System.Collections.Specialized => 188
	i64 u0x56442b99bc64bb47, ; 295: System.Runtime.Serialization.Xml.dll => 242
	i64 u0x571c5cfbec5ae8e2, ; 296: System.Private.Uri => 228
	i64 u0x578cd35c91d7b347, ; 297: lib_SQLitePCLRaw.core.dll.so => 123
	i64 u0x579a06fed6eec900, ; 298: System.Private.CoreLib.dll => 270
	i64 u0x57c542c14049b66d, ; 299: System.Diagnostics.DiagnosticSource => 196
	i64 u0x58601b2dda4a27b9, ; 300: lib-ja-Microsoft.Maui.Controls.resources.dll.so => 28
	i64 u0x58688d9af496b168, ; 301: Microsoft.Extensions.DependencyInjection.dll => 87
	i64 u0x595a356d23e8da9a, ; 302: lib_Microsoft.CSharp.dll.so => 182
	i64 u0x5a70033ca9d003cb, ; 303: lib_System.Memory.Data.dll.so => 137
	i64 u0x5a89a886ae30258d, ; 304: lib_Xamarin.AndroidX.CoordinatorLayout.dll.so => 152
	i64 u0x5a8f6699f4a1caa9, ; 305: lib_System.Threading.dll.so => 261
	i64 u0x5ae9cd33b15841bf, ; 306: System.ComponentModel => 193
	i64 u0x5b1cb319d4710457, ; 307: lib_FFImageLoading.Maui.dll.so => 69
	i64 u0x5b54391bdc6fcfe6, ; 308: System.Private.DataContractSerialization => 227
	i64 u0x5b5f0e240a06a2a2, ; 309: da/Microsoft.Maui.Controls.resources.dll => 16
	i64 u0x5bf46208bead7b18, ; 310: ShimSkiaSharp.dll => 119
	i64 u0x5bf46332cc09e9b2, ; 311: lib_System.Data.SqlClient.dll.so => 131
	i64 u0x5c393624b8176517, ; 312: lib_Microsoft.Extensions.Logging.dll.so => 90
	i64 u0x5c53c29f5073b0c9, ; 313: System.Diagnostics.FileVersionInfo => 197
	i64 u0x5ce309995937d5a0, ; 314: pt-BR/Microsoft.SqlServer.Types.resources.dll => 53
	i64 u0x5d0a4a29b02d9d3c, ; 315: System.Net.WebHeaderCollection.dll => 224
	i64 u0x5d1b514fc45c92d4, ; 316: ZXing.Net.MAUI => 179
	i64 u0x5d33da2f84c1de97, ; 317: lib-pt-BR-Microsoft.Data.SqlClient.resources.dll.so => 8
	i64 u0x5d7960d446a1890e, ; 318: lib-pl-Microsoft.Data.SqlClient.resources.dll.so => 7
	i64 u0x5d7ec76c1c703055, ; 319: System.Threading.Tasks.Parallel => 258
	i64 u0x5db0cbbd1028510e, ; 320: lib_System.Runtime.InteropServices.dll.so => 236
	i64 u0x5db30905d3e5013b, ; 321: Xamarin.AndroidX.Collection.Jvm.dll => 151
	i64 u0x5e467bc8f09ad026, ; 322: System.Collections.Specialized.dll => 188
	i64 u0x5ea92fdb19ec8c4c, ; 323: System.Text.Encodings.Web.dll => 254
	i64 u0x5eb8046dd40e9ac3, ; 324: System.ComponentModel.Primitives => 191
	i64 u0x5f0980ab8131b542, ; 325: EFCore.BulkExtensions.Sqlite => 66
	i64 u0x5f36ccf5c6a57e24, ; 326: System.Xml.ReaderWriter.dll => 265
	i64 u0x5f3bce5c22261fd2, ; 327: ExCSS.dll => 68
	i64 u0x5f4294b9b63cb842, ; 328: System.Data.Common => 195
	i64 u0x5f5be00b819666f1, ; 329: ru/Microsoft.SqlServer.Types.resources => 54
	i64 u0x5f7399e166075632, ; 330: lib_SQLitePCLRaw.lib.e_sqlite3.android.dll.so => 124
	i64 u0x5f9a2d823f664957, ; 331: lib-el-Microsoft.Maui.Controls.resources.dll.so => 18
	i64 u0x609f4b7b63d802d4, ; 332: lib_Microsoft.Extensions.DependencyInjection.dll.so => 87
	i64 u0x60cd4e33d7e60134, ; 333: Xamarin.KotlinX.Coroutines.Core.Jvm => 176
	i64 u0x60f62d786afcf130, ; 334: System.Memory => 215
	i64 u0x61be8d1299194243, ; 335: Microsoft.Maui.Controls.Xaml => 104
	i64 u0x61d2cba29557038f, ; 336: de/Microsoft.Maui.Controls.resources => 17
	i64 u0x61d88f399afb2f45, ; 337: lib_System.Runtime.Loader.dll.so => 237
	i64 u0x6219beeff33faa04, ; 338: cs/Microsoft.Data.SqlClient.resources.dll => 0
	i64 u0x622eef6f9e59068d, ; 339: System.Private.CoreLib => 270
	i64 u0x625def565caafc1c, ; 340: tr/Microsoft.Data.SqlClient.resources.dll => 10
	i64 u0x63f1f6883c1e23c2, ; 341: lib_System.Collections.Immutable.dll.so => 186
	i64 u0x6400f68068c1e9f1, ; 342: Xamarin.Google.Android.Material.dll => 173
	i64 u0x640e3b14dbd325c2, ; 343: System.Security.Cryptography.Algorithms.dll => 246
	i64 u0x641bebf7cee18d1c, ; 344: Microsoft.EntityFrameworkCore.SqlServer.Abstractions.dll => 81
	i64 u0x658f524e4aba7dad, ; 345: CommunityToolkit.Maui.dll => 60
	i64 u0x65ecac39144dd3cc, ; 346: Microsoft.Maui.Controls.dll => 103
	i64 u0x65ece51227bfa724, ; 347: lib_System.Runtime.Numerics.dll.so => 238
	i64 u0x6692e924eade1b29, ; 348: lib_System.Console.dll.so => 194
	i64 u0x66a4e5c6a3fb0bae, ; 349: lib_Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll.so => 161
	i64 u0x66d13304ce1a3efa, ; 350: Xamarin.AndroidX.CursorAdapter => 154
	i64 u0x677569b965946273, ; 351: ko/Microsoft.SqlServer.Types.resources.dll => 52
	i64 u0x67c0d6eb5a84aa5a, ; 352: lib_System.Diagnostics.PerformanceCounter.dll.so => 133
	i64 u0x68558ec653afa616, ; 353: lib-da-Microsoft.Maui.Controls.resources.dll.so => 16
	i64 u0x6872ec7a2e36b1ac, ; 354: System.Drawing.Primitives.dll => 203
	i64 u0x68fbbbe2eb455198, ; 355: System.Formats.Asn1 => 135
	i64 u0x69063fc0ba8e6bdd, ; 356: he/Microsoft.Maui.Controls.resources.dll => 22
	i64 u0x699dffb2427a2d71, ; 357: SQLitePCLRaw.lib.e_sqlite3.android.dll => 124
	i64 u0x6a4d7577b2317255, ; 358: System.Runtime.InteropServices.dll => 236
	i64 u0x6ace3b74b15ee4a4, ; 359: nb/Microsoft.Maui.Controls.resources => 31
	i64 u0x6c7d5f4d06aadeaa, ; 360: EFCore.BulkExtensions.SqlServer.dll => 67
	i64 u0x6cd97f370311a542, ; 361: Microsoft.EntityFrameworkCore.SqlServer => 80
	i64 u0x6d0a12b2adba20d8, ; 362: System.Security.Cryptography.ProtectedData.dll => 139
	i64 u0x6d12bfaa99c72b1f, ; 363: lib_Microsoft.Maui.Graphics.dll.so => 107
	i64 u0x6d3b7628f8253e93, ; 364: pl/Microsoft.Data.SqlClient.resources => 7
	i64 u0x6d79993361e10ef2, ; 365: Microsoft.Extensions.Primitives => 93
	i64 u0x6d86d56b84c8eb71, ; 366: lib_Xamarin.AndroidX.CursorAdapter.dll.so => 154
	i64 u0x6d9bea6b3e895cf7, ; 367: Microsoft.Extensions.Primitives.dll => 93
	i64 u0x6e25a02c3833319a, ; 368: lib_Xamarin.AndroidX.Navigation.Fragment.dll.so => 165
	i64 u0x6fd2265da78b93a4, ; 369: lib_Microsoft.Maui.dll.so => 105
	i64 u0x6fdfc7de82c33008, ; 370: cs/Microsoft.Maui.Controls.resources => 15
	i64 u0x6ffc4967cc47ba57, ; 371: System.IO.FileSystem.Watcher.dll => 208
	i64 u0x706442eb8d0ca9f8, ; 372: Plainer.Maui.dll => 118
	i64 u0x70e99f48c05cb921, ; 373: tr/Microsoft.Maui.Controls.resources.dll => 41
	i64 u0x70fd3deda22442d2, ; 374: lib-nb-Microsoft.Maui.Controls.resources.dll.so => 31
	i64 u0x71a495ea3761dde8, ; 375: lib-it-Microsoft.Maui.Controls.resources.dll.so => 27
	i64 u0x71ad672adbe48f35, ; 376: System.ComponentModel.Primitives.dll => 191
	i64 u0x71bc142d620e986a, ; 377: lib_System.Security.Cryptography.Pkcs.dll.so => 138
	i64 u0x725f5a9e82a45c81, ; 378: System.Security.Cryptography.Encoding => 247
	i64 u0x72b1fb4109e08d7b, ; 379: lib-hr-Microsoft.Maui.Controls.resources.dll.so => 24
	i64 u0x73a22de3db7e3506, ; 380: lib-ko-Microsoft.SqlServer.Types.resources.dll.so => 52
	i64 u0x73e4ce94e2eb6ffc, ; 381: lib_System.Memory.dll.so => 215
	i64 u0x73f2645914262879, ; 382: lib_Microsoft.EntityFrameworkCore.Sqlite.dll.so => 79
	i64 u0x74770d0c84d62bee, ; 383: EFCore.BulkExtensions.SqlServer => 67
	i64 u0x74d88540363e57e3, ; 384: MedallionTopologicalSort => 72
	i64 u0x755a91767330b3d4, ; 385: lib_Microsoft.Extensions.Configuration.dll.so => 85
	i64 u0x76012e7334db86e5, ; 386: lib_Xamarin.AndroidX.SavedState.dll.so => 169
	i64 u0x76ca07b878f44da0, ; 387: System.Runtime.Numerics.dll => 238
	i64 u0x770e0cc2309fe21d, ; 388: lib-pt-BR-Microsoft.SqlServer.Types.resources.dll.so => 53
	i64 u0x780bc73597a503a9, ; 389: lib-ms-Microsoft.Maui.Controls.resources.dll.so => 30
	i64 u0x783606d1e53e7a1a, ; 390: th/Microsoft.Maui.Controls.resources.dll => 40
	i64 u0x78a45e51311409b6, ; 391: Xamarin.AndroidX.Fragment.dll => 157
	i64 u0x79eb916f2d11e1f0, ; 392: zh-Hans/Microsoft.Data.SqlClient.resources.dll => 11
	i64 u0x7adb8da2ac89b647, ; 393: fi/Microsoft.Maui.Controls.resources.dll => 20
	i64 u0x7b150145c0a9058c, ; 394: Microsoft.Data.Sqlite => 75
	i64 u0x7b4927e421291c41, ; 395: Microsoft.IdentityModel.JsonWebTokens.dll => 97
	i64 u0x7bef86a4335c4870, ; 396: System.ComponentModel.TypeConverter => 192
	i64 u0x7c0820144cd34d6a, ; 397: sk/Microsoft.Maui.Controls.resources.dll => 38
	i64 u0x7c2a0bd1e0f988fc, ; 398: lib-de-Microsoft.Maui.Controls.resources.dll.so => 17
	i64 u0x7c41d387501568ba, ; 399: System.Net.WebClient.dll => 223
	i64 u0x7cc637f941f716d0, ; 400: CommunityToolkit.Maui.Core => 61
	i64 u0x7d649b75d580bb42, ; 401: ms/Microsoft.Maui.Controls.resources.dll => 30
	i64 u0x7d8ee2bdc8e3aad1, ; 402: System.Numerics.Vectors => 225
	i64 u0x7dfc3d6d9d8d7b70, ; 403: System.Collections => 189
	i64 u0x7e034293328f139a, ; 404: EFCore.BulkExtensions.PostgreSql => 65
	i64 u0x7e2e564fa2f76c65, ; 405: lib_System.Diagnostics.Tracing.dll.so => 202
	i64 u0x7e302e110e1e1346, ; 406: lib_System.Security.Claims.dll.so => 245
	i64 u0x7e946809d6008ef2, ; 407: lib_System.ObjectModel.dll.so => 226
	i64 u0x7ecc13347c8fd849, ; 408: lib_System.ComponentModel.dll.so => 193
	i64 u0x7f00ddd9b9ca5a13, ; 409: Xamarin.AndroidX.ViewPager.dll => 171
	i64 u0x7f9351cd44b1273f, ; 410: Microsoft.Extensions.Configuration.Abstractions => 86
	i64 u0x7fae0ef4dc4770fe, ; 411: Microsoft.Identity.Client => 94
	i64 u0x7fbd557c99b3ce6f, ; 412: lib_Xamarin.AndroidX.Lifecycle.LiveData.Core.dll.so => 160
	i64 u0x80da183a87731838, ; 413: System.Reflection.Metadata => 233
	i64 u0x80fa55b6d1b0be99, ; 414: SQLitePCLRaw.provider.e_sqlite3 => 125
	i64 u0x812c069d5cdecc17, ; 415: System.dll => 268
	i64 u0x81ab745f6c0f5ce6, ; 416: zh-Hant/Microsoft.Maui.Controls.resources => 46
	i64 u0x8277f2be6b5ce05f, ; 417: Xamarin.AndroidX.AppCompat => 144
	i64 u0x828f06563b30bc50, ; 418: lib_Xamarin.AndroidX.CardView.dll.so => 150
	i64 u0x82df8f5532a10c59, ; 419: lib_System.Drawing.dll.so => 204
	i64 u0x82f6403342e12049, ; 420: uk/Microsoft.Maui.Controls.resources => 42
	i64 u0x83a7afd2c49adc86, ; 421: lib_Microsoft.IdentityModel.Abstractions.dll.so => 96
	i64 u0x83c14ba66c8e2b8c, ; 422: zh-Hans/Microsoft.Maui.Controls.resources => 45
	i64 u0x844ac8f64fd78edc, ; 423: Xamarin.AndroidX.Camera.View.dll => 149
	i64 u0x846ce984efea52c7, ; 424: System.Threading.Tasks.Parallel.dll => 258
	i64 u0x84ae73148a4557d2, ; 425: lib_System.IO.Pipes.dll.so => 211
	i64 u0x84b01102c12a9232, ; 426: System.Runtime.Serialization.Json.dll => 240
	i64 u0x84bc82b42469a609, ; 427: Oracle.EntityFrameworkCore => 116
	i64 u0x84cd5cdec0f54bcc, ; 428: lib_Microsoft.EntityFrameworkCore.Relational.dll.so => 78
	i64 u0x84f9060cc4a93c8f, ; 429: lib_SkiaSharp.dll.so => 120
	i64 u0x8528b82bdbc15371, ; 430: ko/Microsoft.Data.SqlClient.resources => 6
	i64 u0x8533cf0079a66e49, ; 431: lib_Oracle.EntityFrameworkCore.dll.so => 116
	i64 u0x8690556019b686eb, ; 432: Svg.Custom.dll => 126
	i64 u0x86a909228dc7657b, ; 433: lib-zh-Hant-Microsoft.Maui.Controls.resources.dll.so => 46
	i64 u0x86b3e00c36b84509, ; 434: Microsoft.Extensions.Configuration.dll => 85
	i64 u0x86b5381885cbbb52, ; 435: lib_Svg.Model.dll.so => 127
	i64 u0x86b62cb077ec4fd7, ; 436: System.Runtime.Serialization.Xml => 242
	i64 u0x87c4b8a492b176ad, ; 437: Microsoft.EntityFrameworkCore.Abstractions => 77
	i64 u0x87c69b87d9283884, ; 438: lib_System.Threading.Thread.dll.so => 259
	i64 u0x87f6569b25707834, ; 439: System.IO.Compression.Brotli.dll => 205
	i64 u0x8808a9d7c53dc4c0, ; 440: lib_HarfBuzzSharp.dll.so => 70
	i64 u0x8842b3a5d2d3fb36, ; 441: Microsoft.Maui.Essentials => 106
	i64 u0x88bda98e0cffb7a9, ; 442: lib_Xamarin.KotlinX.Coroutines.Core.Jvm.dll.so => 176
	i64 u0x8930322c7bd8f768, ; 443: netstandard => 269
	i64 u0x894dbdd1ac38f4e1, ; 444: Plainer.Maui => 118
	i64 u0x897a606c9e39c75f, ; 445: lib_System.ComponentModel.Primitives.dll.so => 191
	i64 u0x89c5188089ec2cd5, ; 446: lib_System.Runtime.InteropServices.RuntimeInformation.dll.so => 235
	i64 u0x8a399a706fcbce4b, ; 447: Microsoft.Extensions.Caching.Abstractions => 83
	i64 u0x8ad229ea26432ee2, ; 448: Xamarin.AndroidX.Loader => 163
	i64 u0x8b4ff5d0fdd5faa1, ; 449: lib_System.Diagnostics.DiagnosticSource.dll.so => 196
	i64 u0x8b541d476eb3774c, ; 450: System.Security.Principal.Windows => 251
	i64 u0x8b8d01333a96d0b5, ; 451: System.Diagnostics.Process.dll => 198
	i64 u0x8b9ceca7acae3451, ; 452: lib-he-Microsoft.Maui.Controls.resources.dll.so => 22
	i64 u0x8c156fe7f184f137, ; 453: tr/Microsoft.Data.SqlClient.resources => 10
	i64 u0x8c53ae18581b14f0, ; 454: Azure.Core => 58
	i64 u0x8cb6d28731d97279, ; 455: System.DirectoryServices.Protocols => 134
	i64 u0x8cdfdb4ce85fb925, ; 456: lib_System.Security.Principal.Windows.dll.so => 251
	i64 u0x8cf51f1eb9e90658, ; 457: lib_Microsoft.EntityFrameworkCore.SqlServer.dll.so => 80
	i64 u0x8d0f420977c2c1c7, ; 458: Xamarin.AndroidX.CursorAdapter.dll => 154
	i64 u0x8d2551476f2e2ef7, ; 459: lib_UraniumUI.Material.dll.so => 142
	i64 u0x8d52a25632e81824, ; 460: Microsoft.EntityFrameworkCore.Sqlite.dll => 79
	i64 u0x8d7b8ab4b3310ead, ; 461: System.Threading => 261
	i64 u0x8da188285aadfe8e, ; 462: System.Collections.Concurrent => 185
	i64 u0x8e7b0d6c6f6404e3, ; 463: fr/Microsoft.SqlServer.Types.resources => 49
	i64 u0x8e937db395a74375, ; 464: lib_Microsoft.Identity.Client.dll.so => 94
	i64 u0x8e9b88b113d62c7d, ; 465: zh-Hant/Microsoft.SqlServer.Types.resources => 56
	i64 u0x8ebba9258a550f92, ; 466: lib_Plainer.Maui.dll.so => 118
	i64 u0x8ec6e06a61c1baeb, ; 467: lib_Newtonsoft.Json.dll.so => 113
	i64 u0x8ed3cdd722b4d782, ; 468: System.Diagnostics.EventLog => 132
	i64 u0x8ed807bfe9858dfc, ; 469: Xamarin.AndroidX.Navigation.Common => 164
	i64 u0x8ee08b8194a30f48, ; 470: lib-hi-Microsoft.Maui.Controls.resources.dll.so => 23
	i64 u0x8ef7601039857a44, ; 471: lib-ro-Microsoft.Maui.Controls.resources.dll.so => 36
	i64 u0x8ef9414937d93a0a, ; 472: SQLitePCLRaw.core.dll => 123
	i64 u0x8f32c6f611f6ffab, ; 473: pt/Microsoft.Maui.Controls.resources.dll => 35
	i64 u0x8f8829d21c8985a4, ; 474: lib-pt-BR-Microsoft.Maui.Controls.resources.dll.so => 34
	i64 u0x8fd27d934d7b3a55, ; 475: SQLitePCLRaw.core => 123
	i64 u0x90263f8448b8f572, ; 476: lib_System.Diagnostics.TraceSource.dll.so => 201
	i64 u0x9027f725f74f5c08, ; 477: lib_NetTopologySuite.IO.SpatiaLite.dll.so => 111
	i64 u0x902d31dbd7d7d78e, ; 478: InputKit.Maui => 71
	i64 u0x903101b46fb73a04, ; 479: _Microsoft.Android.Resource.Designer => 57
	i64 u0x90393bd4865292f3, ; 480: lib_System.IO.Compression.dll.so => 206
	i64 u0x905e2b8e7ae91ae6, ; 481: System.Threading.Tasks.Extensions.dll => 257
	i64 u0x90634f86c5ebe2b5, ; 482: Xamarin.AndroidX.Lifecycle.ViewModel.Android => 161
	i64 u0x907b636704ad79ef, ; 483: lib_Microsoft.Maui.Controls.Xaml.dll.so => 104
	i64 u0x91418dc638b29e68, ; 484: lib_Xamarin.AndroidX.CustomView.dll.so => 155
	i64 u0x9157bd523cd7ed36, ; 485: lib_System.Text.Json.dll.so => 140
	i64 u0x91a74f07b30d37e2, ; 486: System.Linq.dll => 214
	i64 u0x91fa41a87223399f, ; 487: ca/Microsoft.Maui.Controls.resources.dll => 14
	i64 u0x93489853b6098685, ; 488: es/Microsoft.Data.SqlClient.resources.dll => 2
	i64 u0x937d210d0d24c5b0, ; 489: FFImageLoading.Maui.dll => 69
	i64 u0x9388aad9b7ae40ce, ; 490: lib_Xamarin.AndroidX.Lifecycle.Common.dll.so => 158
	i64 u0x93cfa73ab28d6e35, ; 491: ms/Microsoft.Maui.Controls.resources => 30
	i64 u0x944077d8ca3c6580, ; 492: System.IO.Compression.dll => 206
	i64 u0x948d746a7702861f, ; 493: Microsoft.IdentityModel.Logging.dll => 98
	i64 u0x9502fd818eed2359, ; 494: lib_Microsoft.IdentityModel.Protocols.OpenIdConnect.dll.so => 100
	i64 u0x9564283c37ed59a9, ; 495: lib_Microsoft.IdentityModel.Logging.dll.so => 98
	i64 u0x95d757769563d0d3, ; 496: Xamarin.AndroidX.Camera.Lifecycle.dll => 148
	i64 u0x965d480cfb8de46d, ; 497: pl/Microsoft.Data.SqlClient.resources.dll => 7
	i64 u0x967fc325e09bfa8c, ; 498: es/Microsoft.Maui.Controls.resources => 19
	i64 u0x96e49b31fe33d427, ; 499: Microsoft.Identity.Client.Extensions.Msal => 95
	i64 u0x9732d8dbddea3d9a, ; 500: id/Microsoft.Maui.Controls.resources => 26
	i64 u0x978be80e5210d31b, ; 501: Microsoft.Maui.Graphics.dll => 107
	i64 u0x97b8c771ea3e4220, ; 502: System.ComponentModel.dll => 193
	i64 u0x97e144c9d3c6976e, ; 503: System.Collections.Concurrent.dll => 185
	i64 u0x99052c1297204af4, ; 504: lib_Xamarin.AndroidX.Camera.Core.dll.so => 147
	i64 u0x991d510397f92d9d, ; 505: System.Linq.Expressions => 212
	i64 u0x993cc632e821c001, ; 506: Microsoft.Maui.Controls.Compatibility => 102
	i64 u0x999cb19e1a04ffd3, ; 507: CommunityToolkit.Mvvm.dll => 62
	i64 u0x99a00ca5270c6878, ; 508: Xamarin.AndroidX.Navigation.Runtime => 166
	i64 u0x99a8098eef99f8b4, ; 509: Oracle.ManagedDataAccess.dll => 117
	i64 u0x99cdc6d1f2d3a72f, ; 510: ko/Microsoft.Maui.Controls.resources.dll => 29
	i64 u0x9a0cc42c6f36dfc9, ; 511: lib_Microsoft.IdentityModel.Protocols.dll.so => 99
	i64 u0x9a8abd23ef81c977, ; 512: NetTopologySuite.dll => 110
	i64 u0x9acfd25e735d5594, ; 513: lib_Npgsql.dll.so => 114
	i64 u0x9ad5de27dc51bdf6, ; 514: FFImageLoading.Maui => 69
	i64 u0x9af128bb65641ae6, ; 515: NetTopologySuite.IO.SpatiaLite.dll => 111
	i64 u0x9b211a749105beac, ; 516: System.Transactions.Local => 262
	i64 u0x9c08d13c4e6dfa63, ; 517: Microsoft.EntityFrameworkCore.SqlServer.Abstractions => 81
	i64 u0x9c244ac7cda32d26, ; 518: System.Security.Cryptography.X509Certificates.dll => 249
	i64 u0x9cded46e202841cc, ; 519: NetTopologySuite.IO.SqlServerBytes.dll => 112
	i64 u0x9d5dbcf5a48583fe, ; 520: lib_Xamarin.AndroidX.Activity.dll.so => 143
	i64 u0x9d74dee1a7725f34, ; 521: Microsoft.Extensions.Configuration.Abstractions.dll => 86
	i64 u0x9da48bf5f6df6c80, ; 522: UraniumUI.dll => 141
	i64 u0x9e4534b6adaf6e84, ; 523: nl/Microsoft.Maui.Controls.resources => 32
	i64 u0x9eaf1efdf6f7267e, ; 524: Xamarin.AndroidX.Navigation.Common.dll => 164
	i64 u0x9ef542cf1f78c506, ; 525: Xamarin.AndroidX.Lifecycle.LiveData.Core => 160
	i64 u0x9fba0d4c57451526, ; 526: ko/Microsoft.SqlServer.Types.resources => 52
	i64 u0x9ff334e3cf272fd6, ; 527: lib_Xamarin.AndroidX.Camera.Lifecycle.dll.so => 148
	i64 u0x9ffbb6b1434ad2df, ; 528: Microsoft.Identity.Client.dll => 94
	i64 u0xa0d8259f4cc284ec, ; 529: lib_System.Security.Cryptography.dll.so => 250
	i64 u0xa13763df740e071e, ; 530: store => 181
	i64 u0xa1440773ee9d341e, ; 531: Xamarin.Google.Android.Material => 173
	i64 u0xa1b9d7c27f47219f, ; 532: Xamarin.AndroidX.Navigation.UI.dll => 167
	i64 u0xa1cfec8d4a8d7c32, ; 533: Npgsql.EntityFrameworkCore.PostgreSQL.dll => 115
	i64 u0xa2572680829d2c7c, ; 534: System.IO.Pipelines.dll => 210
	i64 u0xa375c81cb42e7ef8, ; 535: lib_Microsoft.EntityFrameworkCore.SqlServer.Abstractions.dll.so => 81
	i64 u0xa3c64c49e90a9987, ; 536: System.Security.Cryptography.Pkcs => 138
	i64 u0xa46aa1eaa214539b, ; 537: ko/Microsoft.Maui.Controls.resources => 29
	i64 u0xa4d20d2ff0563d26, ; 538: lib_CommunityToolkit.Mvvm.dll.so => 62
	i64 u0xa4edc8f2ceae241a, ; 539: System.Data.Common.dll => 195
	i64 u0xa526fadd66308051, ; 540: Microsoft.EntityFrameworkCore.SqlServer.dll => 80
	i64 u0xa5494f40f128ce6a, ; 541: System.Runtime.Serialization.Formatters.dll => 239
	i64 u0xa581c333c3c7cdb4, ; 542: ja/Microsoft.SqlServer.Types.resources => 51
	i64 u0xa5b7152421ed6d98, ; 543: lib_System.IO.FileSystem.Watcher.dll.so => 208
	i64 u0xa5b931bd164e087b, ; 544: Oracle.EntityFrameworkCore.dll => 116
	i64 u0xa5e599d1e0524750, ; 545: System.Numerics.Vectors.dll => 225
	i64 u0xa5f1ba49b85dd355, ; 546: System.Security.Cryptography.dll => 250
	i64 u0xa61975a5a37873ea, ; 547: lib_System.Xml.XmlSerializer.dll.so => 267
	i64 u0xa6645e3d03867094, ; 548: Svg.Skia => 128
	i64 u0xa67dbee13e1df9ca, ; 549: Xamarin.AndroidX.SavedState.dll => 169
	i64 u0xa68a420042bb9b1f, ; 550: Xamarin.AndroidX.DrawerLayout.dll => 156
	i64 u0xa71fe7d6f6f93efd, ; 551: Microsoft.Data.SqlClient => 74
	i64 u0xa763fbb98df8d9fb, ; 552: lib_Microsoft.Win32.Primitives.dll.so => 183
	i64 u0xa78ce3745383236a, ; 553: Xamarin.AndroidX.Lifecycle.Common.Jvm => 159
	i64 u0xa7c31b56b4dc7b33, ; 554: hu/Microsoft.Maui.Controls.resources => 25
	i64 u0xa87ff9cd1c5ac806, ; 555: lib_MedallionTopologicalSort.dll.so => 72
	i64 u0xa8e6320dd07580ef, ; 556: lib_Microsoft.IdentityModel.JsonWebTokens.dll.so => 97
	i64 u0xa964304b5631e28a, ; 557: CommunityToolkit.Maui.Core.dll => 61
	i64 u0xaa2219c8e3449ff5, ; 558: Microsoft.Extensions.Logging.Abstractions => 91
	i64 u0xaa443ac34067eeef, ; 559: System.Private.Xml.dll => 230
	i64 u0xaa52de307ef5d1dd, ; 560: System.Net.Http => 216
	i64 u0xaa9a7b0214a5cc5c, ; 561: System.Diagnostics.StackTrace.dll => 199
	i64 u0xaaaf86367285a918, ; 562: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 88
	i64 u0xaaf84bb3f052a265, ; 563: el/Microsoft.Maui.Controls.resources => 18
	i64 u0xab9c1b2687d86b0b, ; 564: lib_System.Linq.Expressions.dll.so => 212
	i64 u0xabc4d26016505655, ; 565: lib_Microsoft.SqlServer.Types.dll.so => 109
	i64 u0xac2af3fa195a15ce, ; 566: System.Runtime.Numerics => 238
	i64 u0xac5376a2a538dc10, ; 567: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 160
	i64 u0xac79c7e46047ad98, ; 568: System.Security.Principal.Windows.dll => 251
	i64 u0xac98d31068e24591, ; 569: System.Xml.XDocument => 266
	i64 u0xacd46e002c3ccb97, ; 570: ro/Microsoft.Maui.Controls.resources => 36
	i64 u0xacf42eea7ef9cd12, ; 571: System.Threading.Channels => 256
	i64 u0xad89c07347f1bad6, ; 572: nl/Microsoft.Maui.Controls.resources.dll => 32
	i64 u0xadbb53caf78a79d2, ; 573: System.Web.HttpUtility => 263
	i64 u0xadc90ab061a9e6e4, ; 574: System.ComponentModel.TypeConverter.dll => 192
	i64 u0xadf511667bef3595, ; 575: System.Net.Security => 221
	i64 u0xae282bcd03739de7, ; 576: Java.Interop => 271
	i64 u0xae53579c90db1107, ; 577: System.ObjectModel.dll => 226
	i64 u0xaf12fb8133ac3fbb, ; 578: Microsoft.EntityFrameworkCore.Sqlite => 79
	i64 u0xafe29f45095518e7, ; 579: lib_Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll.so => 162
	i64 u0xb05cc42cd94c6d9d, ; 580: lib-sv-Microsoft.Maui.Controls.resources.dll.so => 39
	i64 u0xb0bb43dc52ea59f9, ; 581: System.Diagnostics.Tracing.dll => 202
	i64 u0xb1dd05401aa8ee63, ; 582: System.Security.AccessControl => 244
	i64 u0xb220631954820169, ; 583: System.Text.RegularExpressions => 255
	i64 u0xb24e06ce97f7b2bf, ; 584: Svg.Model.dll => 127
	i64 u0xb2a3f67f3bf29fce, ; 585: da/Microsoft.Maui.Controls.resources => 16
	i64 u0xb2d3ad98fce223fd, ; 586: UraniumUI.Material => 142
	i64 u0xb398860d6ed7ba2f, ; 587: System.Security.Cryptography.ProtectedData => 139
	i64 u0xb3f0a0fcda8d3ebc, ; 588: Xamarin.AndroidX.CardView => 150
	i64 u0xb46be1aa6d4fff93, ; 589: hi/Microsoft.Maui.Controls.resources => 23
	i64 u0xb477491be13109d8, ; 590: ar/Microsoft.Maui.Controls.resources => 13
	i64 u0xb4bd7015ecee9d86, ; 591: System.IO.Pipelines => 210
	i64 u0xb4c53d9749c5f226, ; 592: lib_System.IO.FileSystem.AccessControl.dll.so => 207
	i64 u0xb4ff710863453fda, ; 593: System.Diagnostics.FileVersionInfo.dll => 197
	i64 u0xb5c7fcdafbc67ee4, ; 594: Microsoft.Extensions.Logging.Abstractions.dll => 91
	i64 u0xb5ea31d5244c6626, ; 595: System.Threading.ThreadPool.dll => 260
	i64 u0xb6ca291529a2056e, ; 596: MedallionTopologicalSort.dll => 72
	i64 u0xb7212c4683a94afe, ; 597: System.Drawing.Primitives => 203
	i64 u0xb7b7753d1f319409, ; 598: sv/Microsoft.Maui.Controls.resources => 39
	i64 u0xb81a2c6e0aee50fe, ; 599: lib_System.Private.CoreLib.dll.so => 270
	i64 u0xb9185c33a1643eed, ; 600: Microsoft.CSharp.dll => 182
	i64 u0xb9f64d3b230def68, ; 601: lib-pt-Microsoft.Maui.Controls.resources.dll.so => 35
	i64 u0xb9fc3c8a556e3691, ; 602: ja/Microsoft.Maui.Controls.resources => 28
	i64 u0xba4670aa94a2b3c6, ; 603: lib_System.Xml.XDocument.dll.so => 266
	i64 u0xba48785529705af9, ; 604: System.Collections.dll => 189
	i64 u0xbb65706fde942ce3, ; 605: System.Net.Sockets => 222
	i64 u0xbb6dc0b35452c1a0, ; 606: ZXing.Net.MAUI.dll => 179
	i64 u0xbb8c8d165ef11460, ; 607: lib_Microsoft.Identity.Client.Extensions.Msal.dll.so => 95
	i64 u0xbbd180354b67271a, ; 608: System.Runtime.Serialization.Formatters => 239
	i64 u0xbc22a245dab70cb4, ; 609: lib_SQLitePCLRaw.provider.e_sqlite3.dll.so => 125
	i64 u0xbcd22b365b764643, ; 610: lib-zh-Hans-Microsoft.Data.SqlClient.resources.dll.so => 11
	i64 u0xbcef2cc19d49603f, ; 611: EFCore.BulkExtensions.PostgreSql.dll => 65
	i64 u0xbd0aaf9dbfcc3376, ; 612: fr/Microsoft.Data.SqlClient.resources.dll => 3
	i64 u0xbd0e2c0d55246576, ; 613: System.Net.Http.dll => 216
	i64 u0xbd3c2d7a8325e11b, ; 614: lib-fr-Microsoft.Data.SqlClient.resources.dll.so => 3
	i64 u0xbd437a2cdb333d0d, ; 615: Xamarin.AndroidX.ViewPager2 => 172
	i64 u0xbd4aef17dbfb0390, ; 616: ru/Microsoft.Data.SqlClient.resources => 9
	i64 u0xbd5d0b88d3d647a5, ; 617: lib_Xamarin.AndroidX.Browser.dll.so => 146
	i64 u0xbe08e3083025c53d, ; 618: ZXing.Net.MAUI.Controls.dll => 180
	i64 u0xbe532a80075c3dc8, ; 619: Xamarin.AndroidX.Camera.Core.dll => 147
	i64 u0xbe65a49036345cf4, ; 620: lib_System.Buffers.dll.so => 184
	i64 u0xbee38d4a88835966, ; 621: Xamarin.AndroidX.AppCompat.AppCompatResources => 145
	i64 u0xc040a4ab55817f58, ; 622: ar/Microsoft.Maui.Controls.resources.dll => 13
	i64 u0xc0ca0108a1384ed5, ; 623: lib_EFCore.BulkExtensions.Core.dll.so => 63
	i64 u0xc0d928351ab5ca77, ; 624: System.Console.dll => 194
	i64 u0xc1182977a92df85f, ; 625: lib-fr-Microsoft.SqlServer.Types.resources.dll.so => 49
	i64 u0xc12b8b3afa48329c, ; 626: lib_System.Linq.dll.so => 214
	i64 u0xc1c2cb7af77b8858, ; 627: Microsoft.EntityFrameworkCore => 76
	i64 u0xc1ff9ae3cdb6e1e6, ; 628: Xamarin.AndroidX.Activity.dll => 143
	i64 u0xc26c064effb1dea9, ; 629: System.Buffers.dll => 184
	i64 u0xc278de356ad8a9e3, ; 630: Microsoft.IdentityModel.Logging => 98
	i64 u0xc28c50f32f81cc73, ; 631: ja/Microsoft.Maui.Controls.resources.dll => 28
	i64 u0xc2a3bca55b573141, ; 632: System.IO.FileSystem.Watcher => 208
	i64 u0xc2bcfec99f69365e, ; 633: Xamarin.AndroidX.ViewPager2.dll => 172
	i64 u0xc2eb95e1f02ee46b, ; 634: it/Microsoft.SqlServer.Types.resources.dll => 50
	i64 u0xc30b52815b58ac2c, ; 635: lib_System.Runtime.Serialization.Xml.dll.so => 242
	i64 u0xc3492f8f90f96ce4, ; 636: lib_Microsoft.Extensions.DependencyModel.dll.so => 89
	i64 u0xc3f0e03e56ce7b69, ; 637: zxing => 178
	i64 u0xc463e077917aa21d, ; 638: System.Runtime.Serialization.Json => 240
	i64 u0xc472ce300460ccb6, ; 639: Microsoft.EntityFrameworkCore.dll => 76
	i64 u0xc4d3858ed4d08512, ; 640: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 162
	i64 u0xc4d69851fe06342f, ; 641: lib_Microsoft.Extensions.Caching.Memory.dll.so => 84
	i64 u0xc50fded0ded1418c, ; 642: lib_System.ComponentModel.TypeConverter.dll.so => 192
	i64 u0xc519125d6bc8fb11, ; 643: lib_System.Net.Requests.dll.so => 220
	i64 u0xc5293b19e4dc230e, ; 644: Xamarin.AndroidX.Navigation.Fragment => 165
	i64 u0xc5325b2fcb37446f, ; 645: lib_System.Private.Xml.dll.so => 230
	i64 u0xc583d8477b5d3bac, ; 646: zh-Hant/Microsoft.Data.SqlClient.resources.dll => 12
	i64 u0xc5a0f4b95a699af7, ; 647: lib_System.Private.Uri.dll.so => 228
	i64 u0xc5cdcd5b6277579e, ; 648: lib_System.Security.Cryptography.Algorithms.dll.so => 246
	i64 u0xc7c01e7d7c93a110, ; 649: System.Text.Encoding.Extensions.dll => 253
	i64 u0xc7ce851898a4548e, ; 650: lib_System.Web.HttpUtility.dll.so => 263
	i64 u0xc858a28d9ee5a6c5, ; 651: lib_System.Collections.Specialized.dll.so => 188
	i64 u0xc95a1178aef91462, ; 652: lib_Microsoft.EntityFrameworkCore.SqlServer.HierarchyId.dll.so => 82
	i64 u0xc9c62c8f354ac568, ; 653: lib_System.Diagnostics.TextWriterTraceListener.dll.so => 200
	i64 u0xc9d61d6a8d51fe6c, ; 654: lib_NetTopologySuite.IO.SqlServerBytes.dll.so => 112
	i64 u0xc9e54b32fc19baf3, ; 655: lib_CommunityToolkit.Maui.dll.so => 60
	i64 u0xca32340d8d54dcd5, ; 656: Microsoft.Extensions.Caching.Memory.dll => 84
	i64 u0xca3a723e7342c5b6, ; 657: lib-tr-Microsoft.Maui.Controls.resources.dll.so => 41
	i64 u0xcab3493c70141c2d, ; 658: pl/Microsoft.Maui.Controls.resources => 33
	i64 u0xcacfddc9f7c6de76, ; 659: ro/Microsoft.Maui.Controls.resources.dll => 36
	i64 u0xcb45618372c47127, ; 660: Microsoft.EntityFrameworkCore.Relational => 78
	i64 u0xcb6f731cbdfa3dd8, ; 661: Npgsql.EntityFrameworkCore.PostgreSQL => 115
	i64 u0xcbd4fdd9cef4a294, ; 662: lib__Microsoft.Android.Resource.Designer.dll.so => 57
	i64 u0xcc182c3afdc374d6, ; 663: Microsoft.Bcl.AsyncInterfaces => 73
	i64 u0xcc2876b32ef2794c, ; 664: lib_System.Text.RegularExpressions.dll.so => 255
	i64 u0xcc5c3bb714c4561e, ; 665: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 176
	i64 u0xcc76886e09b88260, ; 666: Xamarin.KotlinX.Serialization.Core.Jvm.dll => 177
	i64 u0xccf25c4b634ccd3a, ; 667: zh-Hans/Microsoft.Maui.Controls.resources.dll => 45
	i64 u0xcd10a42808629144, ; 668: System.Net.Requests => 220
	i64 u0xcdd0c48b6937b21c, ; 669: Xamarin.AndroidX.SwipeRefreshLayout => 170
	i64 u0xce366153aaa26f70, ; 670: System.DirectoryServices.Protocols.dll => 134
	i64 u0xceb28d385f84f441, ; 671: Azure.Core.dll => 58
	i64 u0xcf140ed700bc8e66, ; 672: Microsoft.SqlServer.Server.dll => 108
	i64 u0xcf23d8093f3ceadf, ; 673: System.Diagnostics.DiagnosticSource.dll => 196
	i64 u0xcf4d55b5fe223cd6, ; 674: NetTopologySuite.IO.SqlServerBytes => 112
	i64 u0xcf8fc898f98b0d34, ; 675: System.Private.Xml.Linq => 229
	i64 u0xcfa869564d903308, ; 676: EFCore.BulkExtensions.Core => 63
	i64 u0xd04b5f59ed596e31, ; 677: System.Reflection.Metadata.dll => 233
	i64 u0xd063299fcfc0c93f, ; 678: lib_System.Runtime.Serialization.Json.dll.so => 240
	i64 u0xd0de8a113e976700, ; 679: System.Diagnostics.TextWriterTraceListener => 200
	i64 u0xd1194e1d8a8de83c, ; 680: lib_Xamarin.AndroidX.Lifecycle.Common.Jvm.dll.so => 159
	i64 u0xd22a0c4630f2fe66, ; 681: lib_System.Security.Cryptography.ProtectedData.dll.so => 139
	i64 u0xd2b39754bb800974, ; 682: es/Microsoft.SqlServer.Types.resources => 48
	i64 u0xd2dffb59201927bd, ; 683: de/Microsoft.Data.SqlClient.resources.dll => 1
	i64 u0xd3144156a3727ebe, ; 684: Xamarin.Google.Guava.ListenableFuture => 174
	i64 u0xd333d0af9e423810, ; 685: System.Runtime.InteropServices => 236
	i64 u0xd33a415cb4278969, ; 686: System.Security.Cryptography.Encoding.dll => 247
	i64 u0xd3426d966bb704f5, ; 687: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 145
	i64 u0xd3651b6fc3125825, ; 688: System.Private.Uri.dll => 228
	i64 u0xd373685349b1fe8b, ; 689: Microsoft.Extensions.Logging.dll => 90
	i64 u0xd3801faafafb7698, ; 690: System.Private.DataContractSerialization.dll => 227
	i64 u0xd3e4c8d6a2d5d470, ; 691: it/Microsoft.Maui.Controls.resources => 27
	i64 u0xd42655883bb8c19f, ; 692: Microsoft.EntityFrameworkCore.Abstractions.dll => 77
	i64 u0xd4645626dffec99d, ; 693: lib_Microsoft.Extensions.DependencyInjection.Abstractions.dll.so => 88
	i64 u0xd5507e11a2b2839f, ; 694: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 162
	i64 u0xd567f168deeeaf3c, ; 695: lib_zxing.dll.so => 178
	i64 u0xd5858610826f1c08, ; 696: lib-ru-Microsoft.Data.SqlClient.resources.dll.so => 9
	i64 u0xd63b432ec9306914, ; 697: zxing.dll => 178
	i64 u0xd6694f8359737e4e, ; 698: Xamarin.AndroidX.SavedState => 169
	i64 u0xd67e431fe2ca996e, ; 699: zh-Hans/Microsoft.SqlServer.Types.resources.dll => 55
	i64 u0xd6d21782156bc35b, ; 700: Xamarin.AndroidX.SwipeRefreshLayout.dll => 170
	i64 u0xd72329819cbbbc44, ; 701: lib_Microsoft.Extensions.Configuration.Abstractions.dll.so => 86
	i64 u0xd72c760af136e863, ; 702: System.Xml.XmlSerializer.dll => 267
	i64 u0xd7b3764ada9d341d, ; 703: lib_Microsoft.Extensions.Logging.Abstractions.dll.so => 91
	i64 u0xd9d04d95a2671e29, ; 704: lib_ZXing.Net.MAUI.Controls.dll.so => 180
	i64 u0xda1dfa4c534a9251, ; 705: Microsoft.Extensions.DependencyInjection => 87
	i64 u0xdad05a11827959a3, ; 706: System.Collections.NonGeneric.dll => 187
	i64 u0xdb5383ab5865c007, ; 707: lib-vi-Microsoft.Maui.Controls.resources.dll.so => 43
	i64 u0xdb58816721c02a59, ; 708: lib_System.Reflection.Emit.ILGeneration.dll.so => 231
	i64 u0xdbeda89f832aa805, ; 709: vi/Microsoft.Maui.Controls.resources.dll => 43
	i64 u0xdbf2a779fbc3ac31, ; 710: System.Transactions.Local.dll => 262
	i64 u0xdbf9607a441b4505, ; 711: System.Linq => 214
	i64 u0xdc75032002d1a212, ; 712: lib_System.Transactions.Local.dll.so => 262
	i64 u0xdca8be7403f92d4f, ; 713: lib_System.Linq.Queryable.dll.so => 213
	i64 u0xdce2c53525640bf3, ; 714: Microsoft.Extensions.Logging => 90
	i64 u0xdd2b722d78ef5f43, ; 715: System.Runtime.dll => 243
	i64 u0xdd67031857c72f96, ; 716: lib_System.Text.Encodings.Web.dll.so => 254
	i64 u0xdde30e6b77aa6f6c, ; 717: lib-zh-Hans-Microsoft.Maui.Controls.resources.dll.so => 45
	i64 u0xddf8227337aa0462, ; 718: SkiaSharp.HarfBuzz => 121
	i64 u0xde110ae80fa7c2e2, ; 719: System.Xml.XDocument.dll => 266
	i64 u0xde572c2b2fb32f93, ; 720: lib_System.Threading.Tasks.Extensions.dll.so => 257
	i64 u0xde8769ebda7d8647, ; 721: hr/Microsoft.Maui.Controls.resources.dll => 24
	i64 u0xe0142572c095a480, ; 722: Xamarin.AndroidX.AppCompat.dll => 144
	i64 u0xe02f89350ec78051, ; 723: Xamarin.AndroidX.CoordinatorLayout.dll => 152
	i64 u0xe0ea30f1ac5b7731, ; 724: ko/Microsoft.Data.SqlClient.resources.dll => 6
	i64 u0xe0ee2e61123c1478, ; 725: lib-es-Microsoft.Data.SqlClient.resources.dll.so => 2
	i64 u0xe10b760bb1462e7a, ; 726: lib_System.Security.Cryptography.Primitives.dll.so => 248
	i64 u0xe12265280d0b036d, ; 727: fr/Microsoft.Data.SqlClient.resources => 3
	i64 u0xe192a588d4410686, ; 728: lib_System.IO.Pipelines.dll.so => 210
	i64 u0xe1a08bd3fa539e0d, ; 729: System.Runtime.Loader => 237
	i64 u0xe1b52f9f816c70ef, ; 730: System.Private.Xml.Linq.dll => 229
	i64 u0xe1ecfdb7fff86067, ; 731: System.Net.Security.dll => 221
	i64 u0xe22fa4c9c645db62, ; 732: System.Diagnostics.TextWriterTraceListener.dll => 200
	i64 u0xe2420585aeceb728, ; 733: System.Net.Requests.dll => 220
	i64 u0xe29b73bc11392966, ; 734: lib-id-Microsoft.Maui.Controls.resources.dll.so => 26
	i64 u0xe2e426c7714fa0bc, ; 735: Microsoft.Win32.Primitives.dll => 183
	i64 u0xe3811d68d4fe8463, ; 736: pt-BR/Microsoft.Maui.Controls.resources.dll => 34
	i64 u0xe3b7cbae5ad66c75, ; 737: lib_System.Security.Cryptography.Encoding.dll.so => 247
	i64 u0xe494f7ced4ecd10a, ; 738: hu/Microsoft.Maui.Controls.resources.dll => 25
	i64 u0xe4a9b1e40d1e8917, ; 739: lib-fi-Microsoft.Maui.Controls.resources.dll.so => 20
	i64 u0xe4f74a0b5bf9703f, ; 740: System.Runtime.Serialization.Primitives => 241
	i64 u0xe5434e8a119ceb69, ; 741: lib_Mono.Android.dll.so => 273
	i64 u0xe57d22ca4aeb4900, ; 742: System.Configuration.ConfigurationManager => 130
	i64 u0xe67e4f4689949049, ; 743: zh-Hans/Microsoft.SqlServer.Types.resources => 55
	i64 u0xe7e03cc18dcdeb49, ; 744: lib_System.Diagnostics.StackTrace.dll.so => 199
	i64 u0xe89a2a9ef110899b, ; 745: System.Drawing.dll => 204
	i64 u0xe93e919ce2b08636, ; 746: lib_ExCSS.dll.so => 68
	i64 u0xeae68e81c894c13d, ; 747: UraniumUI.Material.dll => 142
	i64 u0xed6ef763c6fb395f, ; 748: System.Diagnostics.EventLog.dll => 132
	i64 u0xed88ac16d5217c50, ; 749: lib_EFCore.BulkExtensions.Oracle.dll.so => 64
	i64 u0xedc4817167106c23, ; 750: System.Net.Sockets.dll => 222
	i64 u0xedc632067fb20ff3, ; 751: System.Memory.dll => 215
	i64 u0xedc8e4ca71a02a8b, ; 752: Xamarin.AndroidX.Navigation.Runtime.dll => 166
	i64 u0xee04c435dc04d4d7, ; 753: EFCore.BulkExtensions.Core.dll => 63
	i64 u0xee81f5b3f1c4f83b, ; 754: System.Threading.ThreadPool => 260
	i64 u0xeeb7ebb80150501b, ; 755: lib_Xamarin.AndroidX.Collection.Jvm.dll.so => 151
	i64 u0xeef850486aa78956, ; 756: lib-de-Microsoft.SqlServer.Types.resources.dll.so => 47
	i64 u0xef03b1b5a04e9709, ; 757: System.Text.Encoding.CodePages.dll => 252
	i64 u0xef2f805e5d8b8230, ; 758: lib_Oracle.ManagedDataAccess.dll.so => 117
	i64 u0xef602c523fe2e87a, ; 759: lib_Xamarin.Google.Guava.ListenableFuture.dll.so => 174
	i64 u0xef72742e1bcca27a, ; 760: Microsoft.Maui.Essentials.dll => 106
	i64 u0xefd0396433f04886, ; 761: pt-BR/Microsoft.Data.SqlClient.resources => 8
	i64 u0xefe24f02e90841a9, ; 762: ru/Microsoft.SqlServer.Types.resources.dll => 54
	i64 u0xefec0b7fdc57ec42, ; 763: Xamarin.AndroidX.Activity => 143
	i64 u0xf00c29406ea45e19, ; 764: es/Microsoft.Maui.Controls.resources.dll => 19
	i64 u0xf09e47b6ae914f6e, ; 765: System.Net.NameResolution => 217
	i64 u0xf0de2537ee19c6ca, ; 766: lib_System.Net.WebHeaderCollection.dll.so => 224
	i64 u0xf11b621fc87b983f, ; 767: Microsoft.Maui.Controls.Xaml.dll => 104
	i64 u0xf1c4b4005493d871, ; 768: System.Formats.Asn1.dll => 135
	i64 u0xf238bd79489d3a96, ; 769: lib-nl-Microsoft.Maui.Controls.resources.dll.so => 32
	i64 u0xf25203d36c6e85c4, ; 770: lib-ja-Microsoft.SqlServer.Types.resources.dll.so => 51
	i64 u0xf37221fda4ef8830, ; 771: lib_Xamarin.Google.Android.Material.dll.so => 173
	i64 u0xf3ddfe05336abf29, ; 772: System => 268
	i64 u0xf408654b2a135055, ; 773: System.Reflection.Emit.ILGeneration.dll => 231
	i64 u0xf4103170a1de5bd0, ; 774: System.Linq.Queryable.dll => 213
	i64 u0xf4727d423e5d26f3, ; 775: SkiaSharp => 120
	i64 u0xf4c1dd70a5496a17, ; 776: System.IO.Compression => 206
	i64 u0xf502029ca9ac09c4, ; 777: Microsoft.EntityFrameworkCore.SqlServer.HierarchyId.dll => 82
	i64 u0xf5e59d7ac34b50aa, ; 778: Microsoft.IdentityModel.Protocols.dll => 99
	i64 u0xf5fc7602fe27b333, ; 779: System.Net.WebHeaderCollection => 224
	i64 u0xf6077741019d7428, ; 780: Xamarin.AndroidX.CoordinatorLayout => 152
	i64 u0xf61ade9836ad4692, ; 781: Microsoft.IdentityModel.Tokens.dll => 101
	i64 u0xf6ae7832fd9c9009, ; 782: lib-it-Microsoft.SqlServer.Types.resources.dll.so => 50
	i64 u0xf6c0e7d55a7a4e4f, ; 783: Microsoft.IdentityModel.JsonWebTokens => 97
	i64 u0xf77b20923f07c667, ; 784: de/Microsoft.Maui.Controls.resources.dll => 17
	i64 u0xf79cbf52994c8548, ; 785: Npgsql => 114
	i64 u0xf7be8a85d06b4b64, ; 786: ru/Microsoft.Data.SqlClient.resources.dll => 9
	i64 u0xf7e2cac4c45067b3, ; 787: lib_System.Numerics.Vectors.dll.so => 225
	i64 u0xf7e74930e0e3d214, ; 788: zh-HK/Microsoft.Maui.Controls.resources.dll => 44
	i64 u0xf7fa0bf77fe677cc, ; 789: Newtonsoft.Json.dll => 113
	i64 u0xf83775f330791063, ; 790: ja/Microsoft.Data.SqlClient.resources.dll => 5
	i64 u0xf84773b5c81e3cef, ; 791: lib-uk-Microsoft.Maui.Controls.resources.dll.so => 42
	i64 u0xf8aac5ea82de1348, ; 792: System.Linq.Queryable => 213
	i64 u0xf8abd63acd77d37b, ; 793: Xamarin.AndroidX.Camera.View => 149
	i64 u0xf8b77539b362d3ba, ; 794: lib_System.Reflection.Primitives.dll.so => 234
	i64 u0xf8cd217ba1bbfdc8, ; 795: lib-zh-Hant-Microsoft.Data.SqlClient.resources.dll.so => 12
	i64 u0xf8e045dc345b2ea3, ; 796: lib_Xamarin.AndroidX.RecyclerView.dll.so => 168
	i64 u0xf915dc29808193a1, ; 797: System.Web.HttpUtility.dll => 263
	i64 u0xf96c777a2a0686f4, ; 798: hi/Microsoft.Maui.Controls.resources.dll => 23
	i64 u0xf9be54c8bcf8ff3b, ; 799: System.Security.AccessControl.dll => 244
	i64 u0xf9eec5bb3a6aedc6, ; 800: Microsoft.Extensions.Options => 92
	i64 u0xfa3f278f288b0e84, ; 801: lib_System.Net.Security.dll.so => 221
	i64 u0xfa5ed7226d978949, ; 802: lib-ar-Microsoft.Maui.Controls.resources.dll.so => 13
	i64 u0xfa645d91e9fc4cba, ; 803: System.Threading.Thread => 259
	i64 u0xfaef53f942a29695, ; 804: pt-BR/Microsoft.SqlServer.Types.resources => 53
	i64 u0xfb022853d73b7fa5, ; 805: lib_SQLitePCLRaw.batteries_v2.dll.so => 122
	i64 u0xfbad3e4ce4b98145, ; 806: System.Security.Cryptography.X509Certificates => 249
	i64 u0xfbf0a31c9fc34bc4, ; 807: lib_System.Net.Http.dll.so => 216
	i64 u0xfc0ee5ac47a00750, ; 808: ExCSS => 68
	i64 u0xfc6b7527cc280b3f, ; 809: lib_System.Runtime.Serialization.Formatters.dll.so => 239
	i64 u0xfc719aec26adf9d9, ; 810: Xamarin.AndroidX.Navigation.Fragment.dll => 165
	i64 u0xfcd302092ada6328, ; 811: System.IO.MemoryMappedFiles.dll => 209
	i64 u0xfcd5b90cf101e36b, ; 812: System.Data.SqlClient.dll => 131
	i64 u0xfd22f00870e40ae0, ; 813: lib_Xamarin.AndroidX.DrawerLayout.dll.so => 156
	i64 u0xfd49b3c1a76e2748, ; 814: System.Runtime.InteropServices.RuntimeInformation => 235
	i64 u0xfd536c702f64dc47, ; 815: System.Text.Encoding.Extensions => 253
	i64 u0xfd583f7657b6a1cb, ; 816: Xamarin.AndroidX.Fragment => 157
	i64 u0xfdbe4710aa9beeff, ; 817: CommunityToolkit.Maui => 60
	i64 u0xfddbe9695626a7f5, ; 818: Xamarin.AndroidX.Lifecycle.Common => 158
	i64 u0xfeae9952cf03b8cb, ; 819: tr/Microsoft.Maui.Controls.resources => 41
	i64 u0xfeca84fe7f34860b, ; 820: HarfBuzzSharp.dll => 70
	i64 u0xfff40914e0b38d3d ; 821: Azure.Identity.dll => 59
], align 8

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [822 x i32] [
	i32 110, i32 1, i32 170, i32 109, i32 190, i32 179, i32 166, i32 61,
	i32 138, i32 6, i32 84, i32 272, i32 144, i32 184, i32 125, i32 227,
	i32 37, i32 15, i32 43, i32 96, i32 219, i32 51, i32 168, i32 75,
	i32 189, i32 105, i32 128, i32 109, i32 12, i32 75, i32 70, i32 10,
	i32 44, i32 264, i32 151, i32 37, i32 187, i32 4, i32 58, i32 234,
	i32 56, i32 156, i32 190, i32 92, i32 187, i32 137, i32 250, i32 233,
	i32 121, i32 83, i32 256, i32 74, i32 66, i32 38, i32 177, i32 171,
	i32 34, i32 148, i32 273, i32 134, i32 106, i32 119, i32 73, i32 64,
	i32 127, i32 217, i32 5, i32 73, i32 155, i32 2, i32 205, i32 248,
	i32 50, i32 232, i32 168, i32 100, i32 146, i32 21, i32 271, i32 22,
	i32 100, i32 88, i32 65, i32 183, i32 132, i32 89, i32 1, i32 211,
	i32 246, i32 269, i32 244, i32 115, i32 25, i32 254, i32 177, i32 223,
	i32 31, i32 245, i32 149, i32 141, i32 59, i32 185, i32 268, i32 40,
	i32 47, i32 272, i32 47, i32 102, i32 207, i32 199, i32 167, i32 29,
	i32 258, i32 92, i32 267, i32 197, i32 223, i32 64, i32 205, i32 198,
	i32 243, i32 129, i32 231, i32 40, i32 211, i32 259, i32 76, i32 0,
	i32 194, i32 153, i32 241, i32 21, i32 122, i32 175, i32 93, i32 147,
	i32 56, i32 136, i32 26, i32 24, i32 271, i32 219, i32 48, i32 120,
	i32 42, i32 218, i32 121, i32 201, i32 20, i32 255, i32 136, i32 135,
	i32 46, i32 33, i32 252, i32 232, i32 229, i32 8, i32 261, i32 39,
	i32 140, i32 18, i32 67, i32 198, i32 265, i32 108, i32 202, i32 83,
	i32 157, i32 96, i32 111, i32 57, i32 150, i32 55, i32 203, i32 21,
	i32 265, i32 186, i32 19, i32 222, i32 108, i32 133, i32 71, i32 105,
	i32 15, i32 103, i32 190, i32 172, i32 85, i32 119, i32 114, i32 232,
	i32 209, i32 141, i32 49, i32 234, i32 186, i32 66, i32 155, i32 217,
	i32 99, i32 130, i32 171, i32 14, i32 113, i32 181, i32 248, i32 253,
	i32 101, i32 249, i32 74, i32 175, i32 146, i32 180, i32 131, i32 174,
	i32 260, i32 264, i32 153, i32 122, i32 4, i32 95, i32 257, i32 164,
	i32 133, i32 59, i32 110, i32 130, i32 145, i32 269, i32 273, i32 181,
	i32 33, i32 54, i32 182, i32 241, i32 175, i32 77, i32 136, i32 126,
	i32 201, i32 126, i32 89, i32 37, i32 264, i32 137, i32 35, i32 209,
	i32 226, i32 167, i32 207, i32 140, i32 129, i32 78, i32 163, i32 218,
	i32 128, i32 212, i32 230, i32 129, i32 71, i32 237, i32 102, i32 27,
	i32 163, i32 272, i32 252, i32 256, i32 14, i32 0, i32 48, i32 124,
	i32 101, i32 4, i32 103, i32 82, i32 62, i32 161, i32 5, i32 204,
	i32 219, i32 195, i32 11, i32 153, i32 107, i32 117, i32 38, i32 218,
	i32 235, i32 44, i32 245, i32 243, i32 158, i32 159, i32 188, i32 242,
	i32 228, i32 123, i32 270, i32 196, i32 28, i32 87, i32 182, i32 137,
	i32 152, i32 261, i32 193, i32 69, i32 227, i32 16, i32 119, i32 131,
	i32 90, i32 197, i32 53, i32 224, i32 179, i32 8, i32 7, i32 258,
	i32 236, i32 151, i32 188, i32 254, i32 191, i32 66, i32 265, i32 68,
	i32 195, i32 54, i32 124, i32 18, i32 87, i32 176, i32 215, i32 104,
	i32 17, i32 237, i32 0, i32 270, i32 10, i32 186, i32 173, i32 246,
	i32 81, i32 60, i32 103, i32 238, i32 194, i32 161, i32 154, i32 52,
	i32 133, i32 16, i32 203, i32 135, i32 22, i32 124, i32 236, i32 31,
	i32 67, i32 80, i32 139, i32 107, i32 7, i32 93, i32 154, i32 93,
	i32 165, i32 105, i32 15, i32 208, i32 118, i32 41, i32 31, i32 27,
	i32 191, i32 138, i32 247, i32 24, i32 52, i32 215, i32 79, i32 67,
	i32 72, i32 85, i32 169, i32 238, i32 53, i32 30, i32 40, i32 157,
	i32 11, i32 20, i32 75, i32 97, i32 192, i32 38, i32 17, i32 223,
	i32 61, i32 30, i32 225, i32 189, i32 65, i32 202, i32 245, i32 226,
	i32 193, i32 171, i32 86, i32 94, i32 160, i32 233, i32 125, i32 268,
	i32 46, i32 144, i32 150, i32 204, i32 42, i32 96, i32 45, i32 149,
	i32 258, i32 211, i32 240, i32 116, i32 78, i32 120, i32 6, i32 116,
	i32 126, i32 46, i32 85, i32 127, i32 242, i32 77, i32 259, i32 205,
	i32 70, i32 106, i32 176, i32 269, i32 118, i32 191, i32 235, i32 83,
	i32 163, i32 196, i32 251, i32 198, i32 22, i32 10, i32 58, i32 134,
	i32 251, i32 80, i32 154, i32 142, i32 79, i32 261, i32 185, i32 49,
	i32 94, i32 56, i32 118, i32 113, i32 132, i32 164, i32 23, i32 36,
	i32 123, i32 35, i32 34, i32 123, i32 201, i32 111, i32 71, i32 57,
	i32 206, i32 257, i32 161, i32 104, i32 155, i32 140, i32 214, i32 14,
	i32 2, i32 69, i32 158, i32 30, i32 206, i32 98, i32 100, i32 98,
	i32 148, i32 7, i32 19, i32 95, i32 26, i32 107, i32 193, i32 185,
	i32 147, i32 212, i32 102, i32 62, i32 166, i32 117, i32 29, i32 99,
	i32 110, i32 114, i32 69, i32 111, i32 262, i32 81, i32 249, i32 112,
	i32 143, i32 86, i32 141, i32 32, i32 164, i32 160, i32 52, i32 148,
	i32 94, i32 250, i32 181, i32 173, i32 167, i32 115, i32 210, i32 81,
	i32 138, i32 29, i32 62, i32 195, i32 80, i32 239, i32 51, i32 208,
	i32 116, i32 225, i32 250, i32 267, i32 128, i32 169, i32 156, i32 74,
	i32 183, i32 159, i32 25, i32 72, i32 97, i32 61, i32 91, i32 230,
	i32 216, i32 199, i32 88, i32 18, i32 212, i32 109, i32 238, i32 160,
	i32 251, i32 266, i32 36, i32 256, i32 32, i32 263, i32 192, i32 221,
	i32 271, i32 226, i32 79, i32 162, i32 39, i32 202, i32 244, i32 255,
	i32 127, i32 16, i32 142, i32 139, i32 150, i32 23, i32 13, i32 210,
	i32 207, i32 197, i32 91, i32 260, i32 72, i32 203, i32 39, i32 270,
	i32 182, i32 35, i32 28, i32 266, i32 189, i32 222, i32 179, i32 95,
	i32 239, i32 125, i32 11, i32 65, i32 3, i32 216, i32 3, i32 172,
	i32 9, i32 146, i32 180, i32 147, i32 184, i32 145, i32 13, i32 63,
	i32 194, i32 49, i32 214, i32 76, i32 143, i32 184, i32 98, i32 28,
	i32 208, i32 172, i32 50, i32 242, i32 89, i32 178, i32 240, i32 76,
	i32 162, i32 84, i32 192, i32 220, i32 165, i32 230, i32 12, i32 228,
	i32 246, i32 253, i32 263, i32 188, i32 82, i32 200, i32 112, i32 60,
	i32 84, i32 41, i32 33, i32 36, i32 78, i32 115, i32 57, i32 73,
	i32 255, i32 176, i32 177, i32 45, i32 220, i32 170, i32 134, i32 58,
	i32 108, i32 196, i32 112, i32 229, i32 63, i32 233, i32 240, i32 200,
	i32 159, i32 139, i32 48, i32 1, i32 174, i32 236, i32 247, i32 145,
	i32 228, i32 90, i32 227, i32 27, i32 77, i32 88, i32 162, i32 178,
	i32 9, i32 178, i32 169, i32 55, i32 170, i32 86, i32 267, i32 91,
	i32 180, i32 87, i32 187, i32 43, i32 231, i32 43, i32 262, i32 214,
	i32 262, i32 213, i32 90, i32 243, i32 254, i32 45, i32 121, i32 266,
	i32 257, i32 24, i32 144, i32 152, i32 6, i32 2, i32 248, i32 3,
	i32 210, i32 237, i32 229, i32 221, i32 200, i32 220, i32 26, i32 183,
	i32 34, i32 247, i32 25, i32 20, i32 241, i32 273, i32 130, i32 55,
	i32 199, i32 204, i32 68, i32 142, i32 132, i32 64, i32 222, i32 215,
	i32 166, i32 63, i32 260, i32 151, i32 47, i32 252, i32 117, i32 174,
	i32 106, i32 8, i32 54, i32 143, i32 19, i32 217, i32 224, i32 104,
	i32 135, i32 32, i32 51, i32 173, i32 268, i32 231, i32 213, i32 120,
	i32 206, i32 82, i32 99, i32 224, i32 152, i32 101, i32 50, i32 97,
	i32 17, i32 114, i32 9, i32 225, i32 44, i32 113, i32 5, i32 42,
	i32 213, i32 149, i32 234, i32 12, i32 168, i32 263, i32 23, i32 244,
	i32 92, i32 221, i32 13, i32 259, i32 53, i32 122, i32 249, i32 216,
	i32 68, i32 239, i32 165, i32 209, i32 131, i32 156, i32 235, i32 253,
	i32 157, i32 60, i32 158, i32 41, i32 70, i32 59
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
