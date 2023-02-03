//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Universal Render Pipeline/Bloom" {
Properties {
}
SubShader {
 LOD 100
 Tags { "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" }
 Pass {
  Name "Bloom Prefilter"
  LOD 100
  Tags { "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" }
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 53086
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
uniform 	vec4 _Params;
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump vec3 u_xlat16_1;
float u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat10_3;
mediump float u_xlat16_4;
float u_xlat5;
void main()
{
    u_xlat0 = _Params.w + _Params.w;
    u_xlat10_3.xyz = texture(_SourceTex, vs_TEXCOORD0.xy).xyz;
    u_xlat3.xyz = min(u_xlat10_3.xyz, _Params.yyy);
    u_xlat16_1.x = max(u_xlat3.y, u_xlat3.x);
    u_xlat16_1.x = max(u_xlat3.z, u_xlat16_1.x);
    u_xlat2 = u_xlat16_1.x + (-_Params.z);
    u_xlat16_1.x = max(u_xlat16_1.x, 9.99999975e-05);
    u_xlat5 = u_xlat2 + _Params.w;
    u_xlat5 = max(u_xlat5, 0.0);
    u_xlat0 = min(u_xlat0, u_xlat5);
    u_xlat16_4 = u_xlat0 * u_xlat0;
    u_xlat0 = _Params.w * 4.0 + 9.99999975e-05;
    u_xlat0 = u_xlat16_4 / u_xlat0;
    u_xlat0 = max(u_xlat0, u_xlat2);
    u_xlat0 = u_xlat0 / u_xlat16_1.x;
    u_xlat16_1.xyz = vec3(u_xlat0) * u_xlat3.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = sqrt(u_xlat16_1.xyz);
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Local Keywords { "_BLOOM_HQ" }
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
uniform 	vec4 _SourceTex_TexelSize;
uniform 	vec4 _Params;
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat10_0;
vec4 u_xlat1;
mediump vec3 u_xlat10_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat10_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat10_7;
float u_xlat9;
mediump float u_xlat16_10;
float u_xlat24;
void main()
{
    u_xlat0 = _SourceTex_TexelSize.xxxx * vec4(-0.5, -0.5, 0.5, -0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_1.xyz = texture(_SourceTex, u_xlat0.xy).xyz;
    u_xlat10_0.xyz = texture(_SourceTex, u_xlat0.zw).xyz;
    u_xlat16_2.xyz = u_xlat10_0.xyz + u_xlat10_1.xyz;
    u_xlat0 = _SourceTex_TexelSize.xxxx * vec4(-0.5, 0.5, 0.5, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_1.xyz = texture(_SourceTex, u_xlat0.xy).xyz;
    u_xlat10_0.xyz = texture(_SourceTex, u_xlat0.zw).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat10_0.xyz + u_xlat16_2.xyz;
    u_xlat0.xy = vs_TEXCOORD0.xy + (-_SourceTex_TexelSize.xx);
    u_xlat10_0.xyz = texture(_SourceTex, u_xlat0.xy).xyz;
    u_xlat1 = _SourceTex_TexelSize.xxxx * vec4(0.0, -1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_3.xyz = texture(_SourceTex, u_xlat1.xy).xyz;
    u_xlat10_1.xyz = texture(_SourceTex, u_xlat1.zw).xyz;
    u_xlat16_4.xyz = u_xlat10_1.xyz + u_xlat10_3.xyz;
    u_xlat16_5.xyz = u_xlat10_0.xyz + u_xlat10_3.xyz;
    u_xlat10_0.xyz = texture(_SourceTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xyz = u_xlat10_0.xyz + u_xlat16_5.xyz;
    u_xlat1 = _SourceTex_TexelSize.xxxx * vec4(-1.0, 0.0, -1.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_3.xyz = texture(_SourceTex, u_xlat1.xy).xyz;
    u_xlat10_1.xyz = texture(_SourceTex, u_xlat1.zw).xyz;
    u_xlat16_5.xyz = u_xlat10_3.xyz + u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat10_0.xyz + u_xlat10_3.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.03125, 0.03125, 0.03125);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_5.xyz;
    u_xlat3 = _SourceTex_TexelSize.xxxx * vec4(1.0, 0.0, 0.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_7.xyz = texture(_SourceTex, u_xlat3.xy).xyz;
    u_xlat10_3.xyz = texture(_SourceTex, u_xlat3.zw).xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat10_7.xyz;
    u_xlat16_5.xyz = u_xlat10_0.xyz + u_xlat10_7.xyz;
    u_xlat16_4.xyz = u_xlat10_0.xyz + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(0.03125, 0.03125, 0.03125) + u_xlat16_2.xyz;
    u_xlat16_4.xyz = u_xlat10_3.xyz + u_xlat16_6.xyz;
    u_xlat16_4.xyz = u_xlat10_1.xyz + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(0.03125, 0.03125, 0.03125) + u_xlat16_2.xyz;
    u_xlat0.xy = vs_TEXCOORD0.xy + _SourceTex_TexelSize.xx;
    u_xlat10_0.xyz = texture(_SourceTex, u_xlat0.xy).xyz;
    u_xlat16_4.xyz = u_xlat10_0.xyz + u_xlat16_5.xyz;
    u_xlat16_4.xyz = u_xlat10_3.xyz + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(0.03125, 0.03125, 0.03125) + u_xlat16_2.xyz;
    u_xlat0.xyz = min(u_xlat16_2.xyz, _Params.yyy);
    u_xlat16_2.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat16_2.x = max(u_xlat0.z, u_xlat16_2.x);
    u_xlat24 = u_xlat16_2.x + (-_Params.z);
    u_xlat16_2.x = max(u_xlat16_2.x, 9.99999975e-05);
    u_xlat1.x = u_xlat24 + _Params.w;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat9 = _Params.w + _Params.w;
    u_xlat1.x = min(u_xlat9, u_xlat1.x);
    u_xlat16_10 = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = _Params.w * 4.0 + 9.99999975e-05;
    u_xlat1.x = u_xlat16_10 / u_xlat1.x;
    u_xlat24 = max(u_xlat24, u_xlat1.x);
    u_xlat24 = u_xlat24 / u_xlat16_2.x;
    u_xlat16_2.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = sqrt(u_xlat16_2.xyz);
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Local Keywords { "_USE_RGBM" }
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
uniform 	vec4 _Params;
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_1;
float u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat10_3;
mediump vec3 u_xlat16_4;
float u_xlat5;
void main()
{
    u_xlat0.x = _Params.w + _Params.w;
    u_xlat10_3.xyz = texture(_SourceTex, vs_TEXCOORD0.xy).xyz;
    u_xlat3.xyz = min(u_xlat10_3.xyz, _Params.yyy);
    u_xlat16_1.x = max(u_xlat3.y, u_xlat3.x);
    u_xlat16_1.x = max(u_xlat3.z, u_xlat16_1.x);
    u_xlat2 = u_xlat16_1.x + (-_Params.z);
    u_xlat16_1.x = max(u_xlat16_1.x, 9.99999975e-05);
    u_xlat5 = u_xlat2 + _Params.w;
    u_xlat5 = max(u_xlat5, 0.0);
    u_xlat0.x = min(u_xlat0.x, u_xlat5);
    u_xlat16_4.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = _Params.w * 4.0 + 9.99999975e-05;
    u_xlat0.x = u_xlat16_4.x / u_xlat0.x;
    u_xlat0.x = max(u_xlat0.x, u_xlat2);
    u_xlat0.x = u_xlat0.x / u_xlat16_1.x;
    u_xlat16_1.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat16_1.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat16_4.x = max(u_xlat0.z, 9.99999975e-06);
    u_xlat16_1.x = max(u_xlat16_4.x, u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * 255.0;
    u_xlat16_1.x = ceil(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * 0.00392156886;
    u_xlat16_4.xyz = u_xlat0.xyz / u_xlat16_1.xxx;
    SV_Target0.w = u_xlat16_1.x;
    SV_Target0.xyz = sqrt(u_xlat16_4.xyz);
    return;
}

#endif
"
}
SubProgram "gles3 " {
Local Keywords { "_BLOOM_HQ" "_USE_RGBM" }
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
uniform 	vec4 _SourceTex_TexelSize;
uniform 	vec4 _Params;
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat10_0;
vec4 u_xlat1;
mediump vec3 u_xlat10_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat10_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat10_7;
float u_xlat9;
mediump vec3 u_xlat16_10;
float u_xlat24;
void main()
{
    u_xlat0 = _SourceTex_TexelSize.xxxx * vec4(-0.5, -0.5, 0.5, -0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_1.xyz = texture(_SourceTex, u_xlat0.xy).xyz;
    u_xlat10_0.xyz = texture(_SourceTex, u_xlat0.zw).xyz;
    u_xlat16_2.xyz = u_xlat10_0.xyz + u_xlat10_1.xyz;
    u_xlat0 = _SourceTex_TexelSize.xxxx * vec4(-0.5, 0.5, 0.5, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_1.xyz = texture(_SourceTex, u_xlat0.xy).xyz;
    u_xlat10_0.xyz = texture(_SourceTex, u_xlat0.zw).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat10_0.xyz + u_xlat16_2.xyz;
    u_xlat0.xy = vs_TEXCOORD0.xy + (-_SourceTex_TexelSize.xx);
    u_xlat10_0.xyz = texture(_SourceTex, u_xlat0.xy).xyz;
    u_xlat1 = _SourceTex_TexelSize.xxxx * vec4(0.0, -1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_3.xyz = texture(_SourceTex, u_xlat1.xy).xyz;
    u_xlat10_1.xyz = texture(_SourceTex, u_xlat1.zw).xyz;
    u_xlat16_4.xyz = u_xlat10_1.xyz + u_xlat10_3.xyz;
    u_xlat16_5.xyz = u_xlat10_0.xyz + u_xlat10_3.xyz;
    u_xlat10_0.xyz = texture(_SourceTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xyz = u_xlat10_0.xyz + u_xlat16_5.xyz;
    u_xlat1 = _SourceTex_TexelSize.xxxx * vec4(-1.0, 0.0, -1.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_3.xyz = texture(_SourceTex, u_xlat1.xy).xyz;
    u_xlat10_1.xyz = texture(_SourceTex, u_xlat1.zw).xyz;
    u_xlat16_5.xyz = u_xlat10_3.xyz + u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat10_0.xyz + u_xlat10_3.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.03125, 0.03125, 0.03125);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_5.xyz;
    u_xlat3 = _SourceTex_TexelSize.xxxx * vec4(1.0, 0.0, 0.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_7.xyz = texture(_SourceTex, u_xlat3.xy).xyz;
    u_xlat10_3.xyz = texture(_SourceTex, u_xlat3.zw).xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat10_7.xyz;
    u_xlat16_5.xyz = u_xlat10_0.xyz + u_xlat10_7.xyz;
    u_xlat16_4.xyz = u_xlat10_0.xyz + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(0.03125, 0.03125, 0.03125) + u_xlat16_2.xyz;
    u_xlat16_4.xyz = u_xlat10_3.xyz + u_xlat16_6.xyz;
    u_xlat16_4.xyz = u_xlat10_1.xyz + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(0.03125, 0.03125, 0.03125) + u_xlat16_2.xyz;
    u_xlat0.xy = vs_TEXCOORD0.xy + _SourceTex_TexelSize.xx;
    u_xlat10_0.xyz = texture(_SourceTex, u_xlat0.xy).xyz;
    u_xlat16_4.xyz = u_xlat10_0.xyz + u_xlat16_5.xyz;
    u_xlat16_4.xyz = u_xlat10_3.xyz + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(0.03125, 0.03125, 0.03125) + u_xlat16_2.xyz;
    u_xlat0.xyz = min(u_xlat16_2.xyz, _Params.yyy);
    u_xlat16_2.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat16_2.x = max(u_xlat0.z, u_xlat16_2.x);
    u_xlat24 = u_xlat16_2.x + (-_Params.z);
    u_xlat16_2.x = max(u_xlat16_2.x, 9.99999975e-05);
    u_xlat1.x = u_xlat24 + _Params.w;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat9 = _Params.w + _Params.w;
    u_xlat1.x = min(u_xlat9, u_xlat1.x);
    u_xlat16_10.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = _Params.w * 4.0 + 9.99999975e-05;
    u_xlat1.x = u_xlat16_10.x / u_xlat1.x;
    u_xlat24 = max(u_xlat24, u_xlat1.x);
    u_xlat24 = u_xlat24 / u_xlat16_2.x;
    u_xlat16_2.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = u_xlat16_2.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat16_2.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat16_10.x = max(u_xlat0.z, 9.99999975e-06);
    u_xlat16_2.x = max(u_xlat16_10.x, u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * 255.0;
    u_xlat16_2.x = ceil(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * 0.00392156886;
    u_xlat16_10.xyz = u_xlat0.xyz / u_xlat16_2.xxx;
    SV_Target0.w = u_xlat16_2.x;
    SV_Target0.xyz = sqrt(u_xlat16_10.xyz);
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
uniform 	vec4 _Params;
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump vec3 u_xlat16_1;
float u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat10_3;
mediump float u_xlat16_4;
float u_xlat5;
void main()
{
    u_xlat0 = _Params.w + _Params.w;
    u_xlat10_3.xyz = texture(_SourceTex, vs_TEXCOORD0.xy).xyz;
    u_xlat3.xyz = min(u_xlat10_3.xyz, _Params.yyy);
    u_xlat16_1.x = max(u_xlat3.y, u_xlat3.x);
    u_xlat16_1.x = max(u_xlat3.z, u_xlat16_1.x);
    u_xlat2 = u_xlat16_1.x + (-_Params.z);
    u_xlat16_1.x = max(u_xlat16_1.x, 9.99999975e-05);
    u_xlat5 = u_xlat2 + _Params.w;
    u_xlat5 = max(u_xlat5, 0.0);
    u_xlat0 = min(u_xlat0, u_xlat5);
    u_xlat16_4 = u_xlat0 * u_xlat0;
    u_xlat0 = _Params.w * 4.0 + 9.99999975e-05;
    u_xlat0 = u_xlat16_4 / u_xlat0;
    u_xlat0 = max(u_xlat0, u_xlat2);
    u_xlat0 = u_xlat0 / u_xlat16_1.x;
    u_xlat16_1.xyz = vec3(u_xlat0) * u_xlat3.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = sqrt(u_xlat16_1.xyz);
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_USE_DRAW_PROCEDURAL" }
Local Keywords { "_BLOOM_HQ" }
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
uniform 	vec4 _SourceTex_TexelSize;
uniform 	vec4 _Params;
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat10_0;
vec4 u_xlat1;
mediump vec3 u_xlat10_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat10_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat10_7;
float u_xlat9;
mediump float u_xlat16_10;
float u_xlat24;
void main()
{
    u_xlat0 = _SourceTex_TexelSize.xxxx * vec4(-0.5, -0.5, 0.5, -0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_1.xyz = texture(_SourceTex, u_xlat0.xy).xyz;
    u_xlat10_0.xyz = texture(_SourceTex, u_xlat0.zw).xyz;
    u_xlat16_2.xyz = u_xlat10_0.xyz + u_xlat10_1.xyz;
    u_xlat0 = _SourceTex_TexelSize.xxxx * vec4(-0.5, 0.5, 0.5, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_1.xyz = texture(_SourceTex, u_xlat0.xy).xyz;
    u_xlat10_0.xyz = texture(_SourceTex, u_xlat0.zw).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat10_0.xyz + u_xlat16_2.xyz;
    u_xlat0.xy = vs_TEXCOORD0.xy + (-_SourceTex_TexelSize.xx);
    u_xlat10_0.xyz = texture(_SourceTex, u_xlat0.xy).xyz;
    u_xlat1 = _SourceTex_TexelSize.xxxx * vec4(0.0, -1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_3.xyz = texture(_SourceTex, u_xlat1.xy).xyz;
    u_xlat10_1.xyz = texture(_SourceTex, u_xlat1.zw).xyz;
    u_xlat16_4.xyz = u_xlat10_1.xyz + u_xlat10_3.xyz;
    u_xlat16_5.xyz = u_xlat10_0.xyz + u_xlat10_3.xyz;
    u_xlat10_0.xyz = texture(_SourceTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xyz = u_xlat10_0.xyz + u_xlat16_5.xyz;
    u_xlat1 = _SourceTex_TexelSize.xxxx * vec4(-1.0, 0.0, -1.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_3.xyz = texture(_SourceTex, u_xlat1.xy).xyz;
    u_xlat10_1.xyz = texture(_SourceTex, u_xlat1.zw).xyz;
    u_xlat16_5.xyz = u_xlat10_3.xyz + u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat10_0.xyz + u_xlat10_3.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.03125, 0.03125, 0.03125);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_5.xyz;
    u_xlat3 = _SourceTex_TexelSize.xxxx * vec4(1.0, 0.0, 0.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_7.xyz = texture(_SourceTex, u_xlat3.xy).xyz;
    u_xlat10_3.xyz = texture(_SourceTex, u_xlat3.zw).xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat10_7.xyz;
    u_xlat16_5.xyz = u_xlat10_0.xyz + u_xlat10_7.xyz;
    u_xlat16_4.xyz = u_xlat10_0.xyz + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(0.03125, 0.03125, 0.03125) + u_xlat16_2.xyz;
    u_xlat16_4.xyz = u_xlat10_3.xyz + u_xlat16_6.xyz;
    u_xlat16_4.xyz = u_xlat10_1.xyz + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(0.03125, 0.03125, 0.03125) + u_xlat16_2.xyz;
    u_xlat0.xy = vs_TEXCOORD0.xy + _SourceTex_TexelSize.xx;
    u_xlat10_0.xyz = texture(_SourceTex, u_xlat0.xy).xyz;
    u_xlat16_4.xyz = u_xlat10_0.xyz + u_xlat16_5.xyz;
    u_xlat16_4.xyz = u_xlat10_3.xyz + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(0.03125, 0.03125, 0.03125) + u_xlat16_2.xyz;
    u_xlat0.xyz = min(u_xlat16_2.xyz, _Params.yyy);
    u_xlat16_2.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat16_2.x = max(u_xlat0.z, u_xlat16_2.x);
    u_xlat24 = u_xlat16_2.x + (-_Params.z);
    u_xlat16_2.x = max(u_xlat16_2.x, 9.99999975e-05);
    u_xlat1.x = u_xlat24 + _Params.w;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat9 = _Params.w + _Params.w;
    u_xlat1.x = min(u_xlat9, u_xlat1.x);
    u_xlat16_10 = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = _Params.w * 4.0 + 9.99999975e-05;
    u_xlat1.x = u_xlat16_10 / u_xlat1.x;
    u_xlat24 = max(u_xlat24, u_xlat1.x);
    u_xlat24 = u_xlat24 / u_xlat16_2.x;
    u_xlat16_2.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = sqrt(u_xlat16_2.xyz);
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_USE_DRAW_PROCEDURAL" }
Local Keywords { "_USE_RGBM" }
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
uniform 	vec4 _Params;
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_1;
float u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat10_3;
mediump vec3 u_xlat16_4;
float u_xlat5;
void main()
{
    u_xlat0.x = _Params.w + _Params.w;
    u_xlat10_3.xyz = texture(_SourceTex, vs_TEXCOORD0.xy).xyz;
    u_xlat3.xyz = min(u_xlat10_3.xyz, _Params.yyy);
    u_xlat16_1.x = max(u_xlat3.y, u_xlat3.x);
    u_xlat16_1.x = max(u_xlat3.z, u_xlat16_1.x);
    u_xlat2 = u_xlat16_1.x + (-_Params.z);
    u_xlat16_1.x = max(u_xlat16_1.x, 9.99999975e-05);
    u_xlat5 = u_xlat2 + _Params.w;
    u_xlat5 = max(u_xlat5, 0.0);
    u_xlat0.x = min(u_xlat0.x, u_xlat5);
    u_xlat16_4.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = _Params.w * 4.0 + 9.99999975e-05;
    u_xlat0.x = u_xlat16_4.x / u_xlat0.x;
    u_xlat0.x = max(u_xlat0.x, u_xlat2);
    u_xlat0.x = u_xlat0.x / u_xlat16_1.x;
    u_xlat16_1.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat16_1.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat16_4.x = max(u_xlat0.z, 9.99999975e-06);
    u_xlat16_1.x = max(u_xlat16_4.x, u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * 255.0;
    u_xlat16_1.x = ceil(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * 0.00392156886;
    u_xlat16_4.xyz = u_xlat0.xyz / u_xlat16_1.xxx;
    SV_Target0.w = u_xlat16_1.x;
    SV_Target0.xyz = sqrt(u_xlat16_4.xyz);
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_USE_DRAW_PROCEDURAL" }
Local Keywords { "_BLOOM_HQ" "_USE_RGBM" }
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
uniform 	vec4 _SourceTex_TexelSize;
uniform 	vec4 _Params;
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat10_0;
vec4 u_xlat1;
mediump vec3 u_xlat10_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat10_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat10_7;
float u_xlat9;
mediump vec3 u_xlat16_10;
float u_xlat24;
void main()
{
    u_xlat0 = _SourceTex_TexelSize.xxxx * vec4(-0.5, -0.5, 0.5, -0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_1.xyz = texture(_SourceTex, u_xlat0.xy).xyz;
    u_xlat10_0.xyz = texture(_SourceTex, u_xlat0.zw).xyz;
    u_xlat16_2.xyz = u_xlat10_0.xyz + u_xlat10_1.xyz;
    u_xlat0 = _SourceTex_TexelSize.xxxx * vec4(-0.5, 0.5, 0.5, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_1.xyz = texture(_SourceTex, u_xlat0.xy).xyz;
    u_xlat10_0.xyz = texture(_SourceTex, u_xlat0.zw).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat10_0.xyz + u_xlat16_2.xyz;
    u_xlat0.xy = vs_TEXCOORD0.xy + (-_SourceTex_TexelSize.xx);
    u_xlat10_0.xyz = texture(_SourceTex, u_xlat0.xy).xyz;
    u_xlat1 = _SourceTex_TexelSize.xxxx * vec4(0.0, -1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_3.xyz = texture(_SourceTex, u_xlat1.xy).xyz;
    u_xlat10_1.xyz = texture(_SourceTex, u_xlat1.zw).xyz;
    u_xlat16_4.xyz = u_xlat10_1.xyz + u_xlat10_3.xyz;
    u_xlat16_5.xyz = u_xlat10_0.xyz + u_xlat10_3.xyz;
    u_xlat10_0.xyz = texture(_SourceTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xyz = u_xlat10_0.xyz + u_xlat16_5.xyz;
    u_xlat1 = _SourceTex_TexelSize.xxxx * vec4(-1.0, 0.0, -1.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_3.xyz = texture(_SourceTex, u_xlat1.xy).xyz;
    u_xlat10_1.xyz = texture(_SourceTex, u_xlat1.zw).xyz;
    u_xlat16_5.xyz = u_xlat10_3.xyz + u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat10_0.xyz + u_xlat10_3.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.03125, 0.03125, 0.03125);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.125, 0.125, 0.125) + u_xlat16_5.xyz;
    u_xlat3 = _SourceTex_TexelSize.xxxx * vec4(1.0, 0.0, 0.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_7.xyz = texture(_SourceTex, u_xlat3.xy).xyz;
    u_xlat10_3.xyz = texture(_SourceTex, u_xlat3.zw).xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat10_7.xyz;
    u_xlat16_5.xyz = u_xlat10_0.xyz + u_xlat10_7.xyz;
    u_xlat16_4.xyz = u_xlat10_0.xyz + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(0.03125, 0.03125, 0.03125) + u_xlat16_2.xyz;
    u_xlat16_4.xyz = u_xlat10_3.xyz + u_xlat16_6.xyz;
    u_xlat16_4.xyz = u_xlat10_1.xyz + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(0.03125, 0.03125, 0.03125) + u_xlat16_2.xyz;
    u_xlat0.xy = vs_TEXCOORD0.xy + _SourceTex_TexelSize.xx;
    u_xlat10_0.xyz = texture(_SourceTex, u_xlat0.xy).xyz;
    u_xlat16_4.xyz = u_xlat10_0.xyz + u_xlat16_5.xyz;
    u_xlat16_4.xyz = u_xlat10_3.xyz + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(0.03125, 0.03125, 0.03125) + u_xlat16_2.xyz;
    u_xlat0.xyz = min(u_xlat16_2.xyz, _Params.yyy);
    u_xlat16_2.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat16_2.x = max(u_xlat0.z, u_xlat16_2.x);
    u_xlat24 = u_xlat16_2.x + (-_Params.z);
    u_xlat16_2.x = max(u_xlat16_2.x, 9.99999975e-05);
    u_xlat1.x = u_xlat24 + _Params.w;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat9 = _Params.w + _Params.w;
    u_xlat1.x = min(u_xlat9, u_xlat1.x);
    u_xlat16_10.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = _Params.w * 4.0 + 9.99999975e-05;
    u_xlat1.x = u_xlat16_10.x / u_xlat1.x;
    u_xlat24 = max(u_xlat24, u_xlat1.x);
    u_xlat24 = u_xlat24 / u_xlat16_2.x;
    u_xlat16_2.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = u_xlat16_2.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat16_2.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat16_10.x = max(u_xlat0.z, 9.99999975e-06);
    u_xlat16_2.x = max(u_xlat16_10.x, u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * 255.0;
    u_xlat16_2.x = ceil(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * 0.00392156886;
    u_xlat16_10.xyz = u_xlat0.xyz / u_xlat16_2.xxx;
    SV_Target0.w = u_xlat16_2.x;
    SV_Target0.xyz = sqrt(u_xlat16_10.xyz);
    return;
}

#endif
"
}
}
}
 Pass {
  Name "Bloom Blur Horizontal"
  LOD 100
  Tags { "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" }
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 67328
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
uniform 	vec4 _SourceTex_TexelSize;
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat10_0;
vec4 u_xlat1;
mediump vec3 u_xlat10_1;
vec4 u_xlat2;
mediump vec3 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat10_5;
mediump vec3 u_xlat16_6;
void main()
{
    u_xlat0.xz = _SourceTex_TexelSize.xx * vec2(8.0, 6.0);
    u_xlat0.y = float(0.0);
    u_xlat0.w = float(0.0);
    u_xlat1 = (-u_xlat0) + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0.zwxw + vs_TEXCOORD0.xyxy;
    u_xlat10_2.xyz = texture(_SourceTex, u_xlat1.zw).xyz;
    u_xlat10_1.xyz = texture(_SourceTex, u_xlat1.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_1.xyz * u_xlat10_1.xyz;
    u_xlat16_4.xyz = u_xlat10_2.xyz * u_xlat10_2.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.0540540516, 0.0540540516, 0.0540540516);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.0162162203, 0.0162162203, 0.0162162203) + u_xlat16_4.xyz;
    u_xlat1.xz = _SourceTex_TexelSize.xx * vec2(4.0, 2.0);
    u_xlat1.y = float(0.0);
    u_xlat1.w = float(0.0);
    u_xlat2 = (-u_xlat1) + vs_TEXCOORD0.xyxy;
    u_xlat1 = u_xlat1.zwxy + vs_TEXCOORD0.xyxy;
    u_xlat10_5.xyz = texture(_SourceTex, u_xlat2.xy).xyz;
    u_xlat10_2.xyz = texture(_SourceTex, u_xlat2.zw).xyz;
    u_xlat16_4.xyz = u_xlat10_2.xyz * u_xlat10_2.xyz;
    u_xlat16_6.xyz = u_xlat10_5.xyz * u_xlat10_5.xyz;
    u_xlat16_3.xyz = u_xlat16_6.xyz * vec3(0.121621624, 0.121621624, 0.121621624) + u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(0.194594592, 0.194594592, 0.194594592) + u_xlat16_3.xyz;
    u_xlat10_2.xyz = texture(_SourceTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_4.xyz = u_xlat10_2.xyz * u_xlat10_2.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(0.227027029, 0.227027029, 0.227027029) + u_xlat16_3.xyz;
    u_xlat10_2.xyz = texture(_SourceTex, u_xlat1.xy).xyz;
    u_xlat10_1.xyz = texture(_SourceTex, u_xlat1.zw).xyz;
    u_xlat16_4.xyz = u_xlat10_1.xyz * u_xlat10_1.xyz;
    u_xlat16_6.xyz = u_xlat10_2.xyz * u_xlat10_2.xyz;
    u_xlat16_3.xyz = u_xlat16_6.xyz * vec3(0.194594592, 0.194594592, 0.194594592) + u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(0.121621624, 0.121621624, 0.121621624) + u_xlat16_3.xyz;
    u_xlat10_1.xyz = texture(_SourceTex, u_xlat0.xy).xyz;
    u_xlat10_0.xyz = texture(_SourceTex, u_xlat0.zw).xyz;
    u_xlat16_4.xyz = u_xlat10_0.xyz * u_xlat10_0.xyz;
    u_xlat16_6.xyz = u_xlat10_1.xyz * u_xlat10_1.xyz;
    u_xlat16_3.xyz = u_xlat16_6.xyz * vec3(0.0540540516, 0.0540540516, 0.0540540516) + u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(0.0162162203, 0.0162162203, 0.0162162203) + u_xlat16_3.xyz;
    SV_Target0.xyz = sqrt(u_xlat16_3.xyz);
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Local Keywords { "_USE_RGBM" }
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
uniform 	vec4 _SourceTex_TexelSize;
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat10_1;
vec4 u_xlat2;
mediump vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat10_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_9;
void main()
{
    u_xlat0.xz = _SourceTex_TexelSize.xx * vec2(8.0, 6.0);
    u_xlat0.y = float(0.0);
    u_xlat0.w = float(0.0);
    u_xlat1 = (-u_xlat0) + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0.zwxw + vs_TEXCOORD0.xyxy;
    u_xlat10_2 = texture(_SourceTex, u_xlat1.zw);
    u_xlat10_1 = texture(_SourceTex, u_xlat1.xy);
    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat10_2.xyz;
    u_xlat16_3.xyz = u_xlat10_2.www * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.432432413, 0.432432413, 0.432432413);
    u_xlat16_4.xyz = u_xlat10_1.xyz * u_xlat10_1.xyz;
    u_xlat16_4.xyz = u_xlat10_1.www * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(0.129729763, 0.129729763, 0.129729763) + u_xlat16_3.xyz;
    u_xlat1.xz = _SourceTex_TexelSize.xx * vec2(4.0, 2.0);
    u_xlat1.y = float(0.0);
    u_xlat1.w = float(0.0);
    u_xlat2 = (-u_xlat1) + vs_TEXCOORD0.xyxy;
    u_xlat1 = u_xlat1.zwxy + vs_TEXCOORD0.xyxy;
    u_xlat10_4 = texture(_SourceTex, u_xlat2.xy);
    u_xlat10_2 = texture(_SourceTex, u_xlat2.zw);
    u_xlat16_5.xyz = u_xlat10_4.xyz * u_xlat10_4.xyz;
    u_xlat16_5.xyz = u_xlat10_4.www * u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_5.xyz * vec3(0.972972989, 0.972972989, 0.972972989) + u_xlat16_3.xyz;
    u_xlat16_5.xyz = u_xlat10_2.xyz * u_xlat10_2.xyz;
    u_xlat16_5.xyz = u_xlat10_2.www * u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_5.xyz * vec3(1.55675673, 1.55675673, 1.55675673) + u_xlat16_3.xyz;
    u_xlat10_2 = texture(_SourceTex, vs_TEXCOORD0.xy);
    u_xlat16_5.xyz = u_xlat10_2.xyz * u_xlat10_2.xyz;
    u_xlat16_5.xyz = u_xlat10_2.www * u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_5.xyz * vec3(1.81621623, 1.81621623, 1.81621623) + u_xlat16_3.xyz;
    u_xlat10_2 = texture(_SourceTex, u_xlat1.xy);
    u_xlat10_1 = texture(_SourceTex, u_xlat1.zw);
    u_xlat16_5.xyz = u_xlat10_2.xyz * u_xlat10_2.xyz;
    u_xlat16_5.xyz = u_xlat10_2.www * u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_5.xyz * vec3(1.55675673, 1.55675673, 1.55675673) + u_xlat16_3.xyz;
    u_xlat16_5.xyz = u_xlat10_1.xyz * u_xlat10_1.xyz;
    u_xlat16_5.xyz = u_xlat10_1.www * u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_5.xyz * vec3(0.972972989, 0.972972989, 0.972972989) + u_xlat16_3.xyz;
    u_xlat10_1 = texture(_SourceTex, u_xlat0.xy);
    u_xlat10_0 = texture(_SourceTex, u_xlat0.zw);
    u_xlat16_5.xyz = u_xlat10_1.xyz * u_xlat10_1.xyz;
    u_xlat16_5.xyz = u_xlat10_1.www * u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_5.xyz * vec3(0.432432413, 0.432432413, 0.432432413) + u_xlat16_3.xyz;
    u_xlat16_5.xyz = u_xlat10_0.xyz * u_xlat10_0.xyz;
    u_xlat16_5.xyz = u_xlat10_0.www * u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_5.xyz * vec3(0.129729763, 0.129729763, 0.129729763) + u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat16_3.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat16_9.x = max(u_xlat0.z, 9.99999975e-06);
    u_xlat16_3.x = max(u_xlat16_9.x, u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x * 255.0;
    u_xlat16_3.x = ceil(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x * 0.00392156886;
    u_xlat16_9.xyz = u_xlat0.xyz / u_xlat16_3.xxx;
    SV_Target0.w = u_xlat16_3.x;
    SV_Target0.xyz = sqrt(u_xlat16_9.xyz);
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
uniform 	vec4 _SourceTex_TexelSize;
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat10_0;
vec4 u_xlat1;
mediump vec3 u_xlat10_1;
vec4 u_xlat2;
mediump vec3 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat10_5;
mediump vec3 u_xlat16_6;
void main()
{
    u_xlat0.xz = _SourceTex_TexelSize.xx * vec2(8.0, 6.0);
    u_xlat0.y = float(0.0);
    u_xlat0.w = float(0.0);
    u_xlat1 = (-u_xlat0) + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0.zwxw + vs_TEXCOORD0.xyxy;
    u_xlat10_2.xyz = texture(_SourceTex, u_xlat1.zw).xyz;
    u_xlat10_1.xyz = texture(_SourceTex, u_xlat1.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_1.xyz * u_xlat10_1.xyz;
    u_xlat16_4.xyz = u_xlat10_2.xyz * u_xlat10_2.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.0540540516, 0.0540540516, 0.0540540516);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.0162162203, 0.0162162203, 0.0162162203) + u_xlat16_4.xyz;
    u_xlat1.xz = _SourceTex_TexelSize.xx * vec2(4.0, 2.0);
    u_xlat1.y = float(0.0);
    u_xlat1.w = float(0.0);
    u_xlat2 = (-u_xlat1) + vs_TEXCOORD0.xyxy;
    u_xlat1 = u_xlat1.zwxy + vs_TEXCOORD0.xyxy;
    u_xlat10_5.xyz = texture(_SourceTex, u_xlat2.xy).xyz;
    u_xlat10_2.xyz = texture(_SourceTex, u_xlat2.zw).xyz;
    u_xlat16_4.xyz = u_xlat10_2.xyz * u_xlat10_2.xyz;
    u_xlat16_6.xyz = u_xlat10_5.xyz * u_xlat10_5.xyz;
    u_xlat16_3.xyz = u_xlat16_6.xyz * vec3(0.121621624, 0.121621624, 0.121621624) + u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(0.194594592, 0.194594592, 0.194594592) + u_xlat16_3.xyz;
    u_xlat10_2.xyz = texture(_SourceTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_4.xyz = u_xlat10_2.xyz * u_xlat10_2.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(0.227027029, 0.227027029, 0.227027029) + u_xlat16_3.xyz;
    u_xlat10_2.xyz = texture(_SourceTex, u_xlat1.xy).xyz;
    u_xlat10_1.xyz = texture(_SourceTex, u_xlat1.zw).xyz;
    u_xlat16_4.xyz = u_xlat10_1.xyz * u_xlat10_1.xyz;
    u_xlat16_6.xyz = u_xlat10_2.xyz * u_xlat10_2.xyz;
    u_xlat16_3.xyz = u_xlat16_6.xyz * vec3(0.194594592, 0.194594592, 0.194594592) + u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(0.121621624, 0.121621624, 0.121621624) + u_xlat16_3.xyz;
    u_xlat10_1.xyz = texture(_SourceTex, u_xlat0.xy).xyz;
    u_xlat10_0.xyz = texture(_SourceTex, u_xlat0.zw).xyz;
    u_xlat16_4.xyz = u_xlat10_0.xyz * u_xlat10_0.xyz;
    u_xlat16_6.xyz = u_xlat10_1.xyz * u_xlat10_1.xyz;
    u_xlat16_3.xyz = u_xlat16_6.xyz * vec3(0.0540540516, 0.0540540516, 0.0540540516) + u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(0.0162162203, 0.0162162203, 0.0162162203) + u_xlat16_3.xyz;
    SV_Target0.xyz = sqrt(u_xlat16_3.xyz);
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_USE_DRAW_PROCEDURAL" }
Local Keywords { "_USE_RGBM" }
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
uniform 	vec4 _SourceTex_TexelSize;
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat10_1;
vec4 u_xlat2;
mediump vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat10_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_9;
void main()
{
    u_xlat0.xz = _SourceTex_TexelSize.xx * vec2(8.0, 6.0);
    u_xlat0.y = float(0.0);
    u_xlat0.w = float(0.0);
    u_xlat1 = (-u_xlat0) + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0.zwxw + vs_TEXCOORD0.xyxy;
    u_xlat10_2 = texture(_SourceTex, u_xlat1.zw);
    u_xlat10_1 = texture(_SourceTex, u_xlat1.xy);
    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat10_2.xyz;
    u_xlat16_3.xyz = u_xlat10_2.www * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.432432413, 0.432432413, 0.432432413);
    u_xlat16_4.xyz = u_xlat10_1.xyz * u_xlat10_1.xyz;
    u_xlat16_4.xyz = u_xlat10_1.www * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(0.129729763, 0.129729763, 0.129729763) + u_xlat16_3.xyz;
    u_xlat1.xz = _SourceTex_TexelSize.xx * vec2(4.0, 2.0);
    u_xlat1.y = float(0.0);
    u_xlat1.w = float(0.0);
    u_xlat2 = (-u_xlat1) + vs_TEXCOORD0.xyxy;
    u_xlat1 = u_xlat1.zwxy + vs_TEXCOORD0.xyxy;
    u_xlat10_4 = texture(_SourceTex, u_xlat2.xy);
    u_xlat10_2 = texture(_SourceTex, u_xlat2.zw);
    u_xlat16_5.xyz = u_xlat10_4.xyz * u_xlat10_4.xyz;
    u_xlat16_5.xyz = u_xlat10_4.www * u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_5.xyz * vec3(0.972972989, 0.972972989, 0.972972989) + u_xlat16_3.xyz;
    u_xlat16_5.xyz = u_xlat10_2.xyz * u_xlat10_2.xyz;
    u_xlat16_5.xyz = u_xlat10_2.www * u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_5.xyz * vec3(1.55675673, 1.55675673, 1.55675673) + u_xlat16_3.xyz;
    u_xlat10_2 = texture(_SourceTex, vs_TEXCOORD0.xy);
    u_xlat16_5.xyz = u_xlat10_2.xyz * u_xlat10_2.xyz;
    u_xlat16_5.xyz = u_xlat10_2.www * u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_5.xyz * vec3(1.81621623, 1.81621623, 1.81621623) + u_xlat16_3.xyz;
    u_xlat10_2 = texture(_SourceTex, u_xlat1.xy);
    u_xlat10_1 = texture(_SourceTex, u_xlat1.zw);
    u_xlat16_5.xyz = u_xlat10_2.xyz * u_xlat10_2.xyz;
    u_xlat16_5.xyz = u_xlat10_2.www * u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_5.xyz * vec3(1.55675673, 1.55675673, 1.55675673) + u_xlat16_3.xyz;
    u_xlat16_5.xyz = u_xlat10_1.xyz * u_xlat10_1.xyz;
    u_xlat16_5.xyz = u_xlat10_1.www * u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_5.xyz * vec3(0.972972989, 0.972972989, 0.972972989) + u_xlat16_3.xyz;
    u_xlat10_1 = texture(_SourceTex, u_xlat0.xy);
    u_xlat10_0 = texture(_SourceTex, u_xlat0.zw);
    u_xlat16_5.xyz = u_xlat10_1.xyz * u_xlat10_1.xyz;
    u_xlat16_5.xyz = u_xlat10_1.www * u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_5.xyz * vec3(0.432432413, 0.432432413, 0.432432413) + u_xlat16_3.xyz;
    u_xlat16_5.xyz = u_xlat10_0.xyz * u_xlat10_0.xyz;
    u_xlat16_5.xyz = u_xlat10_0.www * u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_5.xyz * vec3(0.129729763, 0.129729763, 0.129729763) + u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat16_3.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat16_9.x = max(u_xlat0.z, 9.99999975e-06);
    u_xlat16_3.x = max(u_xlat16_9.x, u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x * 255.0;
    u_xlat16_3.x = ceil(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x * 0.00392156886;
    u_xlat16_9.xyz = u_xlat0.xyz / u_xlat16_3.xxx;
    SV_Target0.w = u_xlat16_3.x;
    SV_Target0.xyz = sqrt(u_xlat16_9.xyz);
    return;
}

#endif
"
}
}
}
 Pass {
  Name "Bloom Blur Vertical"
  LOD 100
  Tags { "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" }
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 187883
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
uniform 	vec4 _SourceTex_TexelSize;
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat10_0;
vec4 u_xlat1;
mediump vec3 u_xlat10_1;
mediump vec3 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
void main()
{
    u_xlat0.x = 0.0;
    u_xlat0.yw = _SourceTex_TexelSize.yy * vec2(3.23076916, 1.38461542);
    u_xlat1 = (-u_xlat0.xyxw) + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0.xwxy + vs_TEXCOORD0.xyxy;
    u_xlat10_2.xyz = texture(_SourceTex, u_xlat1.zw).xyz;
    u_xlat10_1.xyz = texture(_SourceTex, u_xlat1.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_1.xyz * u_xlat10_1.xyz;
    u_xlat16_4.xyz = u_xlat10_2.xyz * u_xlat10_2.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.31621623, 0.31621623, 0.31621623);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.0702702701, 0.0702702701, 0.0702702701) + u_xlat16_4.xyz;
    u_xlat10_1.xyz = texture(_SourceTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_4.xyz = u_xlat10_1.xyz * u_xlat10_1.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(0.227027029, 0.227027029, 0.227027029) + u_xlat16_3.xyz;
    u_xlat10_1.xyz = texture(_SourceTex, u_xlat0.xy).xyz;
    u_xlat10_0.xyz = texture(_SourceTex, u_xlat0.zw).xyz;
    u_xlat16_4.xyz = u_xlat10_0.xyz * u_xlat10_0.xyz;
    u_xlat16_5.xyz = u_xlat10_1.xyz * u_xlat10_1.xyz;
    u_xlat16_3.xyz = u_xlat16_5.xyz * vec3(0.31621623, 0.31621623, 0.31621623) + u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(0.0702702701, 0.0702702701, 0.0702702701) + u_xlat16_3.xyz;
    SV_Target0.xyz = sqrt(u_xlat16_3.xyz);
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Local Keywords { "_USE_RGBM" }
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
uniform 	vec4 _SourceTex_TexelSize;
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat10_2;
mediump vec4 u_xlat10_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_7;
void main()
{
    u_xlat10_0 = texture(_SourceTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat10_0.xyz;
    u_xlat16_1.xyz = u_xlat10_0.www * u_xlat16_1.xyz;
    u_xlat0.x = 0.0;
    u_xlat0.yw = _SourceTex_TexelSize.yy * vec2(3.23076916, 1.38461542);
    u_xlat2 = (-u_xlat0.xyxw) + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0.xwxy + vs_TEXCOORD0.xyxy;
    u_xlat10_3 = texture(_SourceTex, u_xlat2.zw);
    u_xlat10_2 = texture(_SourceTex, u_xlat2.xy);
    u_xlat16_4.xyz = u_xlat10_3.xyz * u_xlat10_3.xyz;
    u_xlat16_4.xyz = u_xlat10_3.www * u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(2.52972984, 2.52972984, 2.52972984);
    u_xlat16_5.xyz = u_xlat10_2.xyz * u_xlat10_2.xyz;
    u_xlat16_5.xyz = u_xlat10_2.www * u_xlat16_5.xyz;
    u_xlat16_4.xyz = u_xlat16_5.xyz * vec3(0.562162161, 0.562162161, 0.562162161) + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(1.81621623, 1.81621623, 1.81621623) + u_xlat16_4.xyz;
    u_xlat10_2 = texture(_SourceTex, u_xlat0.xy);
    u_xlat10_0 = texture(_SourceTex, u_xlat0.zw);
    u_xlat16_4.xyz = u_xlat10_2.xyz * u_xlat10_2.xyz;
    u_xlat16_4.xyz = u_xlat10_2.www * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(2.52972984, 2.52972984, 2.52972984) + u_xlat16_1.xyz;
    u_xlat16_4.xyz = u_xlat10_0.xyz * u_xlat10_0.xyz;
    u_xlat16_4.xyz = u_xlat10_0.www * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(0.562162161, 0.562162161, 0.562162161) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat16_1.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat16_7.x = max(u_xlat0.z, 9.99999975e-06);
    u_xlat16_1.x = max(u_xlat16_7.x, u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * 255.0;
    u_xlat16_1.x = ceil(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * 0.00392156886;
    u_xlat16_7.xyz = u_xlat0.xyz / u_xlat16_1.xxx;
    SV_Target0.w = u_xlat16_1.x;
    SV_Target0.xyz = sqrt(u_xlat16_7.xyz);
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
uniform 	vec4 _SourceTex_TexelSize;
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat10_0;
vec4 u_xlat1;
mediump vec3 u_xlat10_1;
mediump vec3 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
void main()
{
    u_xlat0.x = 0.0;
    u_xlat0.yw = _SourceTex_TexelSize.yy * vec2(3.23076916, 1.38461542);
    u_xlat1 = (-u_xlat0.xyxw) + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0.xwxy + vs_TEXCOORD0.xyxy;
    u_xlat10_2.xyz = texture(_SourceTex, u_xlat1.zw).xyz;
    u_xlat10_1.xyz = texture(_SourceTex, u_xlat1.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_1.xyz * u_xlat10_1.xyz;
    u_xlat16_4.xyz = u_xlat10_2.xyz * u_xlat10_2.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.31621623, 0.31621623, 0.31621623);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.0702702701, 0.0702702701, 0.0702702701) + u_xlat16_4.xyz;
    u_xlat10_1.xyz = texture(_SourceTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_4.xyz = u_xlat10_1.xyz * u_xlat10_1.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(0.227027029, 0.227027029, 0.227027029) + u_xlat16_3.xyz;
    u_xlat10_1.xyz = texture(_SourceTex, u_xlat0.xy).xyz;
    u_xlat10_0.xyz = texture(_SourceTex, u_xlat0.zw).xyz;
    u_xlat16_4.xyz = u_xlat10_0.xyz * u_xlat10_0.xyz;
    u_xlat16_5.xyz = u_xlat10_1.xyz * u_xlat10_1.xyz;
    u_xlat16_3.xyz = u_xlat16_5.xyz * vec3(0.31621623, 0.31621623, 0.31621623) + u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(0.0702702701, 0.0702702701, 0.0702702701) + u_xlat16_3.xyz;
    SV_Target0.xyz = sqrt(u_xlat16_3.xyz);
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_USE_DRAW_PROCEDURAL" }
Local Keywords { "_USE_RGBM" }
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
uniform 	vec4 _SourceTex_TexelSize;
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat10_2;
mediump vec4 u_xlat10_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_7;
void main()
{
    u_xlat10_0 = texture(_SourceTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat10_0.xyz;
    u_xlat16_1.xyz = u_xlat10_0.www * u_xlat16_1.xyz;
    u_xlat0.x = 0.0;
    u_xlat0.yw = _SourceTex_TexelSize.yy * vec2(3.23076916, 1.38461542);
    u_xlat2 = (-u_xlat0.xyxw) + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0.xwxy + vs_TEXCOORD0.xyxy;
    u_xlat10_3 = texture(_SourceTex, u_xlat2.zw);
    u_xlat10_2 = texture(_SourceTex, u_xlat2.xy);
    u_xlat16_4.xyz = u_xlat10_3.xyz * u_xlat10_3.xyz;
    u_xlat16_4.xyz = u_xlat10_3.www * u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(2.52972984, 2.52972984, 2.52972984);
    u_xlat16_5.xyz = u_xlat10_2.xyz * u_xlat10_2.xyz;
    u_xlat16_5.xyz = u_xlat10_2.www * u_xlat16_5.xyz;
    u_xlat16_4.xyz = u_xlat16_5.xyz * vec3(0.562162161, 0.562162161, 0.562162161) + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(1.81621623, 1.81621623, 1.81621623) + u_xlat16_4.xyz;
    u_xlat10_2 = texture(_SourceTex, u_xlat0.xy);
    u_xlat10_0 = texture(_SourceTex, u_xlat0.zw);
    u_xlat16_4.xyz = u_xlat10_2.xyz * u_xlat10_2.xyz;
    u_xlat16_4.xyz = u_xlat10_2.www * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(2.52972984, 2.52972984, 2.52972984) + u_xlat16_1.xyz;
    u_xlat16_4.xyz = u_xlat10_0.xyz * u_xlat10_0.xyz;
    u_xlat16_4.xyz = u_xlat10_0.www * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(0.562162161, 0.562162161, 0.562162161) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat16_1.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat16_7.x = max(u_xlat0.z, 9.99999975e-06);
    u_xlat16_1.x = max(u_xlat16_7.x, u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * 255.0;
    u_xlat16_1.x = ceil(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * 0.00392156886;
    u_xlat16_7.xyz = u_xlat0.xyz / u_xlat16_1.xxx;
    SV_Target0.w = u_xlat16_1.x;
    SV_Target0.xyz = sqrt(u_xlat16_7.xyz);
    return;
}

#endif
"
}
}
}
 Pass {
  Name "Bloom Upsample"
  LOD 100
  Tags { "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" }
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 206502
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
uniform 	vec4 _Params;
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
UNITY_LOCATION(1) uniform mediump sampler2D _SourceTexLowMip;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat10_0;
mediump vec3 u_xlat10_1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat10_0.xyz = texture(_SourceTexLowMip, vs_TEXCOORD0.xy).xyz;
    u_xlat10_1.xyz = texture(_SourceTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * u_xlat10_1.xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat10_0.xyz + (-u_xlat16_2.xyz);
    u_xlat0.xyz = _Params.xxx * u_xlat0.xyz + u_xlat16_2.xyz;
    SV_Target0.xyz = sqrt(u_xlat0.xyz);
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Local Keywords { "_BLOOM_HQ" }
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
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec4 _SourceTexLowMip_TexelSize;
uniform 	vec4 _Params;
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
UNITY_LOCATION(1) uniform mediump sampler2D _SourceTexLowMip;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat10_0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
vec2 u_xlat2;
mediump vec3 u_xlat10_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat10_4;
vec3 u_xlat5;
mediump vec3 u_xlat10_5;
mediump vec3 u_xlat16_6;
vec2 u_xlat14;
vec2 u_xlat16;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _SourceTexLowMip_TexelSize.zw + vec2(0.5, 0.5);
    u_xlat14.xy = fract(u_xlat0.xy);
    u_xlat0.xy = floor(u_xlat0.xy);
    u_xlat16_1.xy = u_xlat14.xy * vec2(0.5, 0.5) + vec2(-1.0, -1.0);
    u_xlat16_1.xy = u_xlat14.xy * u_xlat16_1.xy;
    u_xlat16_1.xy = u_xlat16_1.xy * u_xlat14.xy + vec2(0.666666687, 0.666666687);
    u_xlat2.xy = (-u_xlat16_1.xy) + vec2(1.0, 1.0);
    u_xlat16_3 = (-u_xlat14.xyxy) * vec4(0.5, 0.5, 0.166666672, 0.166666672) + vec4(0.5, 0.5, 0.5, 0.5);
    u_xlat16_3 = u_xlat14.xyxy * u_xlat16_3 + vec4(0.5, 0.5, -0.5, -0.5);
    u_xlat16_3 = u_xlat14.xyxy * u_xlat16_3 + vec4(0.166666672, 0.166666672, 0.166666672, 0.166666672);
    u_xlat14.xy = u_xlat2.xy + (-u_xlat16_3.xy);
    u_xlat14.xy = (-u_xlat16_3.zw) + u_xlat14.xy;
    u_xlat2.xy = u_xlat14.xy + u_xlat16_3.xy;
    u_xlat16.xy = u_xlat16_1.xy + u_xlat16_3.zw;
    u_xlat4.xy = vec2(1.0) / vec2(u_xlat2.xy);
    u_xlat3.xy = u_xlat14.xy * u_xlat4.xy + vec2(1.0, 1.0);
    u_xlat14.xy = vec2(1.0) / vec2(u_xlat16.xy);
    u_xlat3.zw = u_xlat16_1.xy * u_xlat14.xy + vec2(-1.0, -1.0);
    u_xlat1 = u_xlat0.xyxy + u_xlat3.zyxy;
    u_xlat0 = u_xlat0.xyxy + u_xlat3.zwxw;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat0 = u_xlat0 * _SourceTexLowMip_TexelSize.xyxy;
    u_xlat0 = min(u_xlat0, vec4(1.0, 1.0, 1.0, 1.0));
    u_xlat1 = u_xlat1 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1 = u_xlat1 * _SourceTexLowMip_TexelSize.xyxy;
    u_xlat1 = min(u_xlat1, vec4(1.0, 1.0, 1.0, 1.0));
    u_xlat10_4.xyz = textureLod(_SourceTexLowMip, u_xlat1.zw, 0.0).xyz;
    u_xlat10_5.xyz = textureLod(_SourceTexLowMip, u_xlat1.xy, 0.0).xyz;
    u_xlat4.xyz = u_xlat2.xxx * u_xlat10_4.xyz;
    u_xlat4.xyz = u_xlat16.xxx * u_xlat10_5.xyz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat2.yyy * u_xlat4.xyz;
    u_xlat10_5.xyz = textureLod(_SourceTexLowMip, u_xlat0.zw, 0.0).xyz;
    u_xlat10_0.xyz = textureLod(_SourceTexLowMip, u_xlat0.xy, 0.0).xyz;
    u_xlat5.xyz = u_xlat2.xxx * u_xlat10_5.xyz;
    u_xlat0.xyz = u_xlat16.xxx * u_xlat10_0.xyz + u_xlat5.xyz;
    u_xlat0.xyz = u_xlat16.yyy * u_xlat0.xyz + u_xlat4.xyz;
    u_xlat10_2.xyz = texture(_SourceTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_6.xyz = u_xlat10_2.xyz * u_xlat10_2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz + (-u_xlat16_6.xyz);
    u_xlat0.xyz = _Params.xxx * u_xlat0.xyz + u_xlat16_6.xyz;
    SV_Target0.xyz = sqrt(u_xlat0.xyz);
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Local Keywords { "_USE_RGBM" }
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
uniform 	vec4 _Params;
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
UNITY_LOCATION(1) uniform mediump sampler2D _SourceTexLowMip;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_5;
void main()
{
    u_xlat10_0 = texture(_SourceTexLowMip, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat10_0.xyz;
    u_xlat16_1.xyz = u_xlat10_0.www * u_xlat16_1.xyz;
    u_xlat10_0 = texture(_SourceTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat10_0.xyz * u_xlat10_0.xyz;
    u_xlat16_2.xyz = u_xlat10_0.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * vec3(8.0, 8.0, 8.0);
    u_xlat3.xyz = u_xlat16_1.xyz * vec3(8.0, 8.0, 8.0) + (-u_xlat0.xyz);
    u_xlat0.xyz = _Params.xxx * u_xlat3.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat16_1.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat16_5.x = max(u_xlat0.z, 9.99999975e-06);
    u_xlat16_1.x = max(u_xlat16_5.x, u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * 255.0;
    u_xlat16_1.x = ceil(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * 0.00392156886;
    u_xlat16_5.xyz = u_xlat0.xyz / u_xlat16_1.xxx;
    SV_Target0.w = u_xlat16_1.x;
    SV_Target0.xyz = sqrt(u_xlat16_5.xyz);
    return;
}

#endif
"
}
SubProgram "gles3 " {
Local Keywords { "_BLOOM_HQ" "_USE_RGBM" }
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
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec4 _SourceTexLowMip_TexelSize;
uniform 	vec4 _Params;
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
UNITY_LOCATION(1) uniform mediump sampler2D _SourceTexLowMip;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat10_0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
mediump vec4 u_xlat10_1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat10_3;
vec2 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_12;
vec2 u_xlat14;
vec2 u_xlat16;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _SourceTexLowMip_TexelSize.zw + vec2(0.5, 0.5);
    u_xlat14.xy = fract(u_xlat0.xy);
    u_xlat0.xy = floor(u_xlat0.xy);
    u_xlat16_1.xy = u_xlat14.xy * vec2(0.5, 0.5) + vec2(-1.0, -1.0);
    u_xlat16_1.xy = u_xlat14.xy * u_xlat16_1.xy;
    u_xlat16_1.xy = u_xlat16_1.xy * u_xlat14.xy + vec2(0.666666687, 0.666666687);
    u_xlat2.xy = (-u_xlat16_1.xy) + vec2(1.0, 1.0);
    u_xlat16_3 = (-u_xlat14.xyxy) * vec4(0.5, 0.5, 0.166666672, 0.166666672) + vec4(0.5, 0.5, 0.5, 0.5);
    u_xlat16_3 = u_xlat14.xyxy * u_xlat16_3 + vec4(0.5, 0.5, -0.5, -0.5);
    u_xlat16_3 = u_xlat14.xyxy * u_xlat16_3 + vec4(0.166666672, 0.166666672, 0.166666672, 0.166666672);
    u_xlat14.xy = u_xlat2.xy + (-u_xlat16_3.xy);
    u_xlat14.xy = (-u_xlat16_3.zw) + u_xlat14.xy;
    u_xlat2.xy = u_xlat14.xy + u_xlat16_3.xy;
    u_xlat16.xy = u_xlat16_1.xy + u_xlat16_3.zw;
    u_xlat4.xy = vec2(1.0) / vec2(u_xlat2.xy);
    u_xlat3.xy = u_xlat14.xy * u_xlat4.xy + vec2(1.0, 1.0);
    u_xlat14.xy = vec2(1.0) / vec2(u_xlat16.xy);
    u_xlat3.zw = u_xlat16_1.xy * u_xlat14.xy + vec2(-1.0, -1.0);
    u_xlat1 = u_xlat0.xyxy + u_xlat3.zyxy;
    u_xlat0 = u_xlat0.xyxy + u_xlat3.zwxw;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat0 = u_xlat0 * _SourceTexLowMip_TexelSize.xyxy;
    u_xlat0 = min(u_xlat0, vec4(1.0, 1.0, 1.0, 1.0));
    u_xlat1 = u_xlat1 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1 = u_xlat1 * _SourceTexLowMip_TexelSize.xyxy;
    u_xlat1 = min(u_xlat1, vec4(1.0, 1.0, 1.0, 1.0));
    u_xlat10_3 = textureLod(_SourceTexLowMip, u_xlat1.zw, 0.0);
    u_xlat10_1 = textureLod(_SourceTexLowMip, u_xlat1.xy, 0.0);
    u_xlat3 = u_xlat2.xxxx * u_xlat10_3;
    u_xlat1 = u_xlat16.xxxx * u_xlat10_1 + u_xlat3;
    u_xlat1 = u_xlat1 * u_xlat2.yyyy;
    u_xlat10_3 = textureLod(_SourceTexLowMip, u_xlat0.zw, 0.0);
    u_xlat10_0 = textureLod(_SourceTexLowMip, u_xlat0.xy, 0.0);
    u_xlat3 = u_xlat2.xxxx * u_xlat10_3;
    u_xlat0 = u_xlat16.xxxx * u_xlat10_0 + u_xlat3;
    u_xlat0 = u_xlat16.yyyy * u_xlat0 + u_xlat1;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_5.xyz = u_xlat0.www * u_xlat16_5.xyz;
    u_xlat10_0 = texture(_SourceTex, vs_TEXCOORD0.xy);
    u_xlat16_6.xyz = u_xlat10_0.xyz * u_xlat10_0.xyz;
    u_xlat16_6.xyz = u_xlat10_0.www * u_xlat16_6.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * vec3(8.0, 8.0, 8.0);
    u_xlat2.xyz = u_xlat16_5.xyz * vec3(8.0, 8.0, 8.0) + (-u_xlat0.xyz);
    u_xlat0.xyz = _Params.xxx * u_xlat2.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat16_5.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat16_12.x = max(u_xlat0.z, 9.99999975e-06);
    u_xlat16_5.x = max(u_xlat16_12.x, u_xlat16_5.x);
    u_xlat16_5.x = u_xlat16_5.x * 255.0;
    u_xlat16_5.x = ceil(u_xlat16_5.x);
    u_xlat16_5.x = u_xlat16_5.x * 0.00392156886;
    u_xlat16_12.xyz = u_xlat0.xyz / u_xlat16_5.xxx;
    SV_Target0.w = u_xlat16_5.x;
    SV_Target0.xyz = sqrt(u_xlat16_12.xyz);
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
uniform 	vec4 _Params;
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
UNITY_LOCATION(1) uniform mediump sampler2D _SourceTexLowMip;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat10_0;
mediump vec3 u_xlat10_1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat10_0.xyz = texture(_SourceTexLowMip, vs_TEXCOORD0.xy).xyz;
    u_xlat10_1.xyz = texture(_SourceTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * u_xlat10_1.xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat10_0.xyz + (-u_xlat16_2.xyz);
    u_xlat0.xyz = _Params.xxx * u_xlat0.xyz + u_xlat16_2.xyz;
    SV_Target0.xyz = sqrt(u_xlat0.xyz);
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_USE_DRAW_PROCEDURAL" }
Local Keywords { "_BLOOM_HQ" }
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
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec4 _SourceTexLowMip_TexelSize;
uniform 	vec4 _Params;
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
UNITY_LOCATION(1) uniform mediump sampler2D _SourceTexLowMip;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat10_0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
vec2 u_xlat2;
mediump vec3 u_xlat10_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat10_4;
vec3 u_xlat5;
mediump vec3 u_xlat10_5;
mediump vec3 u_xlat16_6;
vec2 u_xlat14;
vec2 u_xlat16;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _SourceTexLowMip_TexelSize.zw + vec2(0.5, 0.5);
    u_xlat14.xy = fract(u_xlat0.xy);
    u_xlat0.xy = floor(u_xlat0.xy);
    u_xlat16_1.xy = u_xlat14.xy * vec2(0.5, 0.5) + vec2(-1.0, -1.0);
    u_xlat16_1.xy = u_xlat14.xy * u_xlat16_1.xy;
    u_xlat16_1.xy = u_xlat16_1.xy * u_xlat14.xy + vec2(0.666666687, 0.666666687);
    u_xlat2.xy = (-u_xlat16_1.xy) + vec2(1.0, 1.0);
    u_xlat16_3 = (-u_xlat14.xyxy) * vec4(0.5, 0.5, 0.166666672, 0.166666672) + vec4(0.5, 0.5, 0.5, 0.5);
    u_xlat16_3 = u_xlat14.xyxy * u_xlat16_3 + vec4(0.5, 0.5, -0.5, -0.5);
    u_xlat16_3 = u_xlat14.xyxy * u_xlat16_3 + vec4(0.166666672, 0.166666672, 0.166666672, 0.166666672);
    u_xlat14.xy = u_xlat2.xy + (-u_xlat16_3.xy);
    u_xlat14.xy = (-u_xlat16_3.zw) + u_xlat14.xy;
    u_xlat2.xy = u_xlat14.xy + u_xlat16_3.xy;
    u_xlat16.xy = u_xlat16_1.xy + u_xlat16_3.zw;
    u_xlat4.xy = vec2(1.0) / vec2(u_xlat2.xy);
    u_xlat3.xy = u_xlat14.xy * u_xlat4.xy + vec2(1.0, 1.0);
    u_xlat14.xy = vec2(1.0) / vec2(u_xlat16.xy);
    u_xlat3.zw = u_xlat16_1.xy * u_xlat14.xy + vec2(-1.0, -1.0);
    u_xlat1 = u_xlat0.xyxy + u_xlat3.zyxy;
    u_xlat0 = u_xlat0.xyxy + u_xlat3.zwxw;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat0 = u_xlat0 * _SourceTexLowMip_TexelSize.xyxy;
    u_xlat0 = min(u_xlat0, vec4(1.0, 1.0, 1.0, 1.0));
    u_xlat1 = u_xlat1 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1 = u_xlat1 * _SourceTexLowMip_TexelSize.xyxy;
    u_xlat1 = min(u_xlat1, vec4(1.0, 1.0, 1.0, 1.0));
    u_xlat10_4.xyz = textureLod(_SourceTexLowMip, u_xlat1.zw, 0.0).xyz;
    u_xlat10_5.xyz = textureLod(_SourceTexLowMip, u_xlat1.xy, 0.0).xyz;
    u_xlat4.xyz = u_xlat2.xxx * u_xlat10_4.xyz;
    u_xlat4.xyz = u_xlat16.xxx * u_xlat10_5.xyz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat2.yyy * u_xlat4.xyz;
    u_xlat10_5.xyz = textureLod(_SourceTexLowMip, u_xlat0.zw, 0.0).xyz;
    u_xlat10_0.xyz = textureLod(_SourceTexLowMip, u_xlat0.xy, 0.0).xyz;
    u_xlat5.xyz = u_xlat2.xxx * u_xlat10_5.xyz;
    u_xlat0.xyz = u_xlat16.xxx * u_xlat10_0.xyz + u_xlat5.xyz;
    u_xlat0.xyz = u_xlat16.yyy * u_xlat0.xyz + u_xlat4.xyz;
    u_xlat10_2.xyz = texture(_SourceTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_6.xyz = u_xlat10_2.xyz * u_xlat10_2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz + (-u_xlat16_6.xyz);
    u_xlat0.xyz = _Params.xxx * u_xlat0.xyz + u_xlat16_6.xyz;
    SV_Target0.xyz = sqrt(u_xlat0.xyz);
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_USE_DRAW_PROCEDURAL" }
Local Keywords { "_USE_RGBM" }
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
uniform 	vec4 _Params;
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
UNITY_LOCATION(1) uniform mediump sampler2D _SourceTexLowMip;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_5;
void main()
{
    u_xlat10_0 = texture(_SourceTexLowMip, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat10_0.xyz;
    u_xlat16_1.xyz = u_xlat10_0.www * u_xlat16_1.xyz;
    u_xlat10_0 = texture(_SourceTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat10_0.xyz * u_xlat10_0.xyz;
    u_xlat16_2.xyz = u_xlat10_0.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * vec3(8.0, 8.0, 8.0);
    u_xlat3.xyz = u_xlat16_1.xyz * vec3(8.0, 8.0, 8.0) + (-u_xlat0.xyz);
    u_xlat0.xyz = _Params.xxx * u_xlat3.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat16_1.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat16_5.x = max(u_xlat0.z, 9.99999975e-06);
    u_xlat16_1.x = max(u_xlat16_5.x, u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * 255.0;
    u_xlat16_1.x = ceil(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * 0.00392156886;
    u_xlat16_5.xyz = u_xlat0.xyz / u_xlat16_1.xxx;
    SV_Target0.w = u_xlat16_1.x;
    SV_Target0.xyz = sqrt(u_xlat16_5.xyz);
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_USE_DRAW_PROCEDURAL" }
Local Keywords { "_BLOOM_HQ" "_USE_RGBM" }
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
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec4 _SourceTexLowMip_TexelSize;
uniform 	vec4 _Params;
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
UNITY_LOCATION(1) uniform mediump sampler2D _SourceTexLowMip;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat10_0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
mediump vec4 u_xlat10_1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat10_3;
vec2 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_12;
vec2 u_xlat14;
vec2 u_xlat16;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _SourceTexLowMip_TexelSize.zw + vec2(0.5, 0.5);
    u_xlat14.xy = fract(u_xlat0.xy);
    u_xlat0.xy = floor(u_xlat0.xy);
    u_xlat16_1.xy = u_xlat14.xy * vec2(0.5, 0.5) + vec2(-1.0, -1.0);
    u_xlat16_1.xy = u_xlat14.xy * u_xlat16_1.xy;
    u_xlat16_1.xy = u_xlat16_1.xy * u_xlat14.xy + vec2(0.666666687, 0.666666687);
    u_xlat2.xy = (-u_xlat16_1.xy) + vec2(1.0, 1.0);
    u_xlat16_3 = (-u_xlat14.xyxy) * vec4(0.5, 0.5, 0.166666672, 0.166666672) + vec4(0.5, 0.5, 0.5, 0.5);
    u_xlat16_3 = u_xlat14.xyxy * u_xlat16_3 + vec4(0.5, 0.5, -0.5, -0.5);
    u_xlat16_3 = u_xlat14.xyxy * u_xlat16_3 + vec4(0.166666672, 0.166666672, 0.166666672, 0.166666672);
    u_xlat14.xy = u_xlat2.xy + (-u_xlat16_3.xy);
    u_xlat14.xy = (-u_xlat16_3.zw) + u_xlat14.xy;
    u_xlat2.xy = u_xlat14.xy + u_xlat16_3.xy;
    u_xlat16.xy = u_xlat16_1.xy + u_xlat16_3.zw;
    u_xlat4.xy = vec2(1.0) / vec2(u_xlat2.xy);
    u_xlat3.xy = u_xlat14.xy * u_xlat4.xy + vec2(1.0, 1.0);
    u_xlat14.xy = vec2(1.0) / vec2(u_xlat16.xy);
    u_xlat3.zw = u_xlat16_1.xy * u_xlat14.xy + vec2(-1.0, -1.0);
    u_xlat1 = u_xlat0.xyxy + u_xlat3.zyxy;
    u_xlat0 = u_xlat0.xyxy + u_xlat3.zwxw;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat0 = u_xlat0 * _SourceTexLowMip_TexelSize.xyxy;
    u_xlat0 = min(u_xlat0, vec4(1.0, 1.0, 1.0, 1.0));
    u_xlat1 = u_xlat1 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1 = u_xlat1 * _SourceTexLowMip_TexelSize.xyxy;
    u_xlat1 = min(u_xlat1, vec4(1.0, 1.0, 1.0, 1.0));
    u_xlat10_3 = textureLod(_SourceTexLowMip, u_xlat1.zw, 0.0);
    u_xlat10_1 = textureLod(_SourceTexLowMip, u_xlat1.xy, 0.0);
    u_xlat3 = u_xlat2.xxxx * u_xlat10_3;
    u_xlat1 = u_xlat16.xxxx * u_xlat10_1 + u_xlat3;
    u_xlat1 = u_xlat1 * u_xlat2.yyyy;
    u_xlat10_3 = textureLod(_SourceTexLowMip, u_xlat0.zw, 0.0);
    u_xlat10_0 = textureLod(_SourceTexLowMip, u_xlat0.xy, 0.0);
    u_xlat3 = u_xlat2.xxxx * u_xlat10_3;
    u_xlat0 = u_xlat16.xxxx * u_xlat10_0 + u_xlat3;
    u_xlat0 = u_xlat16.yyyy * u_xlat0 + u_xlat1;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_5.xyz = u_xlat0.www * u_xlat16_5.xyz;
    u_xlat10_0 = texture(_SourceTex, vs_TEXCOORD0.xy);
    u_xlat16_6.xyz = u_xlat10_0.xyz * u_xlat10_0.xyz;
    u_xlat16_6.xyz = u_xlat10_0.www * u_xlat16_6.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * vec3(8.0, 8.0, 8.0);
    u_xlat2.xyz = u_xlat16_5.xyz * vec3(8.0, 8.0, 8.0) + (-u_xlat0.xyz);
    u_xlat0.xyz = _Params.xxx * u_xlat2.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat16_5.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat16_12.x = max(u_xlat0.z, 9.99999975e-06);
    u_xlat16_5.x = max(u_xlat16_12.x, u_xlat16_5.x);
    u_xlat16_5.x = u_xlat16_5.x * 255.0;
    u_xlat16_5.x = ceil(u_xlat16_5.x);
    u_xlat16_5.x = u_xlat16_5.x * 0.00392156886;
    u_xlat16_12.xyz = u_xlat0.xyz / u_xlat16_5.xxx;
    SV_Target0.w = u_xlat16_5.x;
    SV_Target0.xyz = sqrt(u_xlat16_12.xyz);
    return;
}

#endif
"
}
}
}
}
}