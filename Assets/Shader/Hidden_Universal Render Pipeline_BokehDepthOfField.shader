//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Universal Render Pipeline/BokehDepthOfField" {
Properties {
}
SubShader {
 LOD 100
 Tags { "RenderPipeline" = "UniversalPipeline" }
 Pass {
  Name "Bokeh Depth Of Field CoC"
  LOD 100
  Tags { "RenderPipeline" = "UniversalPipeline" }
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 12160
Program "vp" {
SubProgram "gles3 " {
"#ifdef VERTEX
#version 310 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
UNITY_BINDING(0) uniform UnityPerDraw {
	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	vec4 unity_LODFade;
	mediump vec4 unity_WorldTransformParams;
	mediump vec4 unity_LightData;
	mediump vec4 unity_LightIndices[2];
	vec4 unity_ProbesOcclusion;
	mediump vec4 unity_SpecCube0_HDR;
	vec4 unity_LightmapST;
	vec4 unity_DynamicLightmapST;
	mediump vec4 unity_SHAr;
	mediump vec4 unity_SHAg;
	mediump vec4 unity_SHAb;
	mediump vec4 unity_SHBr;
	mediump vec4 unity_SHBg;
	mediump vec4 unity_SHBb;
	mediump vec4 unity_SHC;
};
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
layout(location = 0) out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 310 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _SourceSize;
uniform 	vec4 _CoCParams;
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump float SV_Target0;
vec2 u_xlat0;
uvec4 u_xlatu0;
mediump float u_xlat16_1;
mediump float u_xlat16_3;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _SourceSize.xy;
    u_xlatu0.xy =  uvec2(ivec2(u_xlat0.xy));
    u_xlatu0.z = uint(0u);
    u_xlatu0.w = uint(0u);
    u_xlat0.x = texelFetch(_CameraDepthTexture, ivec2(u_xlatu0.xy), int(u_xlatu0.w)).x;
    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = _CoCParams.x / u_xlat0.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat0.x * _CoCParams.y;
    u_xlat16_1 = max(u_xlat0.x, -1.0);
    u_xlat16_3 = u_xlat0.x;
    u_xlat16_3 = clamp(u_xlat16_3, 0.0, 1.0);
    u_xlat16_1 = min(u_xlat16_1, 0.0);
    u_xlat16_1 = u_xlat16_1 + u_xlat16_3;
    u_xlat16_1 = u_xlat16_1 + 1.0;
    SV_Target0 = u_xlat16_1 * 0.5;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_USE_DRAW_PROCEDURAL" }
"#ifdef VERTEX
#version 310 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScaleBias;
layout(location = 0) out highp vec2 vs_TEXCOORD0;
int u_xlati0;
uvec2 u_xlatu0;
vec3 u_xlat1;
int u_xlati4;
void main()
{
    u_xlati0 = int(uint(gl_VertexID) & 1u);
    u_xlatu0.y = uint(gl_VertexID) >> 1u;
    u_xlati4 = (-u_xlati0) + (-int(u_xlatu0.y));
    u_xlati0 = u_xlati0 + int(u_xlatu0.y);
    u_xlatu0.x = uint(u_xlati0) & 1u;
    u_xlat1.xz = vec2(u_xlatu0.yx);
    vs_TEXCOORD0.xy = u_xlat1.xz * _ScaleBias.xy + _ScaleBias.zw;
    u_xlati0 = u_xlati4 + 1;
    u_xlatu0.x = uint(u_xlati0) & 1u;
    u_xlat1.y = float(u_xlatu0.x);
    gl_Position.xy = u_xlat1.xy * vec2(2.0, -2.0) + vec2(-1.0, 1.0);
    gl_Position.zw = vec2(-1.0, 1.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 310 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _SourceSize;
uniform 	vec4 _CoCParams;
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump float SV_Target0;
vec2 u_xlat0;
uvec4 u_xlatu0;
mediump float u_xlat16_1;
mediump float u_xlat16_3;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _SourceSize.xy;
    u_xlatu0.xy =  uvec2(ivec2(u_xlat0.xy));
    u_xlatu0.z = uint(0u);
    u_xlatu0.w = uint(0u);
    u_xlat0.x = texelFetch(_CameraDepthTexture, ivec2(u_xlatu0.xy), int(u_xlatu0.w)).x;
    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = _CoCParams.x / u_xlat0.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat0.x * _CoCParams.y;
    u_xlat16_1 = max(u_xlat0.x, -1.0);
    u_xlat16_3 = u_xlat0.x;
    u_xlat16_3 = clamp(u_xlat16_3, 0.0, 1.0);
    u_xlat16_1 = min(u_xlat16_1, 0.0);
    u_xlat16_1 = u_xlat16_1 + u_xlat16_3;
    u_xlat16_1 = u_xlat16_1 + 1.0;
    SV_Target0 = u_xlat16_1 * 0.5;
    return;
}

#endif
"
}
}
}
 Pass {
  Name "Bokeh Depth Of Field Prefilter"
  LOD 100
  Tags { "RenderPipeline" = "UniversalPipeline" }
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 125263
Program "vp" {
SubProgram "gles3 " {
"#ifdef VERTEX
#version 310 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
UNITY_BINDING(0) uniform UnityPerDraw {
	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	vec4 unity_LODFade;
	mediump vec4 unity_WorldTransformParams;
	mediump vec4 unity_LightData;
	mediump vec4 unity_LightIndices[2];
	vec4 unity_ProbesOcclusion;
	mediump vec4 unity_SpecCube0_HDR;
	vec4 unity_LightmapST;
	vec4 unity_DynamicLightmapST;
	mediump vec4 unity_SHAr;
	mediump vec4 unity_SHAg;
	mediump vec4 unity_SHAb;
	mediump vec4 unity_SHBr;
	mediump vec4 unity_SHBg;
	mediump vec4 unity_SHBb;
	mediump vec4 unity_SHC;
};
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
layout(location = 0) out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 310 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _SourceSize;
uniform 	vec4 _CoCParams;
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FullCoCTexture;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bvec3 u_xlatb0;
vec3 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
mediump float u_xlat16_26;
void main()
{
    u_xlat0 = textureGather(_SourceTex, vs_TEXCOORD0.xy);
    u_xlat1.x = u_xlat0.x;
    u_xlat2 = textureGather(_SourceTex, vs_TEXCOORD0.xy, 1).xzyw;
    u_xlat1.y = u_xlat2.x;
    u_xlat3 = textureGather(_SourceTex, vs_TEXCOORD0.xy, 2).xywz;
    u_xlat1.z = u_xlat3.x;
    u_xlat4.x = u_xlat0.y;
    u_xlat4.y = u_xlat2.z;
    u_xlat4.z = u_xlat3.y;
    u_xlat16_5.xyz = u_xlat1.xyz + u_xlat4.xyz;
    u_xlat2.x = u_xlat0.z;
    u_xlat3.x = u_xlat0.w;
    u_xlat3.y = u_xlat2.w;
    u_xlat2.z = u_xlat3.w;
    u_xlat16_5.xyz = u_xlat2.xyz + u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat3.xyz + u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat0 = textureGather(_FullCoCTexture, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat16_26 = min(u_xlat0.z, u_xlat0.y);
    u_xlat16_26 = min(u_xlat0.w, u_xlat16_26);
    u_xlat16_26 = min(u_xlat0.x, u_xlat16_26);
    u_xlat16_6.x = max(u_xlat0.z, u_xlat0.y);
    u_xlat16_6.x = max(u_xlat0.w, u_xlat16_6.x);
    u_xlat16_6.x = max(u_xlat0.x, u_xlat16_6.x);
    u_xlatb0.x = u_xlat16_6.x<(-u_xlat16_26);
    u_xlat16_26 = (u_xlatb0.x) ? u_xlat16_26 : u_xlat16_6.x;
    u_xlat0.x = u_xlat16_26 * _CoCParams.z;
    u_xlat7 = _SourceSize.w + _SourceSize.w;
    u_xlat7 = float(1.0) / u_xlat7;
    u_xlat7 = u_xlat7 * abs(u_xlat0.x);
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    SV_Target0.w = u_xlat0.x;
    u_xlat0.x = u_xlat7 * -2.0 + 3.0;
    u_xlat7 = u_xlat7 * u_xlat7;
    u_xlat0.x = u_xlat7 * u_xlat0.x;
    u_xlat16_6.xyz = u_xlat16_5.xyz * u_xlat0.xxx + vec3(0.0549999997, 0.0549999997, 0.0549999997);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_6.xyz * vec3(0.947867334, 0.947867334, 0.947867334);
    u_xlat16_5.xyz = log2(abs(u_xlat16_5.xyz));
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(2.4000001, 2.4000001, 2.4000001);
    u_xlat16_5.xyz = exp2(u_xlat16_5.xyz);
    u_xlat16_6.xyz = u_xlat0.xyz * vec3(0.0773993805, 0.0773993805, 0.0773993805);
    u_xlatb0.xyz = greaterThanEqual(vec4(0.0404499993, 0.0404499993, 0.0404499993, 0.0), u_xlat0.xyzx).xyz;
    SV_Target0.x = (u_xlatb0.x) ? u_xlat16_6.x : u_xlat16_5.x;
    SV_Target0.y = (u_xlatb0.y) ? u_xlat16_6.y : u_xlat16_5.y;
    SV_Target0.z = (u_xlatb0.z) ? u_xlat16_6.z : u_xlat16_5.z;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_USE_DRAW_PROCEDURAL" }
"#ifdef VERTEX
#version 310 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScaleBias;
layout(location = 0) out highp vec2 vs_TEXCOORD0;
int u_xlati0;
uvec2 u_xlatu0;
vec3 u_xlat1;
int u_xlati4;
void main()
{
    u_xlati0 = int(uint(gl_VertexID) & 1u);
    u_xlatu0.y = uint(gl_VertexID) >> 1u;
    u_xlati4 = (-u_xlati0) + (-int(u_xlatu0.y));
    u_xlati0 = u_xlati0 + int(u_xlatu0.y);
    u_xlatu0.x = uint(u_xlati0) & 1u;
    u_xlat1.xz = vec2(u_xlatu0.yx);
    vs_TEXCOORD0.xy = u_xlat1.xz * _ScaleBias.xy + _ScaleBias.zw;
    u_xlati0 = u_xlati4 + 1;
    u_xlatu0.x = uint(u_xlati0) & 1u;
    u_xlat1.y = float(u_xlatu0.x);
    gl_Position.xy = u_xlat1.xy * vec2(2.0, -2.0) + vec2(-1.0, 1.0);
    gl_Position.zw = vec2(-1.0, 1.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 310 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _SourceSize;
uniform 	vec4 _CoCParams;
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FullCoCTexture;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bvec3 u_xlatb0;
vec3 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
mediump float u_xlat16_26;
void main()
{
    u_xlat0 = textureGather(_SourceTex, vs_TEXCOORD0.xy);
    u_xlat1.x = u_xlat0.x;
    u_xlat2 = textureGather(_SourceTex, vs_TEXCOORD0.xy, 1).xzyw;
    u_xlat1.y = u_xlat2.x;
    u_xlat3 = textureGather(_SourceTex, vs_TEXCOORD0.xy, 2).xywz;
    u_xlat1.z = u_xlat3.x;
    u_xlat4.x = u_xlat0.y;
    u_xlat4.y = u_xlat2.z;
    u_xlat4.z = u_xlat3.y;
    u_xlat16_5.xyz = u_xlat1.xyz + u_xlat4.xyz;
    u_xlat2.x = u_xlat0.z;
    u_xlat3.x = u_xlat0.w;
    u_xlat3.y = u_xlat2.w;
    u_xlat2.z = u_xlat3.w;
    u_xlat16_5.xyz = u_xlat2.xyz + u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat3.xyz + u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat0 = textureGather(_FullCoCTexture, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat16_26 = min(u_xlat0.z, u_xlat0.y);
    u_xlat16_26 = min(u_xlat0.w, u_xlat16_26);
    u_xlat16_26 = min(u_xlat0.x, u_xlat16_26);
    u_xlat16_6.x = max(u_xlat0.z, u_xlat0.y);
    u_xlat16_6.x = max(u_xlat0.w, u_xlat16_6.x);
    u_xlat16_6.x = max(u_xlat0.x, u_xlat16_6.x);
    u_xlatb0.x = u_xlat16_6.x<(-u_xlat16_26);
    u_xlat16_26 = (u_xlatb0.x) ? u_xlat16_26 : u_xlat16_6.x;
    u_xlat0.x = u_xlat16_26 * _CoCParams.z;
    u_xlat7 = _SourceSize.w + _SourceSize.w;
    u_xlat7 = float(1.0) / u_xlat7;
    u_xlat7 = u_xlat7 * abs(u_xlat0.x);
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    SV_Target0.w = u_xlat0.x;
    u_xlat0.x = u_xlat7 * -2.0 + 3.0;
    u_xlat7 = u_xlat7 * u_xlat7;
    u_xlat0.x = u_xlat7 * u_xlat0.x;
    u_xlat16_6.xyz = u_xlat16_5.xyz * u_xlat0.xxx + vec3(0.0549999997, 0.0549999997, 0.0549999997);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_6.xyz * vec3(0.947867334, 0.947867334, 0.947867334);
    u_xlat16_5.xyz = log2(abs(u_xlat16_5.xyz));
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(2.4000001, 2.4000001, 2.4000001);
    u_xlat16_5.xyz = exp2(u_xlat16_5.xyz);
    u_xlat16_6.xyz = u_xlat0.xyz * vec3(0.0773993805, 0.0773993805, 0.0773993805);
    u_xlatb0.xyz = greaterThanEqual(vec4(0.0404499993, 0.0404499993, 0.0404499993, 0.0), u_xlat0.xyzx).xyz;
    SV_Target0.x = (u_xlatb0.x) ? u_xlat16_6.x : u_xlat16_5.x;
    SV_Target0.y = (u_xlatb0.y) ? u_xlat16_6.y : u_xlat16_5.y;
    SV_Target0.z = (u_xlatb0.z) ? u_xlat16_6.z : u_xlat16_5.z;
    return;
}

#endif
"
}
}
}
 Pass {
  Name "Bokeh Depth Of Field Blur"
  LOD 100
  Tags { "RenderPipeline" = "UniversalPipeline" }
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 174043
Program "vp" {
SubProgram "gles3 " {
"#ifdef VERTEX
#version 310 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
UNITY_BINDING(0) uniform UnityPerDraw {
	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	vec4 unity_LODFade;
	mediump vec4 unity_WorldTransformParams;
	mediump vec4 unity_LightData;
	mediump vec4 unity_LightIndices[2];
	vec4 unity_ProbesOcclusion;
	mediump vec4 unity_SpecCube0_HDR;
	vec4 unity_LightmapST;
	vec4 unity_DynamicLightmapST;
	mediump vec4 unity_SHAr;
	mediump vec4 unity_SHAg;
	mediump vec4 unity_SHAb;
	mediump vec4 unity_SHBr;
	mediump vec4 unity_SHBg;
	mediump vec4 unity_SHBb;
	mediump vec4 unity_SHC;
};
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
layout(location = 0) out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 310 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _SourceSize;
uniform 	vec4 _DownSampleScaleFactor;
uniform 	vec4 _CoCParams;
uniform 	vec4 _BokehKernel[42];
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat10_0;
int u_xlati0;
bool u_xlatb0;
float u_xlat1;
mediump float u_xlat16_1;
float u_xlat2;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat10_7;
mediump vec4 u_xlat16_8;
mediump vec4 u_xlat16_9;
float u_xlat10;
bool u_xlatb10;
float u_xlat11;
float u_xlat12;
bool u_xlatb12;
float u_xlat20;
bool u_xlatb20;
float u_xlat21;
mediump float u_xlat16_33;
float u_xlat38;
float u_xlat39;
void main()
{
    u_xlat10_0 = texture(_SourceTex, vs_TEXCOORD0.xy);
    u_xlat1 = max(u_xlat10_0.w, 0.0);
    u_xlat11 = _SourceSize.w * _DownSampleScaleFactor.w;
    u_xlat21 = u_xlat11 + u_xlat11;
    u_xlat1 = u_xlat11 * 2.0 + u_xlat1;
    u_xlat1 = u_xlat1 / u_xlat21;
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
    u_xlat2 = u_xlat11 * 2.0 + (-u_xlat10_0.w);
    u_xlat2 = u_xlat2 / u_xlat21;
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
    u_xlatb12 = (-u_xlat10_0.w)>=u_xlat11;
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat2 = u_xlat12 * u_xlat2;
    u_xlat16_3.xyz = u_xlat10_0.xyz * vec3(u_xlat1);
    u_xlat16_1 = u_xlat1;
    u_xlat16_4.xyz = u_xlat10_0.xyz * vec3(u_xlat2);
    u_xlat16_2 = u_xlat2;
    u_xlat16_5.xyz = u_xlat16_3.xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz;
    u_xlat16_5.w = u_xlat16_1;
    u_xlat16_6.w = u_xlat16_2;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<42 ; u_xlati_loop_1++)
    {
        u_xlat7.yz = _CoCParams.zz * _BokehKernel[u_xlati_loop_1].xy;
        u_xlat10 = dot(u_xlat7.yz, u_xlat7.yz);
        u_xlat10 = sqrt(u_xlat10);
        u_xlat7.x = u_xlat7.y * _CoCParams.w;
        u_xlat7.xy = u_xlat7.xz + vs_TEXCOORD0.xy;
        u_xlat10_7 = texture(_SourceTex, u_xlat7.xy);
        u_xlat20 = min(u_xlat10_0.w, u_xlat10_7.w);
        u_xlat20 = max(u_xlat20, 0.0);
        u_xlat20 = (-u_xlat10) + u_xlat20;
        u_xlat20 = u_xlat11 * 2.0 + u_xlat20;
        u_xlat38 = u_xlat20 / u_xlat21;
        u_xlat38 = clamp(u_xlat38, 0.0, 1.0);
        u_xlat10 = (-u_xlat10) + (-u_xlat10_7.w);
        u_xlat10 = u_xlat11 * 2.0 + u_xlat10;
        u_xlat10 = u_xlat10 / u_xlat21;
        u_xlat10 = clamp(u_xlat10, 0.0, 1.0);
        u_xlatb20 = (-u_xlat10_7.w)>=u_xlat11;
        u_xlat20 = u_xlatb20 ? 1.0 : float(0.0);
        u_xlat39 = u_xlat20 * u_xlat10;
        u_xlat16_8.xyz = u_xlat10_7.xyz * vec3(u_xlat38);
        u_xlat16_8.w = u_xlat38;
        u_xlat16_5 = u_xlat16_8 + u_xlat16_5;
        u_xlat16_9.xyz = u_xlat10_7.xyz * vec3(u_xlat39);
        u_xlat16_9.w = u_xlat39;
        u_xlat16_6 = u_xlat16_9 + u_xlat16_6;
    }
    u_xlatb0 = u_xlat16_5.w==0.0;
    u_xlat16_3.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_3.x = u_xlat16_3.x + u_xlat16_5.w;
    u_xlat16_3.xyz = u_xlat16_5.xyz / u_xlat16_3.xxx;
    u_xlatb0 = u_xlat16_6.w==0.0;
    u_xlat16_33 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_33 = u_xlat16_33 + u_xlat16_6.w;
    u_xlat16_4.xyz = u_xlat16_6.xyz / vec3(u_xlat16_33);
    u_xlat16_33 = u_xlat16_6.w * 0.0730602965;
    u_xlat16_33 = min(u_xlat16_33, 1.0);
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) + u_xlat16_4.xyz;
    SV_Target0.xyz = vec3(u_xlat16_33) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    SV_Target0.w = u_xlat16_33;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_USE_DRAW_PROCEDURAL" }
"#ifdef VERTEX
#version 310 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScaleBias;
layout(location = 0) out highp vec2 vs_TEXCOORD0;
int u_xlati0;
uvec2 u_xlatu0;
vec3 u_xlat1;
int u_xlati4;
void main()
{
    u_xlati0 = int(uint(gl_VertexID) & 1u);
    u_xlatu0.y = uint(gl_VertexID) >> 1u;
    u_xlati4 = (-u_xlati0) + (-int(u_xlatu0.y));
    u_xlati0 = u_xlati0 + int(u_xlatu0.y);
    u_xlatu0.x = uint(u_xlati0) & 1u;
    u_xlat1.xz = vec2(u_xlatu0.yx);
    vs_TEXCOORD0.xy = u_xlat1.xz * _ScaleBias.xy + _ScaleBias.zw;
    u_xlati0 = u_xlati4 + 1;
    u_xlatu0.x = uint(u_xlati0) & 1u;
    u_xlat1.y = float(u_xlatu0.x);
    gl_Position.xy = u_xlat1.xy * vec2(2.0, -2.0) + vec2(-1.0, 1.0);
    gl_Position.zw = vec2(-1.0, 1.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 310 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _SourceSize;
uniform 	vec4 _DownSampleScaleFactor;
uniform 	vec4 _CoCParams;
uniform 	vec4 _BokehKernel[42];
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat10_0;
int u_xlati0;
bool u_xlatb0;
float u_xlat1;
mediump float u_xlat16_1;
float u_xlat2;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat10_7;
mediump vec4 u_xlat16_8;
mediump vec4 u_xlat16_9;
float u_xlat10;
bool u_xlatb10;
float u_xlat11;
float u_xlat12;
bool u_xlatb12;
float u_xlat20;
bool u_xlatb20;
float u_xlat21;
mediump float u_xlat16_33;
float u_xlat38;
float u_xlat39;
void main()
{
    u_xlat10_0 = texture(_SourceTex, vs_TEXCOORD0.xy);
    u_xlat1 = max(u_xlat10_0.w, 0.0);
    u_xlat11 = _SourceSize.w * _DownSampleScaleFactor.w;
    u_xlat21 = u_xlat11 + u_xlat11;
    u_xlat1 = u_xlat11 * 2.0 + u_xlat1;
    u_xlat1 = u_xlat1 / u_xlat21;
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
    u_xlat2 = u_xlat11 * 2.0 + (-u_xlat10_0.w);
    u_xlat2 = u_xlat2 / u_xlat21;
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
    u_xlatb12 = (-u_xlat10_0.w)>=u_xlat11;
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat2 = u_xlat12 * u_xlat2;
    u_xlat16_3.xyz = u_xlat10_0.xyz * vec3(u_xlat1);
    u_xlat16_1 = u_xlat1;
    u_xlat16_4.xyz = u_xlat10_0.xyz * vec3(u_xlat2);
    u_xlat16_2 = u_xlat2;
    u_xlat16_5.xyz = u_xlat16_3.xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz;
    u_xlat16_5.w = u_xlat16_1;
    u_xlat16_6.w = u_xlat16_2;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<42 ; u_xlati_loop_1++)
    {
        u_xlat7.yz = _CoCParams.zz * _BokehKernel[u_xlati_loop_1].xy;
        u_xlat10 = dot(u_xlat7.yz, u_xlat7.yz);
        u_xlat10 = sqrt(u_xlat10);
        u_xlat7.x = u_xlat7.y * _CoCParams.w;
        u_xlat7.xy = u_xlat7.xz + vs_TEXCOORD0.xy;
        u_xlat10_7 = texture(_SourceTex, u_xlat7.xy);
        u_xlat20 = min(u_xlat10_0.w, u_xlat10_7.w);
        u_xlat20 = max(u_xlat20, 0.0);
        u_xlat20 = (-u_xlat10) + u_xlat20;
        u_xlat20 = u_xlat11 * 2.0 + u_xlat20;
        u_xlat38 = u_xlat20 / u_xlat21;
        u_xlat38 = clamp(u_xlat38, 0.0, 1.0);
        u_xlat10 = (-u_xlat10) + (-u_xlat10_7.w);
        u_xlat10 = u_xlat11 * 2.0 + u_xlat10;
        u_xlat10 = u_xlat10 / u_xlat21;
        u_xlat10 = clamp(u_xlat10, 0.0, 1.0);
        u_xlatb20 = (-u_xlat10_7.w)>=u_xlat11;
        u_xlat20 = u_xlatb20 ? 1.0 : float(0.0);
        u_xlat39 = u_xlat20 * u_xlat10;
        u_xlat16_8.xyz = u_xlat10_7.xyz * vec3(u_xlat38);
        u_xlat16_8.w = u_xlat38;
        u_xlat16_5 = u_xlat16_8 + u_xlat16_5;
        u_xlat16_9.xyz = u_xlat10_7.xyz * vec3(u_xlat39);
        u_xlat16_9.w = u_xlat39;
        u_xlat16_6 = u_xlat16_9 + u_xlat16_6;
    }
    u_xlatb0 = u_xlat16_5.w==0.0;
    u_xlat16_3.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_3.x = u_xlat16_3.x + u_xlat16_5.w;
    u_xlat16_3.xyz = u_xlat16_5.xyz / u_xlat16_3.xxx;
    u_xlatb0 = u_xlat16_6.w==0.0;
    u_xlat16_33 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_33 = u_xlat16_33 + u_xlat16_6.w;
    u_xlat16_4.xyz = u_xlat16_6.xyz / vec3(u_xlat16_33);
    u_xlat16_33 = u_xlat16_6.w * 0.0730602965;
    u_xlat16_33 = min(u_xlat16_33, 1.0);
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) + u_xlat16_4.xyz;
    SV_Target0.xyz = vec3(u_xlat16_33) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    SV_Target0.w = u_xlat16_33;
    return;
}

#endif
"
}
}
}
 Pass {
  Name "Bokeh Depth Of Field Post Blur"
  LOD 100
  Tags { "RenderPipeline" = "UniversalPipeline" }
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 253830
Program "vp" {
SubProgram "gles3 " {
"#ifdef VERTEX
#version 310 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
UNITY_BINDING(0) uniform UnityPerDraw {
	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	vec4 unity_LODFade;
	mediump vec4 unity_WorldTransformParams;
	mediump vec4 unity_LightData;
	mediump vec4 unity_LightIndices[2];
	vec4 unity_ProbesOcclusion;
	mediump vec4 unity_SpecCube0_HDR;
	vec4 unity_LightmapST;
	vec4 unity_DynamicLightmapST;
	mediump vec4 unity_SHAr;
	mediump vec4 unity_SHAg;
	mediump vec4 unity_SHAb;
	mediump vec4 unity_SHBr;
	mediump vec4 unity_SHBg;
	mediump vec4 unity_SHBb;
	mediump vec4 unity_SHC;
};
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
layout(location = 0) out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 310 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _SourceSize;
uniform 	vec4 _DownSampleScaleFactor;
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat10_1;
mediump vec4 u_xlat10_2;
void main()
{
    u_xlat0 = _SourceSize.zwzw * _DownSampleScaleFactor.zwzw;
    u_xlat1 = (-u_xlat0.zwxw) * vec4(0.5, 0.5, -0.5, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0 * vec4(-0.5, 0.5, 0.5, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_2 = texture(_SourceTex, u_xlat1.xy);
    u_xlat10_1 = texture(_SourceTex, u_xlat1.zw);
    u_xlat1 = u_xlat10_1 + u_xlat10_2;
    u_xlat10_2 = texture(_SourceTex, u_xlat0.xy);
    u_xlat10_0 = texture(_SourceTex, u_xlat0.zw);
    u_xlat1 = u_xlat1 + u_xlat10_2;
    u_xlat0 = u_xlat10_0 + u_xlat1;
    SV_Target0 = u_xlat0 * vec4(0.25, 0.25, 0.25, 0.25);
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_USE_DRAW_PROCEDURAL" }
"#ifdef VERTEX
#version 310 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScaleBias;
layout(location = 0) out highp vec2 vs_TEXCOORD0;
int u_xlati0;
uvec2 u_xlatu0;
vec3 u_xlat1;
int u_xlati4;
void main()
{
    u_xlati0 = int(uint(gl_VertexID) & 1u);
    u_xlatu0.y = uint(gl_VertexID) >> 1u;
    u_xlati4 = (-u_xlati0) + (-int(u_xlatu0.y));
    u_xlati0 = u_xlati0 + int(u_xlatu0.y);
    u_xlatu0.x = uint(u_xlati0) & 1u;
    u_xlat1.xz = vec2(u_xlatu0.yx);
    vs_TEXCOORD0.xy = u_xlat1.xz * _ScaleBias.xy + _ScaleBias.zw;
    u_xlati0 = u_xlati4 + 1;
    u_xlatu0.x = uint(u_xlati0) & 1u;
    u_xlat1.y = float(u_xlatu0.x);
    gl_Position.xy = u_xlat1.xy * vec2(2.0, -2.0) + vec2(-1.0, 1.0);
    gl_Position.zw = vec2(-1.0, 1.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 310 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _SourceSize;
uniform 	vec4 _DownSampleScaleFactor;
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat10_1;
mediump vec4 u_xlat10_2;
void main()
{
    u_xlat0 = _SourceSize.zwzw * _DownSampleScaleFactor.zwzw;
    u_xlat1 = (-u_xlat0.zwxw) * vec4(0.5, 0.5, -0.5, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0 * vec4(-0.5, 0.5, 0.5, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_2 = texture(_SourceTex, u_xlat1.xy);
    u_xlat10_1 = texture(_SourceTex, u_xlat1.zw);
    u_xlat1 = u_xlat10_1 + u_xlat10_2;
    u_xlat10_2 = texture(_SourceTex, u_xlat0.xy);
    u_xlat10_0 = texture(_SourceTex, u_xlat0.zw);
    u_xlat1 = u_xlat1 + u_xlat10_2;
    u_xlat0 = u_xlat10_0 + u_xlat1;
    SV_Target0 = u_xlat0 * vec4(0.25, 0.25, 0.25, 0.25);
    return;
}

#endif
"
}
}
}
 Pass {
  Name "Bokeh Depth Of Field Composite"
  LOD 100
  Tags { "RenderPipeline" = "UniversalPipeline" }
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 303344
Program "vp" {
SubProgram "gles3 " {
"#ifdef VERTEX
#version 310 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
UNITY_BINDING(0) uniform UnityPerDraw {
	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	vec4 unity_LODFade;
	mediump vec4 unity_WorldTransformParams;
	mediump vec4 unity_LightData;
	mediump vec4 unity_LightIndices[2];
	vec4 unity_ProbesOcclusion;
	mediump vec4 unity_SpecCube0_HDR;
	vec4 unity_LightmapST;
	vec4 unity_DynamicLightmapST;
	mediump vec4 unity_SHAr;
	mediump vec4 unity_SHAg;
	mediump vec4 unity_SHAb;
	mediump vec4 unity_SHBr;
	mediump vec4 unity_SHBg;
	mediump vec4 unity_SHBb;
	mediump vec4 unity_SHC;
};
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
layout(location = 0) out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 310 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _SourceSize;
uniform 	vec4 _CoCParams;
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
UNITY_LOCATION(1) uniform mediump sampler2D _DofTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _FullCoCTexture;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat10_0;
mediump float u_xlat16_1;
mediump vec4 u_xlat10_1;
mediump vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
bvec3 u_xlatb5;
float u_xlat10;
void main()
{
    u_xlat10_0 = texture(_FullCoCTexture, vs_TEXCOORD0.xy).x;
    u_xlat16_1 = u_xlat10_0 + -0.5;
    u_xlat16_1 = u_xlat16_1 + u_xlat16_1;
    u_xlat0 = _SourceSize.w + _SourceSize.w;
    u_xlat5.x = u_xlat16_1 * _CoCParams.z + (-u_xlat0);
    u_xlat0 = float(1.0) / u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat5.x;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat5.x = u_xlat0 * -2.0 + 3.0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat10 = u_xlat0 * u_xlat5.x;
    u_xlat10_1 = texture(_DofTexture, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat5.x * u_xlat0 + u_xlat10_1.w;
    u_xlat0 = (-u_xlat10) * u_xlat10_1.w + u_xlat0;
    u_xlat10_2 = texture(_SourceTex, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat10_2.xyz + vec3(0.0549999997, 0.0549999997, 0.0549999997);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.947867334, 0.947867334, 0.947867334);
    u_xlat16_3.xyz = log2(abs(u_xlat16_3.xyz));
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(2.4000001, 2.4000001, 2.4000001);
    u_xlat16_3.xyz = exp2(u_xlat16_3.xyz);
    u_xlat16_4.xyz = u_xlat10_2.xyz * vec3(0.0773993805, 0.0773993805, 0.0773993805);
    u_xlatb5.xyz = greaterThanEqual(vec4(0.0404499993, 0.0404499993, 0.0404499993, 0.0404499993), u_xlat10_2.xyzz).xyz;
    {
        vec3 hlslcc_movcTemp = u_xlat16_3;
        hlslcc_movcTemp.x = (u_xlatb5.x) ? u_xlat16_4.x : u_xlat16_3.x;
        hlslcc_movcTemp.y = (u_xlatb5.y) ? u_xlat16_4.y : u_xlat16_3.y;
        hlslcc_movcTemp.z = (u_xlatb5.z) ? u_xlat16_4.z : u_xlat16_3.z;
        u_xlat16_3 = hlslcc_movcTemp;
    }
    u_xlat5.xyz = u_xlat10_1.xyz + (-u_xlat16_3.xyz);
    u_xlat5.xyz = vec3(u_xlat0) * u_xlat5.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = log2(abs(u_xlat5.xyz));
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_3.xyz = exp2(u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_4.xyz = u_xlat5.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb5.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.00313080009), u_xlat5.xyzz).xyz;
    SV_Target0.x = (u_xlatb5.x) ? u_xlat16_4.x : u_xlat16_3.x;
    SV_Target0.y = (u_xlatb5.y) ? u_xlat16_4.y : u_xlat16_3.y;
    SV_Target0.z = (u_xlatb5.z) ? u_xlat16_4.z : u_xlat16_3.z;
    u_xlat16_3.x = max(u_xlat10_1.y, u_xlat10_1.x);
    u_xlat16_3.x = max(u_xlat10_1.z, u_xlat16_3.x);
    u_xlat5.x = (-u_xlat10_2.w) + u_xlat16_3.x;
    u_xlat0 = u_xlat0 * u_xlat5.x + u_xlat10_2.w;
    SV_Target0.w = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_USE_DRAW_PROCEDURAL" }
"#ifdef VERTEX
#version 310 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScaleBias;
layout(location = 0) out highp vec2 vs_TEXCOORD0;
int u_xlati0;
uvec2 u_xlatu0;
vec3 u_xlat1;
int u_xlati4;
void main()
{
    u_xlati0 = int(uint(gl_VertexID) & 1u);
    u_xlatu0.y = uint(gl_VertexID) >> 1u;
    u_xlati4 = (-u_xlati0) + (-int(u_xlatu0.y));
    u_xlati0 = u_xlati0 + int(u_xlatu0.y);
    u_xlatu0.x = uint(u_xlati0) & 1u;
    u_xlat1.xz = vec2(u_xlatu0.yx);
    vs_TEXCOORD0.xy = u_xlat1.xz * _ScaleBias.xy + _ScaleBias.zw;
    u_xlati0 = u_xlati4 + 1;
    u_xlatu0.x = uint(u_xlati0) & 1u;
    u_xlat1.y = float(u_xlatu0.x);
    gl_Position.xy = u_xlat1.xy * vec2(2.0, -2.0) + vec2(-1.0, 1.0);
    gl_Position.zw = vec2(-1.0, 1.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 310 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _SourceSize;
uniform 	vec4 _CoCParams;
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
UNITY_LOCATION(1) uniform mediump sampler2D _DofTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _FullCoCTexture;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat10_0;
mediump float u_xlat16_1;
mediump vec4 u_xlat10_1;
mediump vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
bvec3 u_xlatb5;
float u_xlat10;
void main()
{
    u_xlat10_0 = texture(_FullCoCTexture, vs_TEXCOORD0.xy).x;
    u_xlat16_1 = u_xlat10_0 + -0.5;
    u_xlat16_1 = u_xlat16_1 + u_xlat16_1;
    u_xlat0 = _SourceSize.w + _SourceSize.w;
    u_xlat5.x = u_xlat16_1 * _CoCParams.z + (-u_xlat0);
    u_xlat0 = float(1.0) / u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat5.x;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat5.x = u_xlat0 * -2.0 + 3.0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat10 = u_xlat0 * u_xlat5.x;
    u_xlat10_1 = texture(_DofTexture, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat5.x * u_xlat0 + u_xlat10_1.w;
    u_xlat0 = (-u_xlat10) * u_xlat10_1.w + u_xlat0;
    u_xlat10_2 = texture(_SourceTex, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat10_2.xyz + vec3(0.0549999997, 0.0549999997, 0.0549999997);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.947867334, 0.947867334, 0.947867334);
    u_xlat16_3.xyz = log2(abs(u_xlat16_3.xyz));
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(2.4000001, 2.4000001, 2.4000001);
    u_xlat16_3.xyz = exp2(u_xlat16_3.xyz);
    u_xlat16_4.xyz = u_xlat10_2.xyz * vec3(0.0773993805, 0.0773993805, 0.0773993805);
    u_xlatb5.xyz = greaterThanEqual(vec4(0.0404499993, 0.0404499993, 0.0404499993, 0.0404499993), u_xlat10_2.xyzz).xyz;
    {
        vec3 hlslcc_movcTemp = u_xlat16_3;
        hlslcc_movcTemp.x = (u_xlatb5.x) ? u_xlat16_4.x : u_xlat16_3.x;
        hlslcc_movcTemp.y = (u_xlatb5.y) ? u_xlat16_4.y : u_xlat16_3.y;
        hlslcc_movcTemp.z = (u_xlatb5.z) ? u_xlat16_4.z : u_xlat16_3.z;
        u_xlat16_3 = hlslcc_movcTemp;
    }
    u_xlat5.xyz = u_xlat10_1.xyz + (-u_xlat16_3.xyz);
    u_xlat5.xyz = vec3(u_xlat0) * u_xlat5.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = log2(abs(u_xlat5.xyz));
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_3.xyz = exp2(u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_4.xyz = u_xlat5.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb5.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.00313080009), u_xlat5.xyzz).xyz;
    SV_Target0.x = (u_xlatb5.x) ? u_xlat16_4.x : u_xlat16_3.x;
    SV_Target0.y = (u_xlatb5.y) ? u_xlat16_4.y : u_xlat16_3.y;
    SV_Target0.z = (u_xlatb5.z) ? u_xlat16_4.z : u_xlat16_3.z;
    u_xlat16_3.x = max(u_xlat10_1.y, u_xlat10_1.x);
    u_xlat16_3.x = max(u_xlat10_1.z, u_xlat16_3.x);
    u_xlat5.x = (-u_xlat10_2.w) + u_xlat16_3.x;
    u_xlat0 = u_xlat0 * u_xlat5.x + u_xlat10_2.w;
    SV_Target0.w = u_xlat0;
    return;
}

#endif
"
}
}
}
}
SubShader {
 LOD 100
 Tags { "RenderPipeline" = "UniversalPipeline" }
 Pass {
  Name "Bokeh Depth Of Field CoC"
  LOD 100
  Tags { "RenderPipeline" = "UniversalPipeline" }
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 351151
Program "vp" {
SubProgram "gles3 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_LODFade;
	UNITY_UNIFORM mediump vec4 unity_WorldTransformParams;
	UNITY_UNIFORM mediump vec4 unity_LightData;
	UNITY_UNIFORM mediump vec4 unity_LightIndices[2];
	UNITY_UNIFORM vec4 unity_ProbesOcclusion;
	UNITY_UNIFORM mediump vec4 unity_SpecCube0_HDR;
	UNITY_UNIFORM vec4 unity_LightmapST;
	UNITY_UNIFORM vec4 unity_DynamicLightmapST;
	UNITY_UNIFORM mediump vec4 unity_SHAr;
	UNITY_UNIFORM mediump vec4 unity_SHAg;
	UNITY_UNIFORM mediump vec4 unity_SHAb;
	UNITY_UNIFORM mediump vec4 unity_SHBr;
	UNITY_UNIFORM mediump vec4 unity_SHBg;
	UNITY_UNIFORM mediump vec4 unity_SHBb;
	UNITY_UNIFORM mediump vec4 unity_SHC;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _SourceSize;
uniform 	vec4 _CoCParams;
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump float SV_Target0;
vec2 u_xlat0;
uvec4 u_xlatu0;
mediump float u_xlat16_1;
mediump float u_xlat16_3;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _SourceSize.xy;
    u_xlatu0.xy =  uvec2(ivec2(u_xlat0.xy));
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat0.x = texelFetch(_CameraDepthTexture, ivec2(u_xlatu0.xy), int(u_xlatu0.w)).x;
    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = _CoCParams.x / u_xlat0.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat0.x * _CoCParams.y;
    u_xlat16_1 = max(u_xlat0.x, -1.0);
    u_xlat16_3 = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3 = min(max(u_xlat16_3, 0.0), 1.0);
#else
    u_xlat16_3 = clamp(u_xlat16_3, 0.0, 1.0);
#endif
    u_xlat16_1 = min(u_xlat16_1, 0.0);
    u_xlat16_1 = u_xlat16_1 + u_xlat16_3;
    u_xlat16_1 = u_xlat16_1 + 1.0;
    SV_Target0 = u_xlat16_1 * 0.5;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_USE_DRAW_PROCEDURAL" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScaleBias;
out highp vec2 vs_TEXCOORD0;
int u_xlati0;
uvec2 u_xlatu0;
vec3 u_xlat1;
int u_xlati4;
void main()
{
    u_xlati0 = int(uint(uint(gl_VertexID) & 1u));
    u_xlatu0.y = uint(uint(gl_VertexID) >> 1u);
    u_xlati4 = (-u_xlati0) + (-int(u_xlatu0.y));
    u_xlati0 = u_xlati0 + int(u_xlatu0.y);
    u_xlatu0.x = uint(uint(u_xlati0) & 1u);
    u_xlat1.xz = vec2(u_xlatu0.yx);
    vs_TEXCOORD0.xy = u_xlat1.xz * _ScaleBias.xy + _ScaleBias.zw;
    u_xlati0 = u_xlati4 + 1;
    u_xlatu0.x = uint(uint(u_xlati0) & 1u);
    u_xlat1.y = float(u_xlatu0.x);
    gl_Position.xy = u_xlat1.xy * vec2(2.0, -2.0) + vec2(-1.0, 1.0);
    gl_Position.zw = vec2(-1.0, 1.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _SourceSize;
uniform 	vec4 _CoCParams;
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump float SV_Target0;
vec2 u_xlat0;
uvec4 u_xlatu0;
mediump float u_xlat16_1;
mediump float u_xlat16_3;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _SourceSize.xy;
    u_xlatu0.xy =  uvec2(ivec2(u_xlat0.xy));
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat0.x = texelFetch(_CameraDepthTexture, ivec2(u_xlatu0.xy), int(u_xlatu0.w)).x;
    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = _CoCParams.x / u_xlat0.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat0.x * _CoCParams.y;
    u_xlat16_1 = max(u_xlat0.x, -1.0);
    u_xlat16_3 = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3 = min(max(u_xlat16_3, 0.0), 1.0);
#else
    u_xlat16_3 = clamp(u_xlat16_3, 0.0, 1.0);
#endif
    u_xlat16_1 = min(u_xlat16_1, 0.0);
    u_xlat16_1 = u_xlat16_1 + u_xlat16_3;
    u_xlat16_1 = u_xlat16_1 + 1.0;
    SV_Target0 = u_xlat16_1 * 0.5;
    return;
}

#endif
"
}
}
}
 Pass {
  Name "Bokeh Depth Of Field Prefilter"
  LOD 100
  Tags { "RenderPipeline" = "UniversalPipeline" }
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 450612
Program "vp" {
SubProgram "gles3 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_LODFade;
	UNITY_UNIFORM mediump vec4 unity_WorldTransformParams;
	UNITY_UNIFORM mediump vec4 unity_LightData;
	UNITY_UNIFORM mediump vec4 unity_LightIndices[2];
	UNITY_UNIFORM vec4 unity_ProbesOcclusion;
	UNITY_UNIFORM mediump vec4 unity_SpecCube0_HDR;
	UNITY_UNIFORM vec4 unity_LightmapST;
	UNITY_UNIFORM vec4 unity_DynamicLightmapST;
	UNITY_UNIFORM mediump vec4 unity_SHAr;
	UNITY_UNIFORM mediump vec4 unity_SHAg;
	UNITY_UNIFORM mediump vec4 unity_SHAb;
	UNITY_UNIFORM mediump vec4 unity_SHBr;
	UNITY_UNIFORM mediump vec4 unity_SHBg;
	UNITY_UNIFORM mediump vec4 unity_SHBb;
	UNITY_UNIFORM mediump vec4 unity_SHC;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _SourceSize;
uniform 	vec4 _CoCParams;
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FullCoCTexture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat10_0;
bvec3 u_xlatb0;
float u_xlat1;
mediump float u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat6;
mediump vec3 u_xlat10_6;
mediump float u_xlat16_8;
void main()
{
    u_xlat0 = (-_SourceSize.zwzw) * vec4(0.5, 0.5, -0.5, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_1 = texture(_FullCoCTexture, u_xlat0.zw).x;
    u_xlat1 = u_xlat10_1 * 2.0 + -1.0;
    u_xlat2 = _SourceSize.zwzw * vec4(-0.5, 0.5, 0.5, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_6.x = texture(_FullCoCTexture, u_xlat2.xy).x;
    u_xlat6 = u_xlat10_6.x * 2.0 + -1.0;
    u_xlat16_3.x = min(u_xlat6, u_xlat1);
    u_xlat16_8 = max(u_xlat6, u_xlat1);
    u_xlat10_1 = texture(_FullCoCTexture, u_xlat2.zw).x;
    u_xlat1 = u_xlat10_1 * 2.0 + -1.0;
    u_xlat16_3.x = min(u_xlat1, u_xlat16_3.x);
    u_xlat16_8 = max(u_xlat1, u_xlat16_8);
    u_xlat10_1 = texture(_FullCoCTexture, u_xlat0.xy).x;
    u_xlat1 = u_xlat10_1 * 2.0 + -1.0;
    u_xlat16_3.x = min(u_xlat16_3.x, u_xlat1);
    u_xlat16_8 = max(u_xlat16_8, u_xlat1);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_8<(-u_xlat16_3.x));
#else
    u_xlatb1 = u_xlat16_8<(-u_xlat16_3.x);
#endif
    u_xlat16_3.x = (u_xlatb1) ? u_xlat16_3.x : u_xlat16_8;
    u_xlat1 = u_xlat16_3.x * _CoCParams.z;
    u_xlat6 = _SourceSize.w + _SourceSize.w;
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat6 = u_xlat6 * abs(u_xlat1);
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    SV_Target0.w = u_xlat1;
    u_xlat1 = u_xlat6 * -2.0 + 3.0;
    u_xlat6 = u_xlat6 * u_xlat6;
    u_xlat1 = u_xlat6 * u_xlat1;
    u_xlat10_6.xyz = texture(_SourceTex, u_xlat0.xy).xyz;
    u_xlat10_0.xyz = texture(_SourceTex, u_xlat0.zw).xyz;
    u_xlat16_3.xyz = u_xlat10_0.xyz + u_xlat10_6.xyz;
    u_xlat10_0.xyz = texture(_SourceTex, u_xlat2.xy).xyz;
    u_xlat10_6.xyz = texture(_SourceTex, u_xlat2.zw).xyz;
    u_xlat16_3.xyz = u_xlat10_0.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat10_6.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(u_xlat1) + vec3(0.0549999997, 0.0549999997, 0.0549999997);
    u_xlat0.xyz = vec3(u_xlat1) * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(0.947867334, 0.947867334, 0.947867334);
    u_xlat16_3.xyz = log2(abs(u_xlat16_3.xyz));
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(2.4000001, 2.4000001, 2.4000001);
    u_xlat16_3.xyz = exp2(u_xlat16_3.xyz);
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(0.0773993805, 0.0773993805, 0.0773993805);
    u_xlatb0.xyz = greaterThanEqual(vec4(0.0404499993, 0.0404499993, 0.0404499993, 0.0), u_xlat0.xyzx).xyz;
    SV_Target0.x = (u_xlatb0.x) ? u_xlat16_4.x : u_xlat16_3.x;
    SV_Target0.y = (u_xlatb0.y) ? u_xlat16_4.y : u_xlat16_3.y;
    SV_Target0.z = (u_xlatb0.z) ? u_xlat16_4.z : u_xlat16_3.z;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_USE_DRAW_PROCEDURAL" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScaleBias;
out highp vec2 vs_TEXCOORD0;
int u_xlati0;
uvec2 u_xlatu0;
vec3 u_xlat1;
int u_xlati4;
void main()
{
    u_xlati0 = int(uint(uint(gl_VertexID) & 1u));
    u_xlatu0.y = uint(uint(gl_VertexID) >> 1u);
    u_xlati4 = (-u_xlati0) + (-int(u_xlatu0.y));
    u_xlati0 = u_xlati0 + int(u_xlatu0.y);
    u_xlatu0.x = uint(uint(u_xlati0) & 1u);
    u_xlat1.xz = vec2(u_xlatu0.yx);
    vs_TEXCOORD0.xy = u_xlat1.xz * _ScaleBias.xy + _ScaleBias.zw;
    u_xlati0 = u_xlati4 + 1;
    u_xlatu0.x = uint(uint(u_xlati0) & 1u);
    u_xlat1.y = float(u_xlatu0.x);
    gl_Position.xy = u_xlat1.xy * vec2(2.0, -2.0) + vec2(-1.0, 1.0);
    gl_Position.zw = vec2(-1.0, 1.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _SourceSize;
uniform 	vec4 _CoCParams;
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FullCoCTexture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat10_0;
bvec3 u_xlatb0;
float u_xlat1;
mediump float u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat6;
mediump vec3 u_xlat10_6;
mediump float u_xlat16_8;
void main()
{
    u_xlat0 = (-_SourceSize.zwzw) * vec4(0.5, 0.5, -0.5, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_1 = texture(_FullCoCTexture, u_xlat0.zw).x;
    u_xlat1 = u_xlat10_1 * 2.0 + -1.0;
    u_xlat2 = _SourceSize.zwzw * vec4(-0.5, 0.5, 0.5, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_6.x = texture(_FullCoCTexture, u_xlat2.xy).x;
    u_xlat6 = u_xlat10_6.x * 2.0 + -1.0;
    u_xlat16_3.x = min(u_xlat6, u_xlat1);
    u_xlat16_8 = max(u_xlat6, u_xlat1);
    u_xlat10_1 = texture(_FullCoCTexture, u_xlat2.zw).x;
    u_xlat1 = u_xlat10_1 * 2.0 + -1.0;
    u_xlat16_3.x = min(u_xlat1, u_xlat16_3.x);
    u_xlat16_8 = max(u_xlat1, u_xlat16_8);
    u_xlat10_1 = texture(_FullCoCTexture, u_xlat0.xy).x;
    u_xlat1 = u_xlat10_1 * 2.0 + -1.0;
    u_xlat16_3.x = min(u_xlat16_3.x, u_xlat1);
    u_xlat16_8 = max(u_xlat16_8, u_xlat1);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_8<(-u_xlat16_3.x));
#else
    u_xlatb1 = u_xlat16_8<(-u_xlat16_3.x);
#endif
    u_xlat16_3.x = (u_xlatb1) ? u_xlat16_3.x : u_xlat16_8;
    u_xlat1 = u_xlat16_3.x * _CoCParams.z;
    u_xlat6 = _SourceSize.w + _SourceSize.w;
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat6 = u_xlat6 * abs(u_xlat1);
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    SV_Target0.w = u_xlat1;
    u_xlat1 = u_xlat6 * -2.0 + 3.0;
    u_xlat6 = u_xlat6 * u_xlat6;
    u_xlat1 = u_xlat6 * u_xlat1;
    u_xlat10_6.xyz = texture(_SourceTex, u_xlat0.xy).xyz;
    u_xlat10_0.xyz = texture(_SourceTex, u_xlat0.zw).xyz;
    u_xlat16_3.xyz = u_xlat10_0.xyz + u_xlat10_6.xyz;
    u_xlat10_0.xyz = texture(_SourceTex, u_xlat2.xy).xyz;
    u_xlat10_6.xyz = texture(_SourceTex, u_xlat2.zw).xyz;
    u_xlat16_3.xyz = u_xlat10_0.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat10_6.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(u_xlat1) + vec3(0.0549999997, 0.0549999997, 0.0549999997);
    u_xlat0.xyz = vec3(u_xlat1) * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(0.947867334, 0.947867334, 0.947867334);
    u_xlat16_3.xyz = log2(abs(u_xlat16_3.xyz));
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(2.4000001, 2.4000001, 2.4000001);
    u_xlat16_3.xyz = exp2(u_xlat16_3.xyz);
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(0.0773993805, 0.0773993805, 0.0773993805);
    u_xlatb0.xyz = greaterThanEqual(vec4(0.0404499993, 0.0404499993, 0.0404499993, 0.0), u_xlat0.xyzx).xyz;
    SV_Target0.x = (u_xlatb0.x) ? u_xlat16_4.x : u_xlat16_3.x;
    SV_Target0.y = (u_xlatb0.y) ? u_xlat16_4.y : u_xlat16_3.y;
    SV_Target0.z = (u_xlatb0.z) ? u_xlat16_4.z : u_xlat16_3.z;
    return;
}

#endif
"
}
}
}
 Pass {
  Name "Bokeh Depth Of Field Blur"
  LOD 100
  Tags { "RenderPipeline" = "UniversalPipeline" }
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 478647
Program "vp" {
SubProgram "gles3 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_LODFade;
	UNITY_UNIFORM mediump vec4 unity_WorldTransformParams;
	UNITY_UNIFORM mediump vec4 unity_LightData;
	UNITY_UNIFORM mediump vec4 unity_LightIndices[2];
	UNITY_UNIFORM vec4 unity_ProbesOcclusion;
	UNITY_UNIFORM mediump vec4 unity_SpecCube0_HDR;
	UNITY_UNIFORM vec4 unity_LightmapST;
	UNITY_UNIFORM vec4 unity_DynamicLightmapST;
	UNITY_UNIFORM mediump vec4 unity_SHAr;
	UNITY_UNIFORM mediump vec4 unity_SHAg;
	UNITY_UNIFORM mediump vec4 unity_SHAb;
	UNITY_UNIFORM mediump vec4 unity_SHBr;
	UNITY_UNIFORM mediump vec4 unity_SHBg;
	UNITY_UNIFORM mediump vec4 unity_SHBb;
	UNITY_UNIFORM mediump vec4 unity_SHC;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _SourceSize;
uniform 	vec4 _DownSampleScaleFactor;
uniform 	vec4 _CoCParams;
uniform 	vec4 _BokehKernel[42];
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat10_0;
int u_xlati0;
bool u_xlatb0;
float u_xlat1;
mediump float u_xlat16_1;
float u_xlat2;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat10_7;
mediump vec4 u_xlat16_8;
mediump vec4 u_xlat16_9;
float u_xlat10;
bool u_xlatb10;
float u_xlat11;
float u_xlat12;
bool u_xlatb12;
float u_xlat20;
bool u_xlatb20;
float u_xlat21;
mediump float u_xlat16_33;
float u_xlat38;
float u_xlat39;
void main()
{
    u_xlat10_0 = texture(_SourceTex, vs_TEXCOORD0.xy);
    u_xlat1 = max(u_xlat10_0.w, 0.0);
    u_xlat11 = _SourceSize.w * _DownSampleScaleFactor.w;
    u_xlat21 = u_xlat11 + u_xlat11;
    u_xlat1 = u_xlat11 * 2.0 + u_xlat1;
    u_xlat1 = u_xlat1 / u_xlat21;
#ifdef UNITY_ADRENO_ES3
    u_xlat1 = min(max(u_xlat1, 0.0), 1.0);
#else
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
#endif
    u_xlat2 = u_xlat11 * 2.0 + (-u_xlat10_0.w);
    u_xlat2 = u_xlat2 / u_xlat21;
#ifdef UNITY_ADRENO_ES3
    u_xlat2 = min(max(u_xlat2, 0.0), 1.0);
#else
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!((-u_xlat10_0.w)>=u_xlat11);
#else
    u_xlatb12 = (-u_xlat10_0.w)>=u_xlat11;
#endif
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat2 = u_xlat12 * u_xlat2;
    u_xlat16_3.xyz = u_xlat10_0.xyz * vec3(u_xlat1);
    u_xlat16_1 = u_xlat1;
    u_xlat16_4.xyz = u_xlat10_0.xyz * vec3(u_xlat2);
    u_xlat16_2 = u_xlat2;
    u_xlat16_5.xyz = u_xlat16_3.xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz;
    u_xlat16_5.w = u_xlat16_1;
    u_xlat16_6.w = u_xlat16_2;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<42 ; u_xlati_loop_1++)
    {
        u_xlat7.yz = _CoCParams.zz * _BokehKernel[u_xlati_loop_1].xy;
        u_xlat10 = dot(u_xlat7.yz, u_xlat7.yz);
        u_xlat10 = sqrt(u_xlat10);
        u_xlat7.x = u_xlat7.y * _CoCParams.w;
        u_xlat7.xy = u_xlat7.xz + vs_TEXCOORD0.xy;
        u_xlat10_7 = texture(_SourceTex, u_xlat7.xy);
        u_xlat20 = min(u_xlat10_0.w, u_xlat10_7.w);
        u_xlat20 = max(u_xlat20, 0.0);
        u_xlat20 = (-u_xlat10) + u_xlat20;
        u_xlat20 = u_xlat11 * 2.0 + u_xlat20;
        u_xlat38 = u_xlat20 / u_xlat21;
#ifdef UNITY_ADRENO_ES3
        u_xlat38 = min(max(u_xlat38, 0.0), 1.0);
#else
        u_xlat38 = clamp(u_xlat38, 0.0, 1.0);
#endif
        u_xlat10 = (-u_xlat10) + (-u_xlat10_7.w);
        u_xlat10 = u_xlat11 * 2.0 + u_xlat10;
        u_xlat10 = u_xlat10 / u_xlat21;
#ifdef UNITY_ADRENO_ES3
        u_xlat10 = min(max(u_xlat10, 0.0), 1.0);
#else
        u_xlat10 = clamp(u_xlat10, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb20 = !!((-u_xlat10_7.w)>=u_xlat11);
#else
        u_xlatb20 = (-u_xlat10_7.w)>=u_xlat11;
#endif
        u_xlat20 = u_xlatb20 ? 1.0 : float(0.0);
        u_xlat39 = u_xlat20 * u_xlat10;
        u_xlat16_8.xyz = u_xlat10_7.xyz * vec3(u_xlat38);
        u_xlat16_8.w = u_xlat38;
        u_xlat16_5 = u_xlat16_8 + u_xlat16_5;
        u_xlat16_9.xyz = u_xlat10_7.xyz * vec3(u_xlat39);
        u_xlat16_9.w = u_xlat39;
        u_xlat16_6 = u_xlat16_9 + u_xlat16_6;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_5.w==0.0);
#else
    u_xlatb0 = u_xlat16_5.w==0.0;
#endif
    u_xlat16_3.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_3.x = u_xlat16_3.x + u_xlat16_5.w;
    u_xlat16_3.xyz = u_xlat16_5.xyz / u_xlat16_3.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_6.w==0.0);
#else
    u_xlatb0 = u_xlat16_6.w==0.0;
#endif
    u_xlat16_33 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_33 = u_xlat16_33 + u_xlat16_6.w;
    u_xlat16_4.xyz = u_xlat16_6.xyz / vec3(u_xlat16_33);
    u_xlat16_33 = u_xlat16_6.w * 0.0730602965;
    u_xlat16_33 = min(u_xlat16_33, 1.0);
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) + u_xlat16_4.xyz;
    SV_Target0.xyz = vec3(u_xlat16_33) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    SV_Target0.w = u_xlat16_33;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_USE_DRAW_PROCEDURAL" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScaleBias;
out highp vec2 vs_TEXCOORD0;
int u_xlati0;
uvec2 u_xlatu0;
vec3 u_xlat1;
int u_xlati4;
void main()
{
    u_xlati0 = int(uint(uint(gl_VertexID) & 1u));
    u_xlatu0.y = uint(uint(gl_VertexID) >> 1u);
    u_xlati4 = (-u_xlati0) + (-int(u_xlatu0.y));
    u_xlati0 = u_xlati0 + int(u_xlatu0.y);
    u_xlatu0.x = uint(uint(u_xlati0) & 1u);
    u_xlat1.xz = vec2(u_xlatu0.yx);
    vs_TEXCOORD0.xy = u_xlat1.xz * _ScaleBias.xy + _ScaleBias.zw;
    u_xlati0 = u_xlati4 + 1;
    u_xlatu0.x = uint(uint(u_xlati0) & 1u);
    u_xlat1.y = float(u_xlatu0.x);
    gl_Position.xy = u_xlat1.xy * vec2(2.0, -2.0) + vec2(-1.0, 1.0);
    gl_Position.zw = vec2(-1.0, 1.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _SourceSize;
uniform 	vec4 _DownSampleScaleFactor;
uniform 	vec4 _CoCParams;
uniform 	vec4 _BokehKernel[42];
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat10_0;
int u_xlati0;
bool u_xlatb0;
float u_xlat1;
mediump float u_xlat16_1;
float u_xlat2;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat10_7;
mediump vec4 u_xlat16_8;
mediump vec4 u_xlat16_9;
float u_xlat10;
bool u_xlatb10;
float u_xlat11;
float u_xlat12;
bool u_xlatb12;
float u_xlat20;
bool u_xlatb20;
float u_xlat21;
mediump float u_xlat16_33;
float u_xlat38;
float u_xlat39;
void main()
{
    u_xlat10_0 = texture(_SourceTex, vs_TEXCOORD0.xy);
    u_xlat1 = max(u_xlat10_0.w, 0.0);
    u_xlat11 = _SourceSize.w * _DownSampleScaleFactor.w;
    u_xlat21 = u_xlat11 + u_xlat11;
    u_xlat1 = u_xlat11 * 2.0 + u_xlat1;
    u_xlat1 = u_xlat1 / u_xlat21;
#ifdef UNITY_ADRENO_ES3
    u_xlat1 = min(max(u_xlat1, 0.0), 1.0);
#else
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
#endif
    u_xlat2 = u_xlat11 * 2.0 + (-u_xlat10_0.w);
    u_xlat2 = u_xlat2 / u_xlat21;
#ifdef UNITY_ADRENO_ES3
    u_xlat2 = min(max(u_xlat2, 0.0), 1.0);
#else
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!((-u_xlat10_0.w)>=u_xlat11);
#else
    u_xlatb12 = (-u_xlat10_0.w)>=u_xlat11;
#endif
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat2 = u_xlat12 * u_xlat2;
    u_xlat16_3.xyz = u_xlat10_0.xyz * vec3(u_xlat1);
    u_xlat16_1 = u_xlat1;
    u_xlat16_4.xyz = u_xlat10_0.xyz * vec3(u_xlat2);
    u_xlat16_2 = u_xlat2;
    u_xlat16_5.xyz = u_xlat16_3.xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz;
    u_xlat16_5.w = u_xlat16_1;
    u_xlat16_6.w = u_xlat16_2;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<42 ; u_xlati_loop_1++)
    {
        u_xlat7.yz = _CoCParams.zz * _BokehKernel[u_xlati_loop_1].xy;
        u_xlat10 = dot(u_xlat7.yz, u_xlat7.yz);
        u_xlat10 = sqrt(u_xlat10);
        u_xlat7.x = u_xlat7.y * _CoCParams.w;
        u_xlat7.xy = u_xlat7.xz + vs_TEXCOORD0.xy;
        u_xlat10_7 = texture(_SourceTex, u_xlat7.xy);
        u_xlat20 = min(u_xlat10_0.w, u_xlat10_7.w);
        u_xlat20 = max(u_xlat20, 0.0);
        u_xlat20 = (-u_xlat10) + u_xlat20;
        u_xlat20 = u_xlat11 * 2.0 + u_xlat20;
        u_xlat38 = u_xlat20 / u_xlat21;
#ifdef UNITY_ADRENO_ES3
        u_xlat38 = min(max(u_xlat38, 0.0), 1.0);
#else
        u_xlat38 = clamp(u_xlat38, 0.0, 1.0);
#endif
        u_xlat10 = (-u_xlat10) + (-u_xlat10_7.w);
        u_xlat10 = u_xlat11 * 2.0 + u_xlat10;
        u_xlat10 = u_xlat10 / u_xlat21;
#ifdef UNITY_ADRENO_ES3
        u_xlat10 = min(max(u_xlat10, 0.0), 1.0);
#else
        u_xlat10 = clamp(u_xlat10, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb20 = !!((-u_xlat10_7.w)>=u_xlat11);
#else
        u_xlatb20 = (-u_xlat10_7.w)>=u_xlat11;
#endif
        u_xlat20 = u_xlatb20 ? 1.0 : float(0.0);
        u_xlat39 = u_xlat20 * u_xlat10;
        u_xlat16_8.xyz = u_xlat10_7.xyz * vec3(u_xlat38);
        u_xlat16_8.w = u_xlat38;
        u_xlat16_5 = u_xlat16_8 + u_xlat16_5;
        u_xlat16_9.xyz = u_xlat10_7.xyz * vec3(u_xlat39);
        u_xlat16_9.w = u_xlat39;
        u_xlat16_6 = u_xlat16_9 + u_xlat16_6;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_5.w==0.0);
#else
    u_xlatb0 = u_xlat16_5.w==0.0;
#endif
    u_xlat16_3.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_3.x = u_xlat16_3.x + u_xlat16_5.w;
    u_xlat16_3.xyz = u_xlat16_5.xyz / u_xlat16_3.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_6.w==0.0);
#else
    u_xlatb0 = u_xlat16_6.w==0.0;
#endif
    u_xlat16_33 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_33 = u_xlat16_33 + u_xlat16_6.w;
    u_xlat16_4.xyz = u_xlat16_6.xyz / vec3(u_xlat16_33);
    u_xlat16_33 = u_xlat16_6.w * 0.0730602965;
    u_xlat16_33 = min(u_xlat16_33, 1.0);
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) + u_xlat16_4.xyz;
    SV_Target0.xyz = vec3(u_xlat16_33) * u_xlat16_4.xyz + u_xlat16_3.xyz;
    SV_Target0.w = u_xlat16_33;
    return;
}

#endif
"
}
}
}
 Pass {
  Name "Bokeh Depth Of Field Post Blur"
  LOD 100
  Tags { "RenderPipeline" = "UniversalPipeline" }
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 525342
Program "vp" {
SubProgram "gles3 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_LODFade;
	UNITY_UNIFORM mediump vec4 unity_WorldTransformParams;
	UNITY_UNIFORM mediump vec4 unity_LightData;
	UNITY_UNIFORM mediump vec4 unity_LightIndices[2];
	UNITY_UNIFORM vec4 unity_ProbesOcclusion;
	UNITY_UNIFORM mediump vec4 unity_SpecCube0_HDR;
	UNITY_UNIFORM vec4 unity_LightmapST;
	UNITY_UNIFORM vec4 unity_DynamicLightmapST;
	UNITY_UNIFORM mediump vec4 unity_SHAr;
	UNITY_UNIFORM mediump vec4 unity_SHAg;
	UNITY_UNIFORM mediump vec4 unity_SHAb;
	UNITY_UNIFORM mediump vec4 unity_SHBr;
	UNITY_UNIFORM mediump vec4 unity_SHBg;
	UNITY_UNIFORM mediump vec4 unity_SHBb;
	UNITY_UNIFORM mediump vec4 unity_SHC;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _SourceSize;
uniform 	vec4 _DownSampleScaleFactor;
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat10_1;
mediump vec4 u_xlat10_2;
void main()
{
    u_xlat0 = _SourceSize.zwzw * _DownSampleScaleFactor.zwzw;
    u_xlat1 = (-u_xlat0.zwxw) * vec4(0.5, 0.5, -0.5, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0 * vec4(-0.5, 0.5, 0.5, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_2 = texture(_SourceTex, u_xlat1.xy);
    u_xlat10_1 = texture(_SourceTex, u_xlat1.zw);
    u_xlat1 = u_xlat10_1 + u_xlat10_2;
    u_xlat10_2 = texture(_SourceTex, u_xlat0.xy);
    u_xlat10_0 = texture(_SourceTex, u_xlat0.zw);
    u_xlat1 = u_xlat1 + u_xlat10_2;
    u_xlat0 = u_xlat10_0 + u_xlat1;
    SV_Target0 = u_xlat0 * vec4(0.25, 0.25, 0.25, 0.25);
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_USE_DRAW_PROCEDURAL" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScaleBias;
out highp vec2 vs_TEXCOORD0;
int u_xlati0;
uvec2 u_xlatu0;
vec3 u_xlat1;
int u_xlati4;
void main()
{
    u_xlati0 = int(uint(uint(gl_VertexID) & 1u));
    u_xlatu0.y = uint(uint(gl_VertexID) >> 1u);
    u_xlati4 = (-u_xlati0) + (-int(u_xlatu0.y));
    u_xlati0 = u_xlati0 + int(u_xlatu0.y);
    u_xlatu0.x = uint(uint(u_xlati0) & 1u);
    u_xlat1.xz = vec2(u_xlatu0.yx);
    vs_TEXCOORD0.xy = u_xlat1.xz * _ScaleBias.xy + _ScaleBias.zw;
    u_xlati0 = u_xlati4 + 1;
    u_xlatu0.x = uint(uint(u_xlati0) & 1u);
    u_xlat1.y = float(u_xlatu0.x);
    gl_Position.xy = u_xlat1.xy * vec2(2.0, -2.0) + vec2(-1.0, 1.0);
    gl_Position.zw = vec2(-1.0, 1.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _SourceSize;
uniform 	vec4 _DownSampleScaleFactor;
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat10_1;
mediump vec4 u_xlat10_2;
void main()
{
    u_xlat0 = _SourceSize.zwzw * _DownSampleScaleFactor.zwzw;
    u_xlat1 = (-u_xlat0.zwxw) * vec4(0.5, 0.5, -0.5, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0 * vec4(-0.5, 0.5, 0.5, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_2 = texture(_SourceTex, u_xlat1.xy);
    u_xlat10_1 = texture(_SourceTex, u_xlat1.zw);
    u_xlat1 = u_xlat10_1 + u_xlat10_2;
    u_xlat10_2 = texture(_SourceTex, u_xlat0.xy);
    u_xlat10_0 = texture(_SourceTex, u_xlat0.zw);
    u_xlat1 = u_xlat1 + u_xlat10_2;
    u_xlat0 = u_xlat10_0 + u_xlat1;
    SV_Target0 = u_xlat0 * vec4(0.25, 0.25, 0.25, 0.25);
    return;
}

#endif
"
}
}
}
 Pass {
  Name "Bokeh Depth Of Field Composite"
  LOD 100
  Tags { "RenderPipeline" = "UniversalPipeline" }
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 625948
Program "vp" {
SubProgram "gles3 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_LODFade;
	UNITY_UNIFORM mediump vec4 unity_WorldTransformParams;
	UNITY_UNIFORM mediump vec4 unity_LightData;
	UNITY_UNIFORM mediump vec4 unity_LightIndices[2];
	UNITY_UNIFORM vec4 unity_ProbesOcclusion;
	UNITY_UNIFORM mediump vec4 unity_SpecCube0_HDR;
	UNITY_UNIFORM vec4 unity_LightmapST;
	UNITY_UNIFORM vec4 unity_DynamicLightmapST;
	UNITY_UNIFORM mediump vec4 unity_SHAr;
	UNITY_UNIFORM mediump vec4 unity_SHAg;
	UNITY_UNIFORM mediump vec4 unity_SHAb;
	UNITY_UNIFORM mediump vec4 unity_SHBr;
	UNITY_UNIFORM mediump vec4 unity_SHBg;
	UNITY_UNIFORM mediump vec4 unity_SHBb;
	UNITY_UNIFORM mediump vec4 unity_SHC;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _SourceSize;
uniform 	vec4 _CoCParams;
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
UNITY_LOCATION(1) uniform mediump sampler2D _DofTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _FullCoCTexture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat10_0;
mediump float u_xlat16_1;
mediump vec4 u_xlat10_1;
mediump vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
bvec3 u_xlatb5;
float u_xlat10;
void main()
{
    u_xlat10_0 = texture(_FullCoCTexture, vs_TEXCOORD0.xy).x;
    u_xlat16_1 = u_xlat10_0 + -0.5;
    u_xlat16_1 = u_xlat16_1 + u_xlat16_1;
    u_xlat0 = _SourceSize.w + _SourceSize.w;
    u_xlat5.x = u_xlat16_1 * _CoCParams.z + (-u_xlat0);
    u_xlat0 = float(1.0) / u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat5.x = u_xlat0 * -2.0 + 3.0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat10 = u_xlat0 * u_xlat5.x;
    u_xlat10_1 = texture(_DofTexture, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat5.x * u_xlat0 + u_xlat10_1.w;
    u_xlat0 = (-u_xlat10) * u_xlat10_1.w + u_xlat0;
    u_xlat10_2 = texture(_SourceTex, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat10_2.xyz + vec3(0.0549999997, 0.0549999997, 0.0549999997);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.947867334, 0.947867334, 0.947867334);
    u_xlat16_3.xyz = log2(abs(u_xlat16_3.xyz));
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(2.4000001, 2.4000001, 2.4000001);
    u_xlat16_3.xyz = exp2(u_xlat16_3.xyz);
    u_xlat16_4.xyz = u_xlat10_2.xyz * vec3(0.0773993805, 0.0773993805, 0.0773993805);
    u_xlatb5.xyz = greaterThanEqual(vec4(0.0404499993, 0.0404499993, 0.0404499993, 0.0404499993), u_xlat10_2.xyzz).xyz;
    {
        vec3 hlslcc_movcTemp = u_xlat16_3;
        hlslcc_movcTemp.x = (u_xlatb5.x) ? u_xlat16_4.x : u_xlat16_3.x;
        hlslcc_movcTemp.y = (u_xlatb5.y) ? u_xlat16_4.y : u_xlat16_3.y;
        hlslcc_movcTemp.z = (u_xlatb5.z) ? u_xlat16_4.z : u_xlat16_3.z;
        u_xlat16_3 = hlslcc_movcTemp;
    }
    u_xlat5.xyz = u_xlat10_1.xyz + (-u_xlat16_3.xyz);
    u_xlat5.xyz = vec3(u_xlat0) * u_xlat5.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = log2(abs(u_xlat5.xyz));
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_3.xyz = exp2(u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_4.xyz = u_xlat5.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb5.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.00313080009), u_xlat5.xyzz).xyz;
    SV_Target0.x = (u_xlatb5.x) ? u_xlat16_4.x : u_xlat16_3.x;
    SV_Target0.y = (u_xlatb5.y) ? u_xlat16_4.y : u_xlat16_3.y;
    SV_Target0.z = (u_xlatb5.z) ? u_xlat16_4.z : u_xlat16_3.z;
    u_xlat16_3.x = max(u_xlat10_1.y, u_xlat10_1.x);
    u_xlat16_3.x = max(u_xlat10_1.z, u_xlat16_3.x);
    u_xlat5.x = (-u_xlat10_2.w) + u_xlat16_3.x;
    u_xlat0 = u_xlat0 * u_xlat5.x + u_xlat10_2.w;
    SV_Target0.w = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_USE_DRAW_PROCEDURAL" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ScaleBias;
out highp vec2 vs_TEXCOORD0;
int u_xlati0;
uvec2 u_xlatu0;
vec3 u_xlat1;
int u_xlati4;
void main()
{
    u_xlati0 = int(uint(uint(gl_VertexID) & 1u));
    u_xlatu0.y = uint(uint(gl_VertexID) >> 1u);
    u_xlati4 = (-u_xlati0) + (-int(u_xlatu0.y));
    u_xlati0 = u_xlati0 + int(u_xlatu0.y);
    u_xlatu0.x = uint(uint(u_xlati0) & 1u);
    u_xlat1.xz = vec2(u_xlatu0.yx);
    vs_TEXCOORD0.xy = u_xlat1.xz * _ScaleBias.xy + _ScaleBias.zw;
    u_xlati0 = u_xlati4 + 1;
    u_xlatu0.x = uint(uint(u_xlati0) & 1u);
    u_xlat1.y = float(u_xlatu0.x);
    gl_Position.xy = u_xlat1.xy * vec2(2.0, -2.0) + vec2(-1.0, 1.0);
    gl_Position.zw = vec2(-1.0, 1.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _SourceSize;
uniform 	vec4 _CoCParams;
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
UNITY_LOCATION(1) uniform mediump sampler2D _DofTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _FullCoCTexture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat10_0;
mediump float u_xlat16_1;
mediump vec4 u_xlat10_1;
mediump vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
bvec3 u_xlatb5;
float u_xlat10;
void main()
{
    u_xlat10_0 = texture(_FullCoCTexture, vs_TEXCOORD0.xy).x;
    u_xlat16_1 = u_xlat10_0 + -0.5;
    u_xlat16_1 = u_xlat16_1 + u_xlat16_1;
    u_xlat0 = _SourceSize.w + _SourceSize.w;
    u_xlat5.x = u_xlat16_1 * _CoCParams.z + (-u_xlat0);
    u_xlat0 = float(1.0) / u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat5.x = u_xlat0 * -2.0 + 3.0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat10 = u_xlat0 * u_xlat5.x;
    u_xlat10_1 = texture(_DofTexture, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat5.x * u_xlat0 + u_xlat10_1.w;
    u_xlat0 = (-u_xlat10) * u_xlat10_1.w + u_xlat0;
    u_xlat10_2 = texture(_SourceTex, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat10_2.xyz + vec3(0.0549999997, 0.0549999997, 0.0549999997);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.947867334, 0.947867334, 0.947867334);
    u_xlat16_3.xyz = log2(abs(u_xlat16_3.xyz));
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(2.4000001, 2.4000001, 2.4000001);
    u_xlat16_3.xyz = exp2(u_xlat16_3.xyz);
    u_xlat16_4.xyz = u_xlat10_2.xyz * vec3(0.0773993805, 0.0773993805, 0.0773993805);
    u_xlatb5.xyz = greaterThanEqual(vec4(0.0404499993, 0.0404499993, 0.0404499993, 0.0404499993), u_xlat10_2.xyzz).xyz;
    {
        vec3 hlslcc_movcTemp = u_xlat16_3;
        hlslcc_movcTemp.x = (u_xlatb5.x) ? u_xlat16_4.x : u_xlat16_3.x;
        hlslcc_movcTemp.y = (u_xlatb5.y) ? u_xlat16_4.y : u_xlat16_3.y;
        hlslcc_movcTemp.z = (u_xlatb5.z) ? u_xlat16_4.z : u_xlat16_3.z;
        u_xlat16_3 = hlslcc_movcTemp;
    }
    u_xlat5.xyz = u_xlat10_1.xyz + (-u_xlat16_3.xyz);
    u_xlat5.xyz = vec3(u_xlat0) * u_xlat5.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = log2(abs(u_xlat5.xyz));
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_3.xyz = exp2(u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_4.xyz = u_xlat5.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb5.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.00313080009), u_xlat5.xyzz).xyz;
    SV_Target0.x = (u_xlatb5.x) ? u_xlat16_4.x : u_xlat16_3.x;
    SV_Target0.y = (u_xlatb5.y) ? u_xlat16_4.y : u_xlat16_3.y;
    SV_Target0.z = (u_xlatb5.z) ? u_xlat16_4.z : u_xlat16_3.z;
    u_xlat16_3.x = max(u_xlat10_1.y, u_xlat10_1.x);
    u_xlat16_3.x = max(u_xlat10_1.z, u_xlat16_3.x);
    u_xlat5.x = (-u_xlat10_2.w) + u_xlat16_3.x;
    u_xlat0 = u_xlat0 * u_xlat5.x + u_xlat10_2.w;
    SV_Target0.w = u_xlat0;
    return;
}

#endif
"
}
}
}
}
}