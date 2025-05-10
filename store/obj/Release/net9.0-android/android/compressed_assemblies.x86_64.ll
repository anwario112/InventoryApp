; ModuleID = 'compressed_assemblies.x86_64.ll'
source_filename = "compressed_assemblies.x86_64.ll"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-android21"

%struct.CompressedAssemblies = type {
	i32, ; uint32_t count
	ptr ; CompressedAssemblyDescriptor descriptors
}

%struct.CompressedAssemblyDescriptor = type {
	i32, ; uint32_t uncompressed_file_size
	i1, ; bool loaded
	ptr ; uint8_t data
}

@compressed_assemblies = dso_local local_unnamed_addr global %struct.CompressedAssemblies {
	i32 310, ; uint32_t count
	ptr @compressed_assembly_descriptors; CompressedAssemblyDescriptor* descriptors
}, align 8

@compressed_assembly_descriptors = internal dso_local global [310 x %struct.CompressedAssemblyDescriptor] [
	%struct.CompressedAssemblyDescriptor {
		i32 261240, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_0; uint8_t* data
	}, ; 0: Microsoft.Data.SqlClient.resources
	%struct.CompressedAssemblyDescriptor {
		i32 271480, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_1; uint8_t* data
	}, ; 1: Microsoft.Data.SqlClient.resources
	%struct.CompressedAssemblyDescriptor {
		i32 262776, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_2; uint8_t* data
	}, ; 2: Microsoft.Data.SqlClient.resources
	%struct.CompressedAssemblyDescriptor {
		i32 272504, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_3; uint8_t* data
	}, ; 3: Microsoft.Data.SqlClient.resources
	%struct.CompressedAssemblyDescriptor {
		i32 264312, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_4; uint8_t* data
	}, ; 4: Microsoft.Data.SqlClient.resources
	%struct.CompressedAssemblyDescriptor {
		i32 293512, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_5; uint8_t* data
	}, ; 5: Microsoft.Data.SqlClient.resources
	%struct.CompressedAssemblyDescriptor {
		i32 271480, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_6; uint8_t* data
	}, ; 6: Microsoft.Data.SqlClient.resources
	%struct.CompressedAssemblyDescriptor {
		i32 270456, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_7; uint8_t* data
	}, ; 7: Microsoft.Data.SqlClient.resources
	%struct.CompressedAssemblyDescriptor {
		i32 258696, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_8; uint8_t* data
	}, ; 8: Microsoft.Data.SqlClient.resources
	%struct.CompressedAssemblyDescriptor {
		i32 349816, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_9; uint8_t* data
	}, ; 9: Microsoft.Data.SqlClient.resources
	%struct.CompressedAssemblyDescriptor {
		i32 254072, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_10; uint8_t* data
	}, ; 10: Microsoft.Data.SqlClient.resources
	%struct.CompressedAssemblyDescriptor {
		i32 228984, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_11; uint8_t* data
	}, ; 11: Microsoft.Data.SqlClient.resources
	%struct.CompressedAssemblyDescriptor {
		i32 232568, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_12; uint8_t* data
	}, ; 12: Microsoft.Data.SqlClient.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15392, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_13; uint8_t* data
	}, ; 13: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15392, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_14; uint8_t* data
	}, ; 14: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15384, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_15; uint8_t* data
	}, ; 15: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15392, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_16; uint8_t* data
	}, ; 16: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15392, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_17; uint8_t* data
	}, ; 17: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15392, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_18; uint8_t* data
	}, ; 18: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15392, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_19; uint8_t* data
	}, ; 19: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15392, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_20; uint8_t* data
	}, ; 20: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15392, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_21; uint8_t* data
	}, ; 21: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15392, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_22; uint8_t* data
	}, ; 22: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15392, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_23; uint8_t* data
	}, ; 23: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15392, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_24; uint8_t* data
	}, ; 24: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15392, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_25; uint8_t* data
	}, ; 25: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15392, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_26; uint8_t* data
	}, ; 26: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15392, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_27; uint8_t* data
	}, ; 27: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15392, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_28; uint8_t* data
	}, ; 28: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15392, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_29; uint8_t* data
	}, ; 29: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15384, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_30; uint8_t* data
	}, ; 30: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15384, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_31; uint8_t* data
	}, ; 31: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15392, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_32; uint8_t* data
	}, ; 32: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15392, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_33; uint8_t* data
	}, ; 33: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15392, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_34; uint8_t* data
	}, ; 34: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15392, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_35; uint8_t* data
	}, ; 35: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15392, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_36; uint8_t* data
	}, ; 36: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15392, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_37; uint8_t* data
	}, ; 37: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15392, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_38; uint8_t* data
	}, ; 38: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15392, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_39; uint8_t* data
	}, ; 39: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15392, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_40; uint8_t* data
	}, ; 40: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15392, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_41; uint8_t* data
	}, ; 41: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15392, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_42; uint8_t* data
	}, ; 42: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15392, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_43; uint8_t* data
	}, ; 43: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15392, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_44; uint8_t* data
	}, ; 44: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15384, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_45; uint8_t* data
	}, ; 45: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 15392, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_46; uint8_t* data
	}, ; 46: Microsoft.Maui.Controls.resources
	%struct.CompressedAssemblyDescriptor {
		i32 32672, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_47; uint8_t* data
	}, ; 47: Microsoft.SqlServer.Types.resources
	%struct.CompressedAssemblyDescriptor {
		i32 32672, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_48; uint8_t* data
	}, ; 48: Microsoft.SqlServer.Types.resources
	%struct.CompressedAssemblyDescriptor {
		i32 33184, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_49; uint8_t* data
	}, ; 49: Microsoft.SqlServer.Types.resources
	%struct.CompressedAssemblyDescriptor {
		i32 32672, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_50; uint8_t* data
	}, ; 50: Microsoft.SqlServer.Types.resources
	%struct.CompressedAssemblyDescriptor {
		i32 34720, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_51; uint8_t* data
	}, ; 51: Microsoft.SqlServer.Types.resources
	%struct.CompressedAssemblyDescriptor {
		i32 32672, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_52; uint8_t* data
	}, ; 52: Microsoft.SqlServer.Types.resources
	%struct.CompressedAssemblyDescriptor {
		i32 32672, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_53; uint8_t* data
	}, ; 53: Microsoft.SqlServer.Types.resources
	%struct.CompressedAssemblyDescriptor {
		i32 41888, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_54; uint8_t* data
	}, ; 54: Microsoft.SqlServer.Types.resources
	%struct.CompressedAssemblyDescriptor {
		i32 30112, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_55; uint8_t* data
	}, ; 55: Microsoft.SqlServer.Types.resources
	%struct.CompressedAssemblyDescriptor {
		i32 30112, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_56; uint8_t* data
	}, ; 56: Microsoft.SqlServer.Types.resources
	%struct.CompressedAssemblyDescriptor {
		i32 6144, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_57; uint8_t* data
	}, ; 57: _Microsoft.Android.Resource.Designer
	%struct.CompressedAssemblyDescriptor {
		i32 400936, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_58; uint8_t* data
	}, ; 58: Azure.Core
	%struct.CompressedAssemblyDescriptor {
		i32 342960, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_59; uint8_t* data
	}, ; 59: Azure.Identity
	%struct.CompressedAssemblyDescriptor {
		i32 7072536, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_60; uint8_t* data
	}, ; 60: BouncyCastle.Cryptography
	%struct.CompressedAssemblyDescriptor {
		i32 40448, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_61; uint8_t* data
	}, ; 61: CommunityToolkit.Maui
	%struct.CompressedAssemblyDescriptor {
		i32 47616, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_62; uint8_t* data
	}, ; 62: CommunityToolkit.Maui.Core
	%struct.CompressedAssemblyDescriptor {
		i32 9216, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_63; uint8_t* data
	}, ; 63: CommunityToolkit.Mvvm
	%struct.CompressedAssemblyDescriptor {
		i32 181760, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_64; uint8_t* data
	}, ; 64: EFCore.BulkExtensions.Core
	%struct.CompressedAssemblyDescriptor {
		i32 49664, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_65; uint8_t* data
	}, ; 65: EFCore.BulkExtensions.Oracle
	%struct.CompressedAssemblyDescriptor {
		i32 55808, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_66; uint8_t* data
	}, ; 66: EFCore.BulkExtensions.PostgreSql
	%struct.CompressedAssemblyDescriptor {
		i32 43008, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_67; uint8_t* data
	}, ; 67: EFCore.BulkExtensions.Sqlite
	%struct.CompressedAssemblyDescriptor {
		i32 46080, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_68; uint8_t* data
	}, ; 68: EFCore.BulkExtensions.SqlServer
	%struct.CompressedAssemblyDescriptor {
		i32 296960, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_69; uint8_t* data
	}, ; 69: FirebaseAdmin
	%struct.CompressedAssemblyDescriptor {
		i32 437760, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_70; uint8_t* data
	}, ; 70: Google.Api.CommonProtos
	%struct.CompressedAssemblyDescriptor {
		i32 79360, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_71; uint8_t* data
	}, ; 71: Google.Api.Gax
	%struct.CompressedAssemblyDescriptor {
		i32 203264, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_72; uint8_t* data
	}, ; 72: Google.Api.Gax.Grpc
	%struct.CompressedAssemblyDescriptor {
		i32 26624, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_73; uint8_t* data
	}, ; 73: Google.Api.Gax.Rest
	%struct.CompressedAssemblyDescriptor {
		i32 83456, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_74; uint8_t* data
	}, ; 74: Google.Apis
	%struct.CompressedAssemblyDescriptor {
		i32 233472, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_75; uint8_t* data
	}, ; 75: Google.Apis.Auth
	%struct.CompressedAssemblyDescriptor {
		i32 85504, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_76; uint8_t* data
	}, ; 76: Google.Apis.Core
	%struct.CompressedAssemblyDescriptor {
		i32 180224, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_77; uint8_t* data
	}, ; 77: Google.Cloud.Firestore
	%struct.CompressedAssemblyDescriptor {
		i32 308224, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_78; uint8_t* data
	}, ; 78: Google.Cloud.Firestore.V1
	%struct.CompressedAssemblyDescriptor {
		i32 35328, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_79; uint8_t* data
	}, ; 79: Google.Cloud.Location
	%struct.CompressedAssemblyDescriptor {
		i32 62976, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_80; uint8_t* data
	}, ; 80: Google.LongRunning
	%struct.CompressedAssemblyDescriptor {
		i32 388608, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_81; uint8_t* data
	}, ; 81: Google.Protobuf
	%struct.CompressedAssemblyDescriptor {
		i32 21608, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_82; uint8_t* data
	}, ; 82: Grpc.Auth
	%struct.CompressedAssemblyDescriptor {
		i32 70248, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_83; uint8_t* data
	}, ; 83: Grpc.Core.Api
	%struct.CompressedAssemblyDescriptor {
		i32 262144, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_84; uint8_t* data
	}, ; 84: Grpc.Net.Client
	%struct.CompressedAssemblyDescriptor {
		i32 6144, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_85; uint8_t* data
	}, ; 85: Grpc.Net.Common
	%struct.CompressedAssemblyDescriptor {
		i32 100352, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_86; uint8_t* data
	}, ; 86: InputKit.Maui
	%struct.CompressedAssemblyDescriptor {
		i32 155648, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_87; uint8_t* data
	}, ; 87: itext.barcodes
	%struct.CompressedAssemblyDescriptor {
		i32 23040, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_88; uint8_t* data
	}, ; 88: itext.bouncy-castle-connector
	%struct.CompressedAssemblyDescriptor {
		i32 197120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_89; uint8_t* data
	}, ; 89: itext.forms
	%struct.CompressedAssemblyDescriptor {
		i32 1549824, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_90; uint8_t* data
	}, ; 90: itext.io
	%struct.CompressedAssemblyDescriptor {
		i32 1046016, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_91; uint8_t* data
	}, ; 91: itext.kernel
	%struct.CompressedAssemblyDescriptor {
		i32 437760, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_92; uint8_t* data
	}, ; 92: itext.layout
	%struct.CompressedAssemblyDescriptor {
		i32 114176, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_93; uint8_t* data
	}, ; 93: itext.pdfa
	%struct.CompressedAssemblyDescriptor {
		i32 58368, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_94; uint8_t* data
	}, ; 94: itext.pdfua
	%struct.CompressedAssemblyDescriptor {
		i32 285184, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_95; uint8_t* data
	}, ; 95: itext.sign
	%struct.CompressedAssemblyDescriptor {
		i32 403456, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_96; uint8_t* data
	}, ; 96: itext.styledxmlparser
	%struct.CompressedAssemblyDescriptor {
		i32 144384, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_97; uint8_t* data
	}, ; 97: itext.svg
	%struct.CompressedAssemblyDescriptor {
		i32 81408, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_98; uint8_t* data
	}, ; 98: itext.bouncy-castle-adapter
	%struct.CompressedAssemblyDescriptor {
		i32 280576, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_99; uint8_t* data
	}, ; 99: itext.commons
	%struct.CompressedAssemblyDescriptor {
		i32 15872, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_100; uint8_t* data
	}, ; 100: MedallionTopologicalSort
	%struct.CompressedAssemblyDescriptor {
		i32 6144, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_101; uint8_t* data
	}, ; 101: Microsoft.Bcl.AsyncInterfaces
	%struct.CompressedAssemblyDescriptor {
		i32 2089080, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_102; uint8_t* data
	}, ; 102: Microsoft.Data.SqlClient
	%struct.CompressedAssemblyDescriptor {
		i32 93184, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_103; uint8_t* data
	}, ; 103: Microsoft.Data.Sqlite
	%struct.CompressedAssemblyDescriptor {
		i32 21488, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_104; uint8_t* data
	}, ; 104: Microsoft.DotNet.PlatformAbstractions
	%struct.CompressedAssemblyDescriptor {
		i32 2692152, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_105; uint8_t* data
	}, ; 105: Microsoft.EntityFrameworkCore
	%struct.CompressedAssemblyDescriptor {
		i32 16896, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_106; uint8_t* data
	}, ; 106: Microsoft.EntityFrameworkCore.Abstractions
	%struct.CompressedAssemblyDescriptor {
		i32 2141768, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_107; uint8_t* data
	}, ; 107: Microsoft.EntityFrameworkCore.Relational
	%struct.CompressedAssemblyDescriptor {
		i32 294984, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_108; uint8_t* data
	}, ; 108: Microsoft.EntityFrameworkCore.Sqlite
	%struct.CompressedAssemblyDescriptor {
		i32 613920, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_109; uint8_t* data
	}, ; 109: Microsoft.EntityFrameworkCore.SqlServer
	%struct.CompressedAssemblyDescriptor {
		i32 20552, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_110; uint8_t* data
	}, ; 110: Microsoft.EntityFrameworkCore.SqlServer.Abstractions
	%struct.CompressedAssemblyDescriptor {
		i32 121416, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_111; uint8_t* data
	}, ; 111: Microsoft.EntityFrameworkCore.SqlServer.HierarchyId
	%struct.CompressedAssemblyDescriptor {
		i32 11776, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_112; uint8_t* data
	}, ; 112: Microsoft.Extensions.Caching.Abstractions
	%struct.CompressedAssemblyDescriptor {
		i32 26624, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_113; uint8_t* data
	}, ; 113: Microsoft.Extensions.Caching.Memory
	%struct.CompressedAssemblyDescriptor {
		i32 15872, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_114; uint8_t* data
	}, ; 114: Microsoft.Extensions.Configuration
	%struct.CompressedAssemblyDescriptor {
		i32 6656, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_115; uint8_t* data
	}, ; 115: Microsoft.Extensions.Configuration.Abstractions
	%struct.CompressedAssemblyDescriptor {
		i32 46592, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_116; uint8_t* data
	}, ; 116: Microsoft.Extensions.DependencyInjection
	%struct.CompressedAssemblyDescriptor {
		i32 32768, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_117; uint8_t* data
	}, ; 117: Microsoft.Extensions.DependencyInjection.Abstractions
	%struct.CompressedAssemblyDescriptor {
		i32 41472, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_118; uint8_t* data
	}, ; 118: Microsoft.Extensions.DependencyModel
	%struct.CompressedAssemblyDescriptor {
		i32 19968, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_119; uint8_t* data
	}, ; 119: Microsoft.Extensions.Logging
	%struct.CompressedAssemblyDescriptor {
		i32 38400, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_120; uint8_t* data
	}, ; 120: Microsoft.Extensions.Logging.Abstractions
	%struct.CompressedAssemblyDescriptor {
		i32 17920, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_121; uint8_t* data
	}, ; 121: Microsoft.Extensions.Options
	%struct.CompressedAssemblyDescriptor {
		i32 9216, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_122; uint8_t* data
	}, ; 122: Microsoft.Extensions.Primitives
	%struct.CompressedAssemblyDescriptor {
		i32 1624064, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_123; uint8_t* data
	}, ; 123: Microsoft.Identity.Client
	%struct.CompressedAssemblyDescriptor {
		i32 66592, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_124; uint8_t* data
	}, ; 124: Microsoft.Identity.Client.Extensions.Msal
	%struct.CompressedAssemblyDescriptor {
		i32 7168, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_125; uint8_t* data
	}, ; 125: Microsoft.IdentityModel.Abstractions
	%struct.CompressedAssemblyDescriptor {
		i32 132128, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_126; uint8_t* data
	}, ; 126: Microsoft.IdentityModel.JsonWebTokens
	%struct.CompressedAssemblyDescriptor {
		i32 17408, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_127; uint8_t* data
	}, ; 127: Microsoft.IdentityModel.Logging
	%struct.CompressedAssemblyDescriptor {
		i32 40896, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_128; uint8_t* data
	}, ; 128: Microsoft.IdentityModel.Protocols
	%struct.CompressedAssemblyDescriptor {
		i32 120352, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_129; uint8_t* data
	}, ; 129: Microsoft.IdentityModel.Protocols.OpenIdConnect
	%struct.CompressedAssemblyDescriptor {
		i32 290752, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_130; uint8_t* data
	}, ; 130: Microsoft.IdentityModel.Tokens
	%struct.CompressedAssemblyDescriptor {
		i32 58880, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_131; uint8_t* data
	}, ; 131: Microsoft.Maui.Controls.Compatibility
	%struct.CompressedAssemblyDescriptor {
		i32 1868320, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_132; uint8_t* data
	}, ; 132: Microsoft.Maui.Controls
	%struct.CompressedAssemblyDescriptor {
		i32 128032, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_133; uint8_t* data
	}, ; 133: Microsoft.Maui.Controls.Xaml
	%struct.CompressedAssemblyDescriptor {
		i32 792096, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_134; uint8_t* data
	}, ; 134: Microsoft.Maui
	%struct.CompressedAssemblyDescriptor {
		i32 76800, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_135; uint8_t* data
	}, ; 135: Microsoft.Maui.Essentials
	%struct.CompressedAssemblyDescriptor {
		i32 207392, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_136; uint8_t* data
	}, ; 136: Microsoft.Maui.Graphics
	%struct.CompressedAssemblyDescriptor {
		i32 23976, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_137; uint8_t* data
	}, ; 137: Microsoft.SqlServer.Server
	%struct.CompressedAssemblyDescriptor {
		i32 358816, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_138; uint8_t* data
	}, ; 138: Microsoft.SqlServer.Types
	%struct.CompressedAssemblyDescriptor {
		i32 774144, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_139; uint8_t* data
	}, ; 139: NetTopologySuite
	%struct.CompressedAssemblyDescriptor {
		i32 27136, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_140; uint8_t* data
	}, ; 140: NetTopologySuite.IO.SpatiaLite
	%struct.CompressedAssemblyDescriptor {
		i32 23040, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_141; uint8_t* data
	}, ; 141: NetTopologySuite.IO.SqlServerBytes
	%struct.CompressedAssemblyDescriptor {
		i32 712464, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_142; uint8_t* data
	}, ; 142: Newtonsoft.Json
	%struct.CompressedAssemblyDescriptor {
		i32 1030656, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_143; uint8_t* data
	}, ; 143: Npgsql
	%struct.CompressedAssemblyDescriptor {
		i32 660480, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_144; uint8_t* data
	}, ; 144: Npgsql.EntityFrameworkCore.PostgreSQL
	%struct.CompressedAssemblyDescriptor {
		i32 540264, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_145; uint8_t* data
	}, ; 145: Oracle.EntityFrameworkCore
	%struct.CompressedAssemblyDescriptor {
		i32 5261312, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_146; uint8_t* data
	}, ; 146: Oracle.ManagedDataAccess
	%struct.CompressedAssemblyDescriptor {
		i32 8192, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_147; uint8_t* data
	}, ; 147: Plainer.Maui
	%struct.CompressedAssemblyDescriptor {
		i32 432640, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_148; uint8_t* data
	}, ; 148: QuestPDF
	%struct.CompressedAssemblyDescriptor {
		i32 5632, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_149; uint8_t* data
	}, ; 149: SQLitePCLRaw.batteries_v2
	%struct.CompressedAssemblyDescriptor {
		i32 51200, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_150; uint8_t* data
	}, ; 150: SQLitePCLRaw.core
	%struct.CompressedAssemblyDescriptor {
		i32 5120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_151; uint8_t* data
	}, ; 151: SQLitePCLRaw.lib.e_sqlite3.android
	%struct.CompressedAssemblyDescriptor {
		i32 36864, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_152; uint8_t* data
	}, ; 152: SQLitePCLRaw.provider.e_sqlite3
	%struct.CompressedAssemblyDescriptor {
		i32 28608, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_153; uint8_t* data
	}, ; 153: System.ClientModel
	%struct.CompressedAssemblyDescriptor {
		i32 186496, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_154; uint8_t* data
	}, ; 154: System.CodeDom
	%struct.CompressedAssemblyDescriptor {
		i32 443168, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_155; uint8_t* data
	}, ; 155: System.Configuration.ConfigurationManager
	%struct.CompressedAssemblyDescriptor {
		i32 958744, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_156; uint8_t* data
	}, ; 156: System.Data.SqlClient
	%struct.CompressedAssemblyDescriptor {
		i32 5632, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_157; uint8_t* data
	}, ; 157: System.Diagnostics.EventLog
	%struct.CompressedAssemblyDescriptor {
		i32 8192, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_158; uint8_t* data
	}, ; 158: System.Diagnostics.PerformanceCounter
	%struct.CompressedAssemblyDescriptor {
		i32 81920, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_159; uint8_t* data
	}, ; 159: System.DirectoryServices.Protocols
	%struct.CompressedAssemblyDescriptor {
		i32 84000, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_160; uint8_t* data
	}, ; 160: System.IdentityModel.Tokens.Jwt
	%struct.CompressedAssemblyDescriptor {
		i32 1112720, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_161; uint8_t* data
	}, ; 161: System.Linq.Async
	%struct.CompressedAssemblyDescriptor {
		i32 8192, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_162; uint8_t* data
	}, ; 162: System.Management
	%struct.CompressedAssemblyDescriptor {
		i32 21368, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_163; uint8_t* data
	}, ; 163: System.Memory.Data
	%struct.CompressedAssemblyDescriptor {
		i32 48128, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_164; uint8_t* data
	}, ; 164: System.Security.Cryptography.Pkcs
	%struct.CompressedAssemblyDescriptor {
		i32 10752, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_165; uint8_t* data
	}, ; 165: System.Security.Cryptography.ProtectedData
	%struct.CompressedAssemblyDescriptor {
		i32 98816, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_166; uint8_t* data
	}, ; 166: UraniumUI
	%struct.CompressedAssemblyDescriptor {
		i32 215040, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_167; uint8_t* data
	}, ; 167: UraniumUI.Material
	%struct.CompressedAssemblyDescriptor {
		i32 59392, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_168; uint8_t* data
	}, ; 168: Xamarin.AndroidX.Activity
	%struct.CompressedAssemblyDescriptor {
		i32 515584, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_169; uint8_t* data
	}, ; 169: Xamarin.AndroidX.AppCompat
	%struct.CompressedAssemblyDescriptor {
		i32 15872, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_170; uint8_t* data
	}, ; 170: Xamarin.AndroidX.AppCompat.AppCompatResources
	%struct.CompressedAssemblyDescriptor {
		i32 49664, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_171; uint8_t* data
	}, ; 171: Xamarin.AndroidX.Browser
	%struct.CompressedAssemblyDescriptor {
		i32 449024, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_172; uint8_t* data
	}, ; 172: Xamarin.AndroidX.Camera.Core
	%struct.CompressedAssemblyDescriptor {
		i32 11776, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_173; uint8_t* data
	}, ; 173: Xamarin.AndroidX.Camera.Lifecycle
	%struct.CompressedAssemblyDescriptor {
		i32 65536, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_174; uint8_t* data
	}, ; 174: Xamarin.AndroidX.Camera.View
	%struct.CompressedAssemblyDescriptor {
		i32 16384, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_175; uint8_t* data
	}, ; 175: Xamarin.AndroidX.CardView
	%struct.CompressedAssemblyDescriptor {
		i32 19456, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_176; uint8_t* data
	}, ; 176: Xamarin.AndroidX.Collection.Jvm
	%struct.CompressedAssemblyDescriptor {
		i32 71680, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_177; uint8_t* data
	}, ; 177: Xamarin.AndroidX.CoordinatorLayout
	%struct.CompressedAssemblyDescriptor {
		i32 560128, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_178; uint8_t* data
	}, ; 178: Xamarin.AndroidX.Core
	%struct.CompressedAssemblyDescriptor {
		i32 24576, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_179; uint8_t* data
	}, ; 179: Xamarin.AndroidX.CursorAdapter
	%struct.CompressedAssemblyDescriptor {
		i32 9728, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_180; uint8_t* data
	}, ; 180: Xamarin.AndroidX.CustomView
	%struct.CompressedAssemblyDescriptor {
		i32 42496, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_181; uint8_t* data
	}, ; 181: Xamarin.AndroidX.DrawerLayout
	%struct.CompressedAssemblyDescriptor {
		i32 209920, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_182; uint8_t* data
	}, ; 182: Xamarin.AndroidX.Fragment
	%struct.CompressedAssemblyDescriptor {
		i32 5120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_183; uint8_t* data
	}, ; 183: Xamarin.AndroidX.Lifecycle.Common
	%struct.CompressedAssemblyDescriptor {
		i32 21504, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_184; uint8_t* data
	}, ; 184: Xamarin.AndroidX.Lifecycle.Common.Jvm
	%struct.CompressedAssemblyDescriptor {
		i32 17408, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_185; uint8_t* data
	}, ; 185: Xamarin.AndroidX.Lifecycle.LiveData.Core
	%struct.CompressedAssemblyDescriptor {
		i32 32256, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_186; uint8_t* data
	}, ; 186: Xamarin.AndroidX.Lifecycle.ViewModel.Android
	%struct.CompressedAssemblyDescriptor {
		i32 12800, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_187; uint8_t* data
	}, ; 187: Xamarin.AndroidX.Lifecycle.ViewModelSavedState
	%struct.CompressedAssemblyDescriptor {
		i32 36352, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_188; uint8_t* data
	}, ; 188: Xamarin.AndroidX.Loader
	%struct.CompressedAssemblyDescriptor {
		i32 89600, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_189; uint8_t* data
	}, ; 189: Xamarin.AndroidX.Navigation.Common
	%struct.CompressedAssemblyDescriptor {
		i32 18432, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_190; uint8_t* data
	}, ; 190: Xamarin.AndroidX.Navigation.Fragment
	%struct.CompressedAssemblyDescriptor {
		i32 58368, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_191; uint8_t* data
	}, ; 191: Xamarin.AndroidX.Navigation.Runtime
	%struct.CompressedAssemblyDescriptor {
		i32 28160, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_192; uint8_t* data
	}, ; 192: Xamarin.AndroidX.Navigation.UI
	%struct.CompressedAssemblyDescriptor {
		i32 405504, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_193; uint8_t* data
	}, ; 193: Xamarin.AndroidX.RecyclerView
	%struct.CompressedAssemblyDescriptor {
		i32 11264, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_194; uint8_t* data
	}, ; 194: Xamarin.AndroidX.SavedState
	%struct.CompressedAssemblyDescriptor {
		i32 23552, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_195; uint8_t* data
	}, ; 195: Xamarin.AndroidX.Security.SecurityCrypto
	%struct.CompressedAssemblyDescriptor {
		i32 37888, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_196; uint8_t* data
	}, ; 196: Xamarin.AndroidX.SwipeRefreshLayout
	%struct.CompressedAssemblyDescriptor {
		i32 57344, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_197; uint8_t* data
	}, ; 197: Xamarin.AndroidX.ViewPager
	%struct.CompressedAssemblyDescriptor {
		i32 38400, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_198; uint8_t* data
	}, ; 198: Xamarin.AndroidX.ViewPager2
	%struct.CompressedAssemblyDescriptor {
		i32 583168, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_199; uint8_t* data
	}, ; 199: Xamarin.Google.Android.Material
	%struct.CompressedAssemblyDescriptor {
		i32 310784, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_200; uint8_t* data
	}, ; 200: Xamarin.Google.Crypto.Tink.Android
	%struct.CompressedAssemblyDescriptor {
		i32 14336, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_201; uint8_t* data
	}, ; 201: Xamarin.Google.Guava.ListenableFuture
	%struct.CompressedAssemblyDescriptor {
		i32 86016, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_202; uint8_t* data
	}, ; 202: Xamarin.Kotlin.StdLib
	%struct.CompressedAssemblyDescriptor {
		i32 18432, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_203; uint8_t* data
	}, ; 203: Xamarin.KotlinX.Coroutines.Core.Jvm
	%struct.CompressedAssemblyDescriptor {
		i32 89600, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_204; uint8_t* data
	}, ; 204: Xamarin.KotlinX.Serialization.Core.Jvm
	%struct.CompressedAssemblyDescriptor {
		i32 505856, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_205; uint8_t* data
	}, ; 205: zxing
	%struct.CompressedAssemblyDescriptor {
		i32 52224, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_206; uint8_t* data
	}, ; 206: ZXing.Net.MAUI
	%struct.CompressedAssemblyDescriptor {
		i32 30208, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_207; uint8_t* data
	}, ; 207: ZXing.Net.MAUI.Controls
	%struct.CompressedAssemblyDescriptor {
		i32 1426432, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_208; uint8_t* data
	}, ; 208: store
	%struct.CompressedAssemblyDescriptor {
		i32 254464, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_209; uint8_t* data
	}, ; 209: Microsoft.CSharp
	%struct.CompressedAssemblyDescriptor {
		i32 5120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_210; uint8_t* data
	}, ; 210: Microsoft.Win32.Primitives
	%struct.CompressedAssemblyDescriptor {
		i32 4608, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_211; uint8_t* data
	}, ; 211: System.AppContext
	%struct.CompressedAssemblyDescriptor {
		i32 4608, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_212; uint8_t* data
	}, ; 212: System.Buffers
	%struct.CompressedAssemblyDescriptor {
		i32 40448, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_213; uint8_t* data
	}, ; 213: System.Collections.Concurrent
	%struct.CompressedAssemblyDescriptor {
		i32 84480, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_214; uint8_t* data
	}, ; 214: System.Collections.Immutable
	%struct.CompressedAssemblyDescriptor {
		i32 24064, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_215; uint8_t* data
	}, ; 215: System.Collections.NonGeneric
	%struct.CompressedAssemblyDescriptor {
		i32 26112, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_216; uint8_t* data
	}, ; 216: System.Collections.Specialized
	%struct.CompressedAssemblyDescriptor {
		i32 79360, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_217; uint8_t* data
	}, ; 217: System.Collections
	%struct.CompressedAssemblyDescriptor {
		i32 7168, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_218; uint8_t* data
	}, ; 218: System.ComponentModel.Annotations
	%struct.CompressedAssemblyDescriptor {
		i32 19456, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_219; uint8_t* data
	}, ; 219: System.ComponentModel.Primitives
	%struct.CompressedAssemblyDescriptor {
		i32 170496, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_220; uint8_t* data
	}, ; 220: System.ComponentModel.TypeConverter
	%struct.CompressedAssemblyDescriptor {
		i32 5632, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_221; uint8_t* data
	}, ; 221: System.ComponentModel
	%struct.CompressedAssemblyDescriptor {
		i32 12288, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_222; uint8_t* data
	}, ; 222: System.Console
	%struct.CompressedAssemblyDescriptor {
		i32 690688, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_223; uint8_t* data
	}, ; 223: System.Data.Common
	%struct.CompressedAssemblyDescriptor {
		i32 65024, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_224; uint8_t* data
	}, ; 224: System.Diagnostics.DiagnosticSource
	%struct.CompressedAssemblyDescriptor {
		i32 15360, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_225; uint8_t* data
	}, ; 225: System.Diagnostics.FileVersionInfo
	%struct.CompressedAssemblyDescriptor {
		i32 68608, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_226; uint8_t* data
	}, ; 226: System.Diagnostics.Process
	%struct.CompressedAssemblyDescriptor {
		i32 5120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_227; uint8_t* data
	}, ; 227: System.Diagnostics.StackTrace
	%struct.CompressedAssemblyDescriptor {
		i32 7168, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_228; uint8_t* data
	}, ; 228: System.Diagnostics.TextWriterTraceListener
	%struct.CompressedAssemblyDescriptor {
		i32 28672, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_229; uint8_t* data
	}, ; 229: System.Diagnostics.TraceSource
	%struct.CompressedAssemblyDescriptor {
		i32 5632, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_230; uint8_t* data
	}, ; 230: System.Diagnostics.Tracing
	%struct.CompressedAssemblyDescriptor {
		i32 40960, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_231; uint8_t* data
	}, ; 231: System.Drawing.Primitives
	%struct.CompressedAssemblyDescriptor {
		i32 5120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_232; uint8_t* data
	}, ; 232: System.Drawing
	%struct.CompressedAssemblyDescriptor {
		i32 61952, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_233; uint8_t* data
	}, ; 233: System.Formats.Asn1
	%struct.CompressedAssemblyDescriptor {
		i32 22016, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_234; uint8_t* data
	}, ; 234: System.IO.Compression.Brotli
	%struct.CompressedAssemblyDescriptor {
		i32 79872, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_235; uint8_t* data
	}, ; 235: System.IO.Compression
	%struct.CompressedAssemblyDescriptor {
		i32 7168, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_236; uint8_t* data
	}, ; 236: System.IO.FileSystem.AccessControl
	%struct.CompressedAssemblyDescriptor {
		i32 31744, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_237; uint8_t* data
	}, ; 237: System.IO.FileSystem.Watcher
	%struct.CompressedAssemblyDescriptor {
		i32 4608, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_238; uint8_t* data
	}, ; 238: System.IO.FileSystem
	%struct.CompressedAssemblyDescriptor {
		i32 24576, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_239; uint8_t* data
	}, ; 239: System.IO.MemoryMappedFiles
	%struct.CompressedAssemblyDescriptor {
		i32 28160, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_240; uint8_t* data
	}, ; 240: System.IO.Pipelines
	%struct.CompressedAssemblyDescriptor {
		i32 27648, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_241; uint8_t* data
	}, ; 241: System.IO.Pipes
	%struct.CompressedAssemblyDescriptor {
		i32 478208, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_242; uint8_t* data
	}, ; 242: System.Linq.Expressions
	%struct.CompressedAssemblyDescriptor {
		i32 53248, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_243; uint8_t* data
	}, ; 243: System.Linq.Queryable
	%struct.CompressedAssemblyDescriptor {
		i32 128000, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_244; uint8_t* data
	}, ; 244: System.Linq
	%struct.CompressedAssemblyDescriptor {
		i32 22528, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_245; uint8_t* data
	}, ; 245: System.Memory
	%struct.CompressedAssemblyDescriptor {
		i32 15872, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_246; uint8_t* data
	}, ; 246: System.Net.Http.Json
	%struct.CompressedAssemblyDescriptor {
		i32 412160, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_247; uint8_t* data
	}, ; 247: System.Net.Http
	%struct.CompressedAssemblyDescriptor {
		i32 66560, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_248; uint8_t* data
	}, ; 248: System.Net.HttpListener
	%struct.CompressedAssemblyDescriptor {
		i32 28672, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_249; uint8_t* data
	}, ; 249: System.Net.NameResolution
	%struct.CompressedAssemblyDescriptor {
		i32 29184, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_250; uint8_t* data
	}, ; 250: System.Net.NetworkInformation
	%struct.CompressedAssemblyDescriptor {
		i32 72704, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_251; uint8_t* data
	}, ; 251: System.Net.Primitives
	%struct.CompressedAssemblyDescriptor {
		i32 98304, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_252; uint8_t* data
	}, ; 252: System.Net.Requests
	%struct.CompressedAssemblyDescriptor {
		i32 173056, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_253; uint8_t* data
	}, ; 253: System.Net.Security
	%struct.CompressedAssemblyDescriptor {
		i32 131584, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_254; uint8_t* data
	}, ; 254: System.Net.Sockets
	%struct.CompressedAssemblyDescriptor {
		i32 12288, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_255; uint8_t* data
	}, ; 255: System.Net.WebClient
	%struct.CompressedAssemblyDescriptor {
		i32 16896, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_256; uint8_t* data
	}, ; 256: System.Net.WebHeaderCollection
	%struct.CompressedAssemblyDescriptor {
		i32 5120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_257; uint8_t* data
	}, ; 257: System.Numerics.Vectors
	%struct.CompressedAssemblyDescriptor {
		i32 20992, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_258; uint8_t* data
	}, ; 258: System.ObjectModel
	%struct.CompressedAssemblyDescriptor {
		i32 416256, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_259; uint8_t* data
	}, ; 259: System.Private.DataContractSerialization
	%struct.CompressedAssemblyDescriptor {
		i32 80896, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_260; uint8_t* data
	}, ; 260: System.Private.Uri
	%struct.CompressedAssemblyDescriptor {
		i32 60928, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_261; uint8_t* data
	}, ; 261: System.Private.Xml.Linq
	%struct.CompressedAssemblyDescriptor {
		i32 2349568, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_262; uint8_t* data
	}, ; 262: System.Private.Xml
	%struct.CompressedAssemblyDescriptor {
		i32 5120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_263; uint8_t* data
	}, ; 263: System.Reflection.Emit.ILGeneration
	%struct.CompressedAssemblyDescriptor {
		i32 5120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_264; uint8_t* data
	}, ; 264: System.Reflection.Emit.Lightweight
	%struct.CompressedAssemblyDescriptor {
		i32 107008, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_265; uint8_t* data
	}, ; 265: System.Reflection.Metadata
	%struct.CompressedAssemblyDescriptor {
		i32 5120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_266; uint8_t* data
	}, ; 266: System.Reflection.Primitives
	%struct.CompressedAssemblyDescriptor {
		i32 4608, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_267; uint8_t* data
	}, ; 267: System.Runtime.CompilerServices.Unsafe
	%struct.CompressedAssemblyDescriptor {
		i32 4608, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_268; uint8_t* data
	}, ; 268: System.Runtime.Extensions
	%struct.CompressedAssemblyDescriptor {
		i32 5120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_269; uint8_t* data
	}, ; 269: System.Runtime.InteropServices.RuntimeInformation
	%struct.CompressedAssemblyDescriptor {
		i32 9728, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_270; uint8_t* data
	}, ; 270: System.Runtime.InteropServices
	%struct.CompressedAssemblyDescriptor {
		i32 5632, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_271; uint8_t* data
	}, ; 271: System.Runtime.Intrinsics
	%struct.CompressedAssemblyDescriptor {
		i32 5120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_272; uint8_t* data
	}, ; 272: System.Runtime.Loader
	%struct.CompressedAssemblyDescriptor {
		i32 107008, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_273; uint8_t* data
	}, ; 273: System.Runtime.Numerics
	%struct.CompressedAssemblyDescriptor {
		i32 8192, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_274; uint8_t* data
	}, ; 274: System.Runtime.Serialization.Formatters
	%struct.CompressedAssemblyDescriptor {
		i32 5120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_275; uint8_t* data
	}, ; 275: System.Runtime.Serialization.Json
	%struct.CompressedAssemblyDescriptor {
		i32 8192, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_276; uint8_t* data
	}, ; 276: System.Runtime.Serialization.Primitives
	%struct.CompressedAssemblyDescriptor {
		i32 5120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_277; uint8_t* data
	}, ; 277: System.Runtime.Serialization.Xml
	%struct.CompressedAssemblyDescriptor {
		i32 20480, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_278; uint8_t* data
	}, ; 278: System.Runtime
	%struct.CompressedAssemblyDescriptor {
		i32 6656, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_279; uint8_t* data
	}, ; 279: System.Security.AccessControl
	%struct.CompressedAssemblyDescriptor {
		i32 13312, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_280; uint8_t* data
	}, ; 280: System.Security.Claims
	%struct.CompressedAssemblyDescriptor {
		i32 5120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_281; uint8_t* data
	}, ; 281: System.Security.Cryptography.Algorithms
	%struct.CompressedAssemblyDescriptor {
		i32 5120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_282; uint8_t* data
	}, ; 282: System.Security.Cryptography.Csp
	%struct.CompressedAssemblyDescriptor {
		i32 5120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_283; uint8_t* data
	}, ; 283: System.Security.Cryptography.Encoding
	%struct.CompressedAssemblyDescriptor {
		i32 5120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_284; uint8_t* data
	}, ; 284: System.Security.Cryptography.Primitives
	%struct.CompressedAssemblyDescriptor {
		i32 5632, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_285; uint8_t* data
	}, ; 285: System.Security.Cryptography.X509Certificates
	%struct.CompressedAssemblyDescriptor {
		i32 334848, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_286; uint8_t* data
	}, ; 286: System.Security.Cryptography
	%struct.CompressedAssemblyDescriptor {
		i32 5632, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_287; uint8_t* data
	}, ; 287: System.Security.Principal.Windows
	%struct.CompressedAssemblyDescriptor {
		i32 700416, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_288; uint8_t* data
	}, ; 288: System.Text.Encoding.CodePages
	%struct.CompressedAssemblyDescriptor {
		i32 5120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_289; uint8_t* data
	}, ; 289: System.Text.Encoding.Extensions
	%struct.CompressedAssemblyDescriptor {
		i32 31744, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_290; uint8_t* data
	}, ; 290: System.Text.Encodings.Web
	%struct.CompressedAssemblyDescriptor {
		i32 402944, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_291; uint8_t* data
	}, ; 291: System.Text.Json
	%struct.CompressedAssemblyDescriptor {
		i32 327168, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_292; uint8_t* data
	}, ; 292: System.Text.RegularExpressions
	%struct.CompressedAssemblyDescriptor {
		i32 30208, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_293; uint8_t* data
	}, ; 293: System.Threading.Channels
	%struct.CompressedAssemblyDescriptor {
		i32 5120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_294; uint8_t* data
	}, ; 294: System.Threading.Tasks.Extensions
	%struct.CompressedAssemblyDescriptor {
		i32 5120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_295; uint8_t* data
	}, ; 295: System.Threading.Thread
	%struct.CompressedAssemblyDescriptor {
		i32 5120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_296; uint8_t* data
	}, ; 296: System.Threading.ThreadPool
	%struct.CompressedAssemblyDescriptor {
		i32 11264, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_297; uint8_t* data
	}, ; 297: System.Threading
	%struct.CompressedAssemblyDescriptor {
		i32 76288, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_298; uint8_t* data
	}, ; 298: System.Transactions.Local
	%struct.CompressedAssemblyDescriptor {
		i32 11264, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_299; uint8_t* data
	}, ; 299: System.Web.HttpUtility
	%struct.CompressedAssemblyDescriptor {
		i32 4608, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_300; uint8_t* data
	}, ; 300: System.Xml.Linq
	%struct.CompressedAssemblyDescriptor {
		i32 6656, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_301; uint8_t* data
	}, ; 301: System.Xml.ReaderWriter
	%struct.CompressedAssemblyDescriptor {
		i32 5120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_302; uint8_t* data
	}, ; 302: System.Xml.XDocument
	%struct.CompressedAssemblyDescriptor {
		i32 5120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_303; uint8_t* data
	}, ; 303: System.Xml.XmlSerializer
	%struct.CompressedAssemblyDescriptor {
		i32 4608, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_304; uint8_t* data
	}, ; 304: System
	%struct.CompressedAssemblyDescriptor {
		i32 20480, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_305; uint8_t* data
	}, ; 305: netstandard
	%struct.CompressedAssemblyDescriptor {
		i32 2698752, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_306; uint8_t* data
	}, ; 306: System.Private.CoreLib
	%struct.CompressedAssemblyDescriptor {
		i32 167424, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_307; uint8_t* data
	}, ; 307: Java.Interop
	%struct.CompressedAssemblyDescriptor {
		i32 18992, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_308; uint8_t* data
	}, ; 308: Mono.Android.Runtime
	%struct.CompressedAssemblyDescriptor {
		i32 1997824, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		ptr @__compressedAssemblyData_309; uint8_t* data
	} ; 309: Mono.Android
], align 16

@__compressedAssemblyData_0 = internal dso_local global [261240 x i8] zeroinitializer, align 16
@__compressedAssemblyData_1 = internal dso_local global [271480 x i8] zeroinitializer, align 16
@__compressedAssemblyData_2 = internal dso_local global [262776 x i8] zeroinitializer, align 16
@__compressedAssemblyData_3 = internal dso_local global [272504 x i8] zeroinitializer, align 16
@__compressedAssemblyData_4 = internal dso_local global [264312 x i8] zeroinitializer, align 16
@__compressedAssemblyData_5 = internal dso_local global [293512 x i8] zeroinitializer, align 16
@__compressedAssemblyData_6 = internal dso_local global [271480 x i8] zeroinitializer, align 16
@__compressedAssemblyData_7 = internal dso_local global [270456 x i8] zeroinitializer, align 16
@__compressedAssemblyData_8 = internal dso_local global [258696 x i8] zeroinitializer, align 16
@__compressedAssemblyData_9 = internal dso_local global [349816 x i8] zeroinitializer, align 16
@__compressedAssemblyData_10 = internal dso_local global [254072 x i8] zeroinitializer, align 16
@__compressedAssemblyData_11 = internal dso_local global [228984 x i8] zeroinitializer, align 16
@__compressedAssemblyData_12 = internal dso_local global [232568 x i8] zeroinitializer, align 16
@__compressedAssemblyData_13 = internal dso_local global [15392 x i8] zeroinitializer, align 16
@__compressedAssemblyData_14 = internal dso_local global [15392 x i8] zeroinitializer, align 16
@__compressedAssemblyData_15 = internal dso_local global [15384 x i8] zeroinitializer, align 16
@__compressedAssemblyData_16 = internal dso_local global [15392 x i8] zeroinitializer, align 16
@__compressedAssemblyData_17 = internal dso_local global [15392 x i8] zeroinitializer, align 16
@__compressedAssemblyData_18 = internal dso_local global [15392 x i8] zeroinitializer, align 16
@__compressedAssemblyData_19 = internal dso_local global [15392 x i8] zeroinitializer, align 16
@__compressedAssemblyData_20 = internal dso_local global [15392 x i8] zeroinitializer, align 16
@__compressedAssemblyData_21 = internal dso_local global [15392 x i8] zeroinitializer, align 16
@__compressedAssemblyData_22 = internal dso_local global [15392 x i8] zeroinitializer, align 16
@__compressedAssemblyData_23 = internal dso_local global [15392 x i8] zeroinitializer, align 16
@__compressedAssemblyData_24 = internal dso_local global [15392 x i8] zeroinitializer, align 16
@__compressedAssemblyData_25 = internal dso_local global [15392 x i8] zeroinitializer, align 16
@__compressedAssemblyData_26 = internal dso_local global [15392 x i8] zeroinitializer, align 16
@__compressedAssemblyData_27 = internal dso_local global [15392 x i8] zeroinitializer, align 16
@__compressedAssemblyData_28 = internal dso_local global [15392 x i8] zeroinitializer, align 16
@__compressedAssemblyData_29 = internal dso_local global [15392 x i8] zeroinitializer, align 16
@__compressedAssemblyData_30 = internal dso_local global [15384 x i8] zeroinitializer, align 16
@__compressedAssemblyData_31 = internal dso_local global [15384 x i8] zeroinitializer, align 16
@__compressedAssemblyData_32 = internal dso_local global [15392 x i8] zeroinitializer, align 16
@__compressedAssemblyData_33 = internal dso_local global [15392 x i8] zeroinitializer, align 16
@__compressedAssemblyData_34 = internal dso_local global [15392 x i8] zeroinitializer, align 16
@__compressedAssemblyData_35 = internal dso_local global [15392 x i8] zeroinitializer, align 16
@__compressedAssemblyData_36 = internal dso_local global [15392 x i8] zeroinitializer, align 16
@__compressedAssemblyData_37 = internal dso_local global [15392 x i8] zeroinitializer, align 16
@__compressedAssemblyData_38 = internal dso_local global [15392 x i8] zeroinitializer, align 16
@__compressedAssemblyData_39 = internal dso_local global [15392 x i8] zeroinitializer, align 16
@__compressedAssemblyData_40 = internal dso_local global [15392 x i8] zeroinitializer, align 16
@__compressedAssemblyData_41 = internal dso_local global [15392 x i8] zeroinitializer, align 16
@__compressedAssemblyData_42 = internal dso_local global [15392 x i8] zeroinitializer, align 16
@__compressedAssemblyData_43 = internal dso_local global [15392 x i8] zeroinitializer, align 16
@__compressedAssemblyData_44 = internal dso_local global [15392 x i8] zeroinitializer, align 16
@__compressedAssemblyData_45 = internal dso_local global [15384 x i8] zeroinitializer, align 16
@__compressedAssemblyData_46 = internal dso_local global [15392 x i8] zeroinitializer, align 16
@__compressedAssemblyData_47 = internal dso_local global [32672 x i8] zeroinitializer, align 16
@__compressedAssemblyData_48 = internal dso_local global [32672 x i8] zeroinitializer, align 16
@__compressedAssemblyData_49 = internal dso_local global [33184 x i8] zeroinitializer, align 16
@__compressedAssemblyData_50 = internal dso_local global [32672 x i8] zeroinitializer, align 16
@__compressedAssemblyData_51 = internal dso_local global [34720 x i8] zeroinitializer, align 16
@__compressedAssemblyData_52 = internal dso_local global [32672 x i8] zeroinitializer, align 16
@__compressedAssemblyData_53 = internal dso_local global [32672 x i8] zeroinitializer, align 16
@__compressedAssemblyData_54 = internal dso_local global [41888 x i8] zeroinitializer, align 16
@__compressedAssemblyData_55 = internal dso_local global [30112 x i8] zeroinitializer, align 16
@__compressedAssemblyData_56 = internal dso_local global [30112 x i8] zeroinitializer, align 16
@__compressedAssemblyData_57 = internal dso_local global [6144 x i8] zeroinitializer, align 16
@__compressedAssemblyData_58 = internal dso_local global [400936 x i8] zeroinitializer, align 16
@__compressedAssemblyData_59 = internal dso_local global [342960 x i8] zeroinitializer, align 16
@__compressedAssemblyData_60 = internal dso_local global [7072536 x i8] zeroinitializer, align 16
@__compressedAssemblyData_61 = internal dso_local global [40448 x i8] zeroinitializer, align 16
@__compressedAssemblyData_62 = internal dso_local global [47616 x i8] zeroinitializer, align 16
@__compressedAssemblyData_63 = internal dso_local global [9216 x i8] zeroinitializer, align 16
@__compressedAssemblyData_64 = internal dso_local global [181760 x i8] zeroinitializer, align 16
@__compressedAssemblyData_65 = internal dso_local global [49664 x i8] zeroinitializer, align 16
@__compressedAssemblyData_66 = internal dso_local global [55808 x i8] zeroinitializer, align 16
@__compressedAssemblyData_67 = internal dso_local global [43008 x i8] zeroinitializer, align 16
@__compressedAssemblyData_68 = internal dso_local global [46080 x i8] zeroinitializer, align 16
@__compressedAssemblyData_69 = internal dso_local global [296960 x i8] zeroinitializer, align 16
@__compressedAssemblyData_70 = internal dso_local global [437760 x i8] zeroinitializer, align 16
@__compressedAssemblyData_71 = internal dso_local global [79360 x i8] zeroinitializer, align 16
@__compressedAssemblyData_72 = internal dso_local global [203264 x i8] zeroinitializer, align 16
@__compressedAssemblyData_73 = internal dso_local global [26624 x i8] zeroinitializer, align 16
@__compressedAssemblyData_74 = internal dso_local global [83456 x i8] zeroinitializer, align 16
@__compressedAssemblyData_75 = internal dso_local global [233472 x i8] zeroinitializer, align 16
@__compressedAssemblyData_76 = internal dso_local global [85504 x i8] zeroinitializer, align 16
@__compressedAssemblyData_77 = internal dso_local global [180224 x i8] zeroinitializer, align 16
@__compressedAssemblyData_78 = internal dso_local global [308224 x i8] zeroinitializer, align 16
@__compressedAssemblyData_79 = internal dso_local global [35328 x i8] zeroinitializer, align 16
@__compressedAssemblyData_80 = internal dso_local global [62976 x i8] zeroinitializer, align 16
@__compressedAssemblyData_81 = internal dso_local global [388608 x i8] zeroinitializer, align 16
@__compressedAssemblyData_82 = internal dso_local global [21608 x i8] zeroinitializer, align 16
@__compressedAssemblyData_83 = internal dso_local global [70248 x i8] zeroinitializer, align 16
@__compressedAssemblyData_84 = internal dso_local global [262144 x i8] zeroinitializer, align 16
@__compressedAssemblyData_85 = internal dso_local global [6144 x i8] zeroinitializer, align 16
@__compressedAssemblyData_86 = internal dso_local global [100352 x i8] zeroinitializer, align 16
@__compressedAssemblyData_87 = internal dso_local global [155648 x i8] zeroinitializer, align 16
@__compressedAssemblyData_88 = internal dso_local global [23040 x i8] zeroinitializer, align 16
@__compressedAssemblyData_89 = internal dso_local global [197120 x i8] zeroinitializer, align 16
@__compressedAssemblyData_90 = internal dso_local global [1549824 x i8] zeroinitializer, align 16
@__compressedAssemblyData_91 = internal dso_local global [1046016 x i8] zeroinitializer, align 16
@__compressedAssemblyData_92 = internal dso_local global [437760 x i8] zeroinitializer, align 16
@__compressedAssemblyData_93 = internal dso_local global [114176 x i8] zeroinitializer, align 16
@__compressedAssemblyData_94 = internal dso_local global [58368 x i8] zeroinitializer, align 16
@__compressedAssemblyData_95 = internal dso_local global [285184 x i8] zeroinitializer, align 16
@__compressedAssemblyData_96 = internal dso_local global [403456 x i8] zeroinitializer, align 16
@__compressedAssemblyData_97 = internal dso_local global [144384 x i8] zeroinitializer, align 16
@__compressedAssemblyData_98 = internal dso_local global [81408 x i8] zeroinitializer, align 16
@__compressedAssemblyData_99 = internal dso_local global [280576 x i8] zeroinitializer, align 16
@__compressedAssemblyData_100 = internal dso_local global [15872 x i8] zeroinitializer, align 16
@__compressedAssemblyData_101 = internal dso_local global [6144 x i8] zeroinitializer, align 16
@__compressedAssemblyData_102 = internal dso_local global [2089080 x i8] zeroinitializer, align 16
@__compressedAssemblyData_103 = internal dso_local global [93184 x i8] zeroinitializer, align 16
@__compressedAssemblyData_104 = internal dso_local global [21488 x i8] zeroinitializer, align 16
@__compressedAssemblyData_105 = internal dso_local global [2692152 x i8] zeroinitializer, align 16
@__compressedAssemblyData_106 = internal dso_local global [16896 x i8] zeroinitializer, align 16
@__compressedAssemblyData_107 = internal dso_local global [2141768 x i8] zeroinitializer, align 16
@__compressedAssemblyData_108 = internal dso_local global [294984 x i8] zeroinitializer, align 16
@__compressedAssemblyData_109 = internal dso_local global [613920 x i8] zeroinitializer, align 16
@__compressedAssemblyData_110 = internal dso_local global [20552 x i8] zeroinitializer, align 16
@__compressedAssemblyData_111 = internal dso_local global [121416 x i8] zeroinitializer, align 16
@__compressedAssemblyData_112 = internal dso_local global [11776 x i8] zeroinitializer, align 16
@__compressedAssemblyData_113 = internal dso_local global [26624 x i8] zeroinitializer, align 16
@__compressedAssemblyData_114 = internal dso_local global [15872 x i8] zeroinitializer, align 16
@__compressedAssemblyData_115 = internal dso_local global [6656 x i8] zeroinitializer, align 16
@__compressedAssemblyData_116 = internal dso_local global [46592 x i8] zeroinitializer, align 16
@__compressedAssemblyData_117 = internal dso_local global [32768 x i8] zeroinitializer, align 16
@__compressedAssemblyData_118 = internal dso_local global [41472 x i8] zeroinitializer, align 16
@__compressedAssemblyData_119 = internal dso_local global [19968 x i8] zeroinitializer, align 16
@__compressedAssemblyData_120 = internal dso_local global [38400 x i8] zeroinitializer, align 16
@__compressedAssemblyData_121 = internal dso_local global [17920 x i8] zeroinitializer, align 16
@__compressedAssemblyData_122 = internal dso_local global [9216 x i8] zeroinitializer, align 16
@__compressedAssemblyData_123 = internal dso_local global [1624064 x i8] zeroinitializer, align 16
@__compressedAssemblyData_124 = internal dso_local global [66592 x i8] zeroinitializer, align 16
@__compressedAssemblyData_125 = internal dso_local global [7168 x i8] zeroinitializer, align 16
@__compressedAssemblyData_126 = internal dso_local global [132128 x i8] zeroinitializer, align 16
@__compressedAssemblyData_127 = internal dso_local global [17408 x i8] zeroinitializer, align 16
@__compressedAssemblyData_128 = internal dso_local global [40896 x i8] zeroinitializer, align 16
@__compressedAssemblyData_129 = internal dso_local global [120352 x i8] zeroinitializer, align 16
@__compressedAssemblyData_130 = internal dso_local global [290752 x i8] zeroinitializer, align 16
@__compressedAssemblyData_131 = internal dso_local global [58880 x i8] zeroinitializer, align 16
@__compressedAssemblyData_132 = internal dso_local global [1868320 x i8] zeroinitializer, align 16
@__compressedAssemblyData_133 = internal dso_local global [128032 x i8] zeroinitializer, align 16
@__compressedAssemblyData_134 = internal dso_local global [792096 x i8] zeroinitializer, align 16
@__compressedAssemblyData_135 = internal dso_local global [76800 x i8] zeroinitializer, align 16
@__compressedAssemblyData_136 = internal dso_local global [207392 x i8] zeroinitializer, align 16
@__compressedAssemblyData_137 = internal dso_local global [23976 x i8] zeroinitializer, align 16
@__compressedAssemblyData_138 = internal dso_local global [358816 x i8] zeroinitializer, align 16
@__compressedAssemblyData_139 = internal dso_local global [774144 x i8] zeroinitializer, align 16
@__compressedAssemblyData_140 = internal dso_local global [27136 x i8] zeroinitializer, align 16
@__compressedAssemblyData_141 = internal dso_local global [23040 x i8] zeroinitializer, align 16
@__compressedAssemblyData_142 = internal dso_local global [712464 x i8] zeroinitializer, align 16
@__compressedAssemblyData_143 = internal dso_local global [1030656 x i8] zeroinitializer, align 16
@__compressedAssemblyData_144 = internal dso_local global [660480 x i8] zeroinitializer, align 16
@__compressedAssemblyData_145 = internal dso_local global [540264 x i8] zeroinitializer, align 16
@__compressedAssemblyData_146 = internal dso_local global [5261312 x i8] zeroinitializer, align 16
@__compressedAssemblyData_147 = internal dso_local global [8192 x i8] zeroinitializer, align 16
@__compressedAssemblyData_148 = internal dso_local global [432640 x i8] zeroinitializer, align 16
@__compressedAssemblyData_149 = internal dso_local global [5632 x i8] zeroinitializer, align 16
@__compressedAssemblyData_150 = internal dso_local global [51200 x i8] zeroinitializer, align 16
@__compressedAssemblyData_151 = internal dso_local global [5120 x i8] zeroinitializer, align 16
@__compressedAssemblyData_152 = internal dso_local global [36864 x i8] zeroinitializer, align 16
@__compressedAssemblyData_153 = internal dso_local global [28608 x i8] zeroinitializer, align 16
@__compressedAssemblyData_154 = internal dso_local global [186496 x i8] zeroinitializer, align 16
@__compressedAssemblyData_155 = internal dso_local global [443168 x i8] zeroinitializer, align 16
@__compressedAssemblyData_156 = internal dso_local global [958744 x i8] zeroinitializer, align 16
@__compressedAssemblyData_157 = internal dso_local global [5632 x i8] zeroinitializer, align 16
@__compressedAssemblyData_158 = internal dso_local global [8192 x i8] zeroinitializer, align 16
@__compressedAssemblyData_159 = internal dso_local global [81920 x i8] zeroinitializer, align 16
@__compressedAssemblyData_160 = internal dso_local global [84000 x i8] zeroinitializer, align 16
@__compressedAssemblyData_161 = internal dso_local global [1112720 x i8] zeroinitializer, align 16
@__compressedAssemblyData_162 = internal dso_local global [8192 x i8] zeroinitializer, align 16
@__compressedAssemblyData_163 = internal dso_local global [21368 x i8] zeroinitializer, align 16
@__compressedAssemblyData_164 = internal dso_local global [48128 x i8] zeroinitializer, align 16
@__compressedAssemblyData_165 = internal dso_local global [10752 x i8] zeroinitializer, align 16
@__compressedAssemblyData_166 = internal dso_local global [98816 x i8] zeroinitializer, align 16
@__compressedAssemblyData_167 = internal dso_local global [215040 x i8] zeroinitializer, align 16
@__compressedAssemblyData_168 = internal dso_local global [59392 x i8] zeroinitializer, align 16
@__compressedAssemblyData_169 = internal dso_local global [515584 x i8] zeroinitializer, align 16
@__compressedAssemblyData_170 = internal dso_local global [15872 x i8] zeroinitializer, align 16
@__compressedAssemblyData_171 = internal dso_local global [49664 x i8] zeroinitializer, align 16
@__compressedAssemblyData_172 = internal dso_local global [449024 x i8] zeroinitializer, align 16
@__compressedAssemblyData_173 = internal dso_local global [11776 x i8] zeroinitializer, align 16
@__compressedAssemblyData_174 = internal dso_local global [65536 x i8] zeroinitializer, align 16
@__compressedAssemblyData_175 = internal dso_local global [16384 x i8] zeroinitializer, align 16
@__compressedAssemblyData_176 = internal dso_local global [19456 x i8] zeroinitializer, align 16
@__compressedAssemblyData_177 = internal dso_local global [71680 x i8] zeroinitializer, align 16
@__compressedAssemblyData_178 = internal dso_local global [560128 x i8] zeroinitializer, align 16
@__compressedAssemblyData_179 = internal dso_local global [24576 x i8] zeroinitializer, align 16
@__compressedAssemblyData_180 = internal dso_local global [9728 x i8] zeroinitializer, align 16
@__compressedAssemblyData_181 = internal dso_local global [42496 x i8] zeroinitializer, align 16
@__compressedAssemblyData_182 = internal dso_local global [209920 x i8] zeroinitializer, align 16
@__compressedAssemblyData_183 = internal dso_local global [5120 x i8] zeroinitializer, align 16
@__compressedAssemblyData_184 = internal dso_local global [21504 x i8] zeroinitializer, align 16
@__compressedAssemblyData_185 = internal dso_local global [17408 x i8] zeroinitializer, align 16
@__compressedAssemblyData_186 = internal dso_local global [32256 x i8] zeroinitializer, align 16
@__compressedAssemblyData_187 = internal dso_local global [12800 x i8] zeroinitializer, align 16
@__compressedAssemblyData_188 = internal dso_local global [36352 x i8] zeroinitializer, align 16
@__compressedAssemblyData_189 = internal dso_local global [89600 x i8] zeroinitializer, align 16
@__compressedAssemblyData_190 = internal dso_local global [18432 x i8] zeroinitializer, align 16
@__compressedAssemblyData_191 = internal dso_local global [58368 x i8] zeroinitializer, align 16
@__compressedAssemblyData_192 = internal dso_local global [28160 x i8] zeroinitializer, align 16
@__compressedAssemblyData_193 = internal dso_local global [405504 x i8] zeroinitializer, align 16
@__compressedAssemblyData_194 = internal dso_local global [11264 x i8] zeroinitializer, align 16
@__compressedAssemblyData_195 = internal dso_local global [23552 x i8] zeroinitializer, align 16
@__compressedAssemblyData_196 = internal dso_local global [37888 x i8] zeroinitializer, align 16
@__compressedAssemblyData_197 = internal dso_local global [57344 x i8] zeroinitializer, align 16
@__compressedAssemblyData_198 = internal dso_local global [38400 x i8] zeroinitializer, align 16
@__compressedAssemblyData_199 = internal dso_local global [583168 x i8] zeroinitializer, align 16
@__compressedAssemblyData_200 = internal dso_local global [310784 x i8] zeroinitializer, align 16
@__compressedAssemblyData_201 = internal dso_local global [14336 x i8] zeroinitializer, align 16
@__compressedAssemblyData_202 = internal dso_local global [86016 x i8] zeroinitializer, align 16
@__compressedAssemblyData_203 = internal dso_local global [18432 x i8] zeroinitializer, align 16
@__compressedAssemblyData_204 = internal dso_local global [89600 x i8] zeroinitializer, align 16
@__compressedAssemblyData_205 = internal dso_local global [505856 x i8] zeroinitializer, align 16
@__compressedAssemblyData_206 = internal dso_local global [52224 x i8] zeroinitializer, align 16
@__compressedAssemblyData_207 = internal dso_local global [30208 x i8] zeroinitializer, align 16
@__compressedAssemblyData_208 = internal dso_local global [1426432 x i8] zeroinitializer, align 16
@__compressedAssemblyData_209 = internal dso_local global [254464 x i8] zeroinitializer, align 16
@__compressedAssemblyData_210 = internal dso_local global [5120 x i8] zeroinitializer, align 16
@__compressedAssemblyData_211 = internal dso_local global [4608 x i8] zeroinitializer, align 16
@__compressedAssemblyData_212 = internal dso_local global [4608 x i8] zeroinitializer, align 16
@__compressedAssemblyData_213 = internal dso_local global [40448 x i8] zeroinitializer, align 16
@__compressedAssemblyData_214 = internal dso_local global [84480 x i8] zeroinitializer, align 16
@__compressedAssemblyData_215 = internal dso_local global [24064 x i8] zeroinitializer, align 16
@__compressedAssemblyData_216 = internal dso_local global [26112 x i8] zeroinitializer, align 16
@__compressedAssemblyData_217 = internal dso_local global [79360 x i8] zeroinitializer, align 16
@__compressedAssemblyData_218 = internal dso_local global [7168 x i8] zeroinitializer, align 16
@__compressedAssemblyData_219 = internal dso_local global [19456 x i8] zeroinitializer, align 16
@__compressedAssemblyData_220 = internal dso_local global [170496 x i8] zeroinitializer, align 16
@__compressedAssemblyData_221 = internal dso_local global [5632 x i8] zeroinitializer, align 16
@__compressedAssemblyData_222 = internal dso_local global [12288 x i8] zeroinitializer, align 16
@__compressedAssemblyData_223 = internal dso_local global [690688 x i8] zeroinitializer, align 16
@__compressedAssemblyData_224 = internal dso_local global [65024 x i8] zeroinitializer, align 16
@__compressedAssemblyData_225 = internal dso_local global [15360 x i8] zeroinitializer, align 16
@__compressedAssemblyData_226 = internal dso_local global [68608 x i8] zeroinitializer, align 16
@__compressedAssemblyData_227 = internal dso_local global [5120 x i8] zeroinitializer, align 16
@__compressedAssemblyData_228 = internal dso_local global [7168 x i8] zeroinitializer, align 16
@__compressedAssemblyData_229 = internal dso_local global [28672 x i8] zeroinitializer, align 16
@__compressedAssemblyData_230 = internal dso_local global [5632 x i8] zeroinitializer, align 16
@__compressedAssemblyData_231 = internal dso_local global [40960 x i8] zeroinitializer, align 16
@__compressedAssemblyData_232 = internal dso_local global [5120 x i8] zeroinitializer, align 16
@__compressedAssemblyData_233 = internal dso_local global [61952 x i8] zeroinitializer, align 16
@__compressedAssemblyData_234 = internal dso_local global [22016 x i8] zeroinitializer, align 16
@__compressedAssemblyData_235 = internal dso_local global [79872 x i8] zeroinitializer, align 16
@__compressedAssemblyData_236 = internal dso_local global [7168 x i8] zeroinitializer, align 16
@__compressedAssemblyData_237 = internal dso_local global [31744 x i8] zeroinitializer, align 16
@__compressedAssemblyData_238 = internal dso_local global [4608 x i8] zeroinitializer, align 16
@__compressedAssemblyData_239 = internal dso_local global [24576 x i8] zeroinitializer, align 16
@__compressedAssemblyData_240 = internal dso_local global [28160 x i8] zeroinitializer, align 16
@__compressedAssemblyData_241 = internal dso_local global [27648 x i8] zeroinitializer, align 16
@__compressedAssemblyData_242 = internal dso_local global [478208 x i8] zeroinitializer, align 16
@__compressedAssemblyData_243 = internal dso_local global [53248 x i8] zeroinitializer, align 16
@__compressedAssemblyData_244 = internal dso_local global [128000 x i8] zeroinitializer, align 16
@__compressedAssemblyData_245 = internal dso_local global [22528 x i8] zeroinitializer, align 16
@__compressedAssemblyData_246 = internal dso_local global [15872 x i8] zeroinitializer, align 16
@__compressedAssemblyData_247 = internal dso_local global [412160 x i8] zeroinitializer, align 16
@__compressedAssemblyData_248 = internal dso_local global [66560 x i8] zeroinitializer, align 16
@__compressedAssemblyData_249 = internal dso_local global [28672 x i8] zeroinitializer, align 16
@__compressedAssemblyData_250 = internal dso_local global [29184 x i8] zeroinitializer, align 16
@__compressedAssemblyData_251 = internal dso_local global [72704 x i8] zeroinitializer, align 16
@__compressedAssemblyData_252 = internal dso_local global [98304 x i8] zeroinitializer, align 16
@__compressedAssemblyData_253 = internal dso_local global [173056 x i8] zeroinitializer, align 16
@__compressedAssemblyData_254 = internal dso_local global [131584 x i8] zeroinitializer, align 16
@__compressedAssemblyData_255 = internal dso_local global [12288 x i8] zeroinitializer, align 16
@__compressedAssemblyData_256 = internal dso_local global [16896 x i8] zeroinitializer, align 16
@__compressedAssemblyData_257 = internal dso_local global [5120 x i8] zeroinitializer, align 16
@__compressedAssemblyData_258 = internal dso_local global [20992 x i8] zeroinitializer, align 16
@__compressedAssemblyData_259 = internal dso_local global [416256 x i8] zeroinitializer, align 16
@__compressedAssemblyData_260 = internal dso_local global [80896 x i8] zeroinitializer, align 16
@__compressedAssemblyData_261 = internal dso_local global [60928 x i8] zeroinitializer, align 16
@__compressedAssemblyData_262 = internal dso_local global [2349568 x i8] zeroinitializer, align 16
@__compressedAssemblyData_263 = internal dso_local global [5120 x i8] zeroinitializer, align 16
@__compressedAssemblyData_264 = internal dso_local global [5120 x i8] zeroinitializer, align 16
@__compressedAssemblyData_265 = internal dso_local global [107008 x i8] zeroinitializer, align 16
@__compressedAssemblyData_266 = internal dso_local global [5120 x i8] zeroinitializer, align 16
@__compressedAssemblyData_267 = internal dso_local global [4608 x i8] zeroinitializer, align 16
@__compressedAssemblyData_268 = internal dso_local global [4608 x i8] zeroinitializer, align 16
@__compressedAssemblyData_269 = internal dso_local global [5120 x i8] zeroinitializer, align 16
@__compressedAssemblyData_270 = internal dso_local global [9728 x i8] zeroinitializer, align 16
@__compressedAssemblyData_271 = internal dso_local global [5632 x i8] zeroinitializer, align 16
@__compressedAssemblyData_272 = internal dso_local global [5120 x i8] zeroinitializer, align 16
@__compressedAssemblyData_273 = internal dso_local global [107008 x i8] zeroinitializer, align 16
@__compressedAssemblyData_274 = internal dso_local global [8192 x i8] zeroinitializer, align 16
@__compressedAssemblyData_275 = internal dso_local global [5120 x i8] zeroinitializer, align 16
@__compressedAssemblyData_276 = internal dso_local global [8192 x i8] zeroinitializer, align 16
@__compressedAssemblyData_277 = internal dso_local global [5120 x i8] zeroinitializer, align 16
@__compressedAssemblyData_278 = internal dso_local global [20480 x i8] zeroinitializer, align 16
@__compressedAssemblyData_279 = internal dso_local global [6656 x i8] zeroinitializer, align 16
@__compressedAssemblyData_280 = internal dso_local global [13312 x i8] zeroinitializer, align 16
@__compressedAssemblyData_281 = internal dso_local global [5120 x i8] zeroinitializer, align 16
@__compressedAssemblyData_282 = internal dso_local global [5120 x i8] zeroinitializer, align 16
@__compressedAssemblyData_283 = internal dso_local global [5120 x i8] zeroinitializer, align 16
@__compressedAssemblyData_284 = internal dso_local global [5120 x i8] zeroinitializer, align 16
@__compressedAssemblyData_285 = internal dso_local global [5632 x i8] zeroinitializer, align 16
@__compressedAssemblyData_286 = internal dso_local global [334848 x i8] zeroinitializer, align 16
@__compressedAssemblyData_287 = internal dso_local global [5632 x i8] zeroinitializer, align 16
@__compressedAssemblyData_288 = internal dso_local global [700416 x i8] zeroinitializer, align 16
@__compressedAssemblyData_289 = internal dso_local global [5120 x i8] zeroinitializer, align 16
@__compressedAssemblyData_290 = internal dso_local global [31744 x i8] zeroinitializer, align 16
@__compressedAssemblyData_291 = internal dso_local global [402944 x i8] zeroinitializer, align 16
@__compressedAssemblyData_292 = internal dso_local global [327168 x i8] zeroinitializer, align 16
@__compressedAssemblyData_293 = internal dso_local global [30208 x i8] zeroinitializer, align 16
@__compressedAssemblyData_294 = internal dso_local global [5120 x i8] zeroinitializer, align 16
@__compressedAssemblyData_295 = internal dso_local global [5120 x i8] zeroinitializer, align 16
@__compressedAssemblyData_296 = internal dso_local global [5120 x i8] zeroinitializer, align 16
@__compressedAssemblyData_297 = internal dso_local global [11264 x i8] zeroinitializer, align 16
@__compressedAssemblyData_298 = internal dso_local global [76288 x i8] zeroinitializer, align 16
@__compressedAssemblyData_299 = internal dso_local global [11264 x i8] zeroinitializer, align 16
@__compressedAssemblyData_300 = internal dso_local global [4608 x i8] zeroinitializer, align 16
@__compressedAssemblyData_301 = internal dso_local global [6656 x i8] zeroinitializer, align 16
@__compressedAssemblyData_302 = internal dso_local global [5120 x i8] zeroinitializer, align 16
@__compressedAssemblyData_303 = internal dso_local global [5120 x i8] zeroinitializer, align 16
@__compressedAssemblyData_304 = internal dso_local global [4608 x i8] zeroinitializer, align 16
@__compressedAssemblyData_305 = internal dso_local global [20480 x i8] zeroinitializer, align 16
@__compressedAssemblyData_306 = internal dso_local global [2698752 x i8] zeroinitializer, align 16
@__compressedAssemblyData_307 = internal dso_local global [167424 x i8] zeroinitializer, align 16
@__compressedAssemblyData_308 = internal dso_local global [18992 x i8] zeroinitializer, align 16
@__compressedAssemblyData_309 = internal dso_local global [1997824 x i8] zeroinitializer, align 16

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
