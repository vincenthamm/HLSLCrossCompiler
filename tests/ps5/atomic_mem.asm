//
// Generated by Microsoft (R) HLSL Shader Compiler 9.30.9200.20499
//
//
///
// Buffer Definitions: 
//
// Resource bind info for BufferOut
// {
//
//   struct MyStruct
//   {
//       
//       uint pixDiff;                  // Offset:    0
//       uint pixDiff2;                 // Offset:    4
//
//   } $Element;                        // Offset:    0 Size:     8
//
// }
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim Slot Elements
// ------------------------------ ---------- ------- ----------- ---- --------
// TextureSampler                    sampler      NA          NA    0        1
// TextureA                          texture  float4          2d    0        1
// TextureB                          texture  float4          2d    1        1
// BufferOut                             UAV  struct         r/w    1        1
//
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// TEXCOORD                 0   xyzw        0     NONE   float   xy  
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_Target                0   xyzw        0   TARGET   float   xyzw
//
ps_5_0
dcl_globalFlags refactoringAllowed
dcl_sampler s0, mode_default
dcl_resource_texture2d (float,float,float,float) t0
dcl_resource_texture2d (float,float,float,float) t1
dcl_uav_structured u1, 8
dcl_input_ps linear v0.xy
dcl_output o0.xyzw
dcl_temps 2
sample_indexable(texture2d)(float,float,float,float) r0.xyzw, v0.xyxx, t0.xyzw, s0
sample_indexable(texture2d)(float,float,float,float) r1.xyzw, v0.xyxx, t1.xyzw, s0
add r0.xyzw, r0.xyzw, -r1.xyzw
dp4 r0.x, r0.xyzw, r0.xyzw
ne r0.x, r0.x, l(0.000000)
if_nz r0.x
  atomic_iadd u1, l(0, 0, 0, 0), l(1)
  atomic_iadd u1, l(0, 4, 0, 0), l(3)
endif 
mov o0.xyzw, l(1.000000,1.000000,1.000000,1.000000)
ret 
// Approximately 11 instruction slots used
