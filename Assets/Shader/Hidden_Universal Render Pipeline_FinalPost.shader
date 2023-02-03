//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Universal Render Pipeline/FinalPost" {
Properties {
}
SubShader {
 LOD 100
 Tags { "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" }
 Pass {
  Name "FinalPost"
  LOD 100
  Tags { "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" }
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 38106
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
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
uvec4 u_xlatu0;
vec2 u_xlat2;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _SourceSize.xy;
    u_xlat0.xy = trunc(u_xlat0.xy);
    u_xlat0.xy = max(u_xlat0.xy, vec2(0.0, 0.0));
    u_xlat2.xy = _SourceSize.xy + vec2(-1.0, -1.0);
    u_xlat0.xy = min(u_xlat2.xy, u_xlat0.xy);
    u_xlatu0.xy =  uvec2(ivec2(u_xlat0.xy));
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat0.xyz = texelFetch(_SourceTex, ivec2(u_xlatu0.xy), int(u_xlatu0.w)).xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Local Keywords { "_LINEAR_TO_SRGB_CONVERSION" }
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
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
uvec4 u_xlatu0;
bvec3 u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec2 u_xlat6;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _SourceSize.xy;
    u_xlat0.xy = trunc(u_xlat0.xy);
    u_xlat0.xy = max(u_xlat0.xy, vec2(0.0, 0.0));
    u_xlat6.xy = _SourceSize.xy + vec2(-1.0, -1.0);
    u_xlat0.xy = min(u_xlat6.xy, u_xlat0.xy);
    u_xlatu0.xy =  uvec2(ivec2(u_xlat0.xy));
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat0.xyz = texelFetch(_SourceTex, ivec2(u_xlatu0.xy), int(u_xlatu0.w)).xyz;
    u_xlat16_1.xyz = log2(abs(u_xlat0.xyz));
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_1.xyz = exp2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb0.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat0.xyzx).xyz;
    SV_Target0.x = (u_xlatb0.x) ? u_xlat16_2.x : u_xlat16_1.x;
    SV_Target0.y = (u_xlatb0.y) ? u_xlat16_2.y : u_xlat16_1.y;
    SV_Target0.z = (u_xlatb0.z) ? u_xlat16_2.z : u_xlat16_1.z;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Local Keywords { "_DITHERING" }
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
uniform 	vec4 _Dithering_Params;
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
UNITY_LOCATION(1) uniform mediump sampler2D _BlueNoise_Texture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat10_0;
bool u_xlatb0;
vec2 u_xlat1;
uvec4 u_xlatu1;
vec3 u_xlat2;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Dithering_Params.xy + _Dithering_Params.zw;
    u_xlat10_0 = texture(_BlueNoise_Texture, u_xlat0.xy).w;
    u_xlat0.x = u_xlat10_0 * 2.0 + -1.0;
    u_xlat2.x = -abs(u_xlat0.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x>=0.0);
#else
    u_xlatb0 = u_xlat0.x>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat0.x = u_xlat2.x * u_xlat0.x;
    u_xlat2.xy = vs_TEXCOORD0.xy * _SourceSize.xy;
    u_xlat2.xy = trunc(u_xlat2.xy);
    u_xlat2.xy = max(u_xlat2.xy, vec2(0.0, 0.0));
    u_xlat1.xy = _SourceSize.xy + vec2(-1.0, -1.0);
    u_xlat2.xy = min(u_xlat2.xy, u_xlat1.xy);
    u_xlatu1.xy =  uvec2(ivec2(u_xlat2.xy));
    u_xlatu1.z = uint(uint(0u));
    u_xlatu1.w = uint(uint(0u));
    u_xlat2.xyz = texelFetch(_SourceTex, ivec2(u_xlatu1.xy), int(u_xlatu1.w)).xyz;
    u_xlat0.xyz = u_xlat0.xxx * vec3(0.00392156886, 0.00392156886, 0.00392156886) + u_xlat2.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Local Keywords { "_DITHERING" "_LINEAR_TO_SRGB_CONVERSION" }
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
uniform 	vec4 _Dithering_Params;
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
UNITY_LOCATION(1) uniform mediump sampler2D _BlueNoise_Texture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat10_0;
uvec4 u_xlatu0;
bvec3 u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
float u_xlat3;
vec2 u_xlat6;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _SourceSize.xy;
    u_xlat0.xy = trunc(u_xlat0.xy);
    u_xlat0.xy = max(u_xlat0.xy, vec2(0.0, 0.0));
    u_xlat6.xy = _SourceSize.xy + vec2(-1.0, -1.0);
    u_xlat0.xy = min(u_xlat6.xy, u_xlat0.xy);
    u_xlatu0.xy =  uvec2(ivec2(u_xlat0.xy));
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat0.xyz = texelFetch(_SourceTex, ivec2(u_xlatu0.xy), int(u_xlatu0.w)).xyz;
    u_xlat16_1.xyz = log2(abs(u_xlat0.xyz));
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_1.xyz = exp2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb0.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat0.xyzx).xyz;
    {
        vec3 hlslcc_movcTemp = u_xlat16_1;
        hlslcc_movcTemp.x = (u_xlatb0.x) ? u_xlat16_2.x : u_xlat16_1.x;
        hlslcc_movcTemp.y = (u_xlatb0.y) ? u_xlat16_2.y : u_xlat16_1.y;
        hlslcc_movcTemp.z = (u_xlatb0.z) ? u_xlat16_2.z : u_xlat16_1.z;
        u_xlat16_1 = hlslcc_movcTemp;
    }
    u_xlat0.xy = vs_TEXCOORD0.xy * _Dithering_Params.xy + _Dithering_Params.zw;
    u_xlat10_0 = texture(_BlueNoise_Texture, u_xlat0.xy).w;
    u_xlat0.x = u_xlat10_0 * 2.0 + -1.0;
    u_xlat3 = -abs(u_xlat0.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat0.x>=0.0);
#else
    u_xlatb0.x = u_xlat0.x>=0.0;
#endif
    u_xlat0.x = (u_xlatb0.x) ? 1.0 : -1.0;
    u_xlat3 = sqrt(u_xlat3);
    u_xlat3 = (-u_xlat3) + 1.0;
    u_xlat0.x = u_xlat3 * u_xlat0.x;
    u_xlat0.xyz = u_xlat0.xxx * vec3(0.00392156886, 0.00392156886, 0.00392156886) + u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Local Keywords { "_FILM_GRAIN" }
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
uniform 	vec2 _Grain_Params;
uniform 	vec4 _Grain_TilingParams;
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Grain_Texture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat10_0;
uvec4 u_xlatu0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec2 u_xlat6;
float u_xlat9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Grain_TilingParams.xy + _Grain_TilingParams.zw;
    u_xlat10_0 = texture(_Grain_Texture, u_xlat0.xy).w;
    u_xlat16_1.x = u_xlat10_0 + -0.5;
    u_xlat16_1.x = u_xlat16_1.x + u_xlat16_1.x;
    u_xlat0.xy = vs_TEXCOORD0.xy * _SourceSize.xy;
    u_xlat0.xy = trunc(u_xlat0.xy);
    u_xlat0.xy = max(u_xlat0.xy, vec2(0.0, 0.0));
    u_xlat6.xy = _SourceSize.xy + vec2(-1.0, -1.0);
    u_xlat0.xy = min(u_xlat6.xy, u_xlat0.xy);
    u_xlatu0.xy =  uvec2(ivec2(u_xlat0.xy));
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat0.xyz = texelFetch(_SourceTex, ivec2(u_xlatu0.xy), int(u_xlatu0.w)).xyz;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat16_1.xyz * _Grain_Params.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat9 = _Grain_Params.y * (-u_xlat16_1.x) + 1.0;
    u_xlat0.xyz = u_xlat2.xyz * vec3(u_xlat9) + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Local Keywords { "_FILM_GRAIN" "_LINEAR_TO_SRGB_CONVERSION" }
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
uniform 	vec2 _Grain_Params;
uniform 	vec4 _Grain_TilingParams;
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Grain_Texture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat10_0;
uvec4 u_xlatu0;
bvec3 u_xlatb0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec2 u_xlat8;
float u_xlat12;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Grain_TilingParams.xy + _Grain_TilingParams.zw;
    u_xlat10_0 = texture(_Grain_Texture, u_xlat0.xy).w;
    u_xlat16_1.x = u_xlat10_0 + -0.5;
    u_xlat16_1.x = u_xlat16_1.x + u_xlat16_1.x;
    u_xlat0.xy = vs_TEXCOORD0.xy * _SourceSize.xy;
    u_xlat0.xy = trunc(u_xlat0.xy);
    u_xlat0.xy = max(u_xlat0.xy, vec2(0.0, 0.0));
    u_xlat8.xy = _SourceSize.xy + vec2(-1.0, -1.0);
    u_xlat0.xy = min(u_xlat8.xy, u_xlat0.xy);
    u_xlatu0.xy =  uvec2(ivec2(u_xlat0.xy));
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat0.xyz = texelFetch(_SourceTex, ivec2(u_xlatu0.xy), int(u_xlatu0.w)).xyz;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat16_1.xyz * _Grain_Params.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat12 = _Grain_Params.y * (-u_xlat16_1.x) + 1.0;
    u_xlat0.xyz = u_xlat2.xyz * vec3(u_xlat12) + u_xlat0.xyz;
    u_xlat16_1.xyz = log2(abs(u_xlat0.xyz));
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_1.xyz = exp2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat0.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb0.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat0.xyzx).xyz;
    SV_Target0.x = (u_xlatb0.x) ? u_xlat16_3.x : u_xlat16_1.x;
    SV_Target0.y = (u_xlatb0.y) ? u_xlat16_3.y : u_xlat16_1.y;
    SV_Target0.z = (u_xlatb0.z) ? u_xlat16_3.z : u_xlat16_1.z;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Local Keywords { "_DITHERING" "_FILM_GRAIN" }
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
uniform 	vec2 _Grain_Params;
uniform 	vec4 _Grain_TilingParams;
uniform 	vec4 _Dithering_Params;
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Grain_Texture;
UNITY_LOCATION(2) uniform mediump sampler2D _BlueNoise_Texture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat10_0;
uvec4 u_xlatu0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec2 u_xlat6;
float u_xlat9;
mediump float u_xlat10_9;
bool u_xlatb9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Grain_TilingParams.xy + _Grain_TilingParams.zw;
    u_xlat10_0 = texture(_Grain_Texture, u_xlat0.xy).w;
    u_xlat16_1.x = u_xlat10_0 + -0.5;
    u_xlat16_1.x = u_xlat16_1.x + u_xlat16_1.x;
    u_xlat0.xy = vs_TEXCOORD0.xy * _SourceSize.xy;
    u_xlat0.xy = trunc(u_xlat0.xy);
    u_xlat0.xy = max(u_xlat0.xy, vec2(0.0, 0.0));
    u_xlat6.xy = _SourceSize.xy + vec2(-1.0, -1.0);
    u_xlat0.xy = min(u_xlat6.xy, u_xlat0.xy);
    u_xlatu0.xy =  uvec2(ivec2(u_xlat0.xy));
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat0.xyz = texelFetch(_SourceTex, ivec2(u_xlatu0.xy), int(u_xlatu0.w)).xyz;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat16_1.xyz * _Grain_Params.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat9 = _Grain_Params.y * (-u_xlat16_1.x) + 1.0;
    u_xlat0.xyz = u_xlat2.xyz * vec3(u_xlat9) + u_xlat0.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Dithering_Params.xy + _Dithering_Params.zw;
    u_xlat10_9 = texture(_BlueNoise_Texture, u_xlat2.xy).w;
    u_xlat9 = u_xlat10_9 * 2.0 + -1.0;
    u_xlat2.x = -abs(u_xlat9) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9>=0.0);
#else
    u_xlatb9 = u_xlat9>=0.0;
#endif
    u_xlat9 = (u_xlatb9) ? 1.0 : -1.0;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat9 = u_xlat9 * u_xlat2.x;
    u_xlat0.xyz = vec3(u_xlat9) * vec3(0.00392156886, 0.00392156886, 0.00392156886) + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Local Keywords { "_DITHERING" "_FILM_GRAIN" "_LINEAR_TO_SRGB_CONVERSION" }
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
uniform 	vec2 _Grain_Params;
uniform 	vec4 _Grain_TilingParams;
uniform 	vec4 _Dithering_Params;
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Grain_Texture;
UNITY_LOCATION(2) uniform mediump sampler2D _BlueNoise_Texture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat10_0;
uvec4 u_xlatu0;
bvec3 u_xlatb0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
float u_xlat4;
vec2 u_xlat8;
float u_xlat12;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Grain_TilingParams.xy + _Grain_TilingParams.zw;
    u_xlat10_0 = texture(_Grain_Texture, u_xlat0.xy).w;
    u_xlat16_1.x = u_xlat10_0 + -0.5;
    u_xlat16_1.x = u_xlat16_1.x + u_xlat16_1.x;
    u_xlat0.xy = vs_TEXCOORD0.xy * _SourceSize.xy;
    u_xlat0.xy = trunc(u_xlat0.xy);
    u_xlat0.xy = max(u_xlat0.xy, vec2(0.0, 0.0));
    u_xlat8.xy = _SourceSize.xy + vec2(-1.0, -1.0);
    u_xlat0.xy = min(u_xlat8.xy, u_xlat0.xy);
    u_xlatu0.xy =  uvec2(ivec2(u_xlat0.xy));
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat0.xyz = texelFetch(_SourceTex, ivec2(u_xlatu0.xy), int(u_xlatu0.w)).xyz;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat16_1.xyz * _Grain_Params.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat12 = _Grain_Params.y * (-u_xlat16_1.x) + 1.0;
    u_xlat0.xyz = u_xlat2.xyz * vec3(u_xlat12) + u_xlat0.xyz;
    u_xlat16_1.xyz = log2(abs(u_xlat0.xyz));
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_1.xyz = exp2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat0.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb0.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat0.xyzx).xyz;
    {
        vec3 hlslcc_movcTemp = u_xlat16_1;
        hlslcc_movcTemp.x = (u_xlatb0.x) ? u_xlat16_3.x : u_xlat16_1.x;
        hlslcc_movcTemp.y = (u_xlatb0.y) ? u_xlat16_3.y : u_xlat16_1.y;
        hlslcc_movcTemp.z = (u_xlatb0.z) ? u_xlat16_3.z : u_xlat16_1.z;
        u_xlat16_1 = hlslcc_movcTemp;
    }
    u_xlat0.xy = vs_TEXCOORD0.xy * _Dithering_Params.xy + _Dithering_Params.zw;
    u_xlat10_0 = texture(_BlueNoise_Texture, u_xlat0.xy).w;
    u_xlat0.x = u_xlat10_0 * 2.0 + -1.0;
    u_xlat4 = -abs(u_xlat0.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat0.x>=0.0);
#else
    u_xlatb0.x = u_xlat0.x>=0.0;
#endif
    u_xlat0.x = (u_xlatb0.x) ? 1.0 : -1.0;
    u_xlat4 = sqrt(u_xlat4);
    u_xlat4 = (-u_xlat4) + 1.0;
    u_xlat0.x = u_xlat4 * u_xlat0.x;
    u_xlat0.xyz = u_xlat0.xxx * vec3(0.00392156886, 0.00392156886, 0.00392156886) + u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Local Keywords { "_FXAA" }
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
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
uvec4 u_xlatu0;
vec3 u_xlat1;
uvec4 u_xlatu1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat10_2;
ivec4 u_xlati2;
uvec4 u_xlatu2;
vec4 u_xlat3;
mediump vec3 u_xlat10_3;
ivec4 u_xlati3;
uvec4 u_xlatu3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
bool u_xlatb10;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump float u_xlat16_23;
mediump float u_xlat16_32;
mediump float u_xlat16_34;
void main()
{
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat1.xy = vs_TEXCOORD0.xy * _SourceSize.xy;
    u_xlati2 = ivec4(u_xlat1.xyxy);
    u_xlat1.xy = trunc(u_xlat1.xy);
    u_xlat1.xy = max(u_xlat1.xy, vec2(0.0, 0.0));
    u_xlati3 = u_xlati2.zwzw + ivec4(int(0xFFFFFFFFu), int(0xFFFFFFFFu), 1, int(0xFFFFFFFFu));
    u_xlati2 = u_xlati2 + ivec4(int(0xFFFFFFFFu), 1, 1, 1);
    u_xlat2 = vec4(u_xlati2);
    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat3 = vec4(u_xlati3);
    u_xlat3 = max(u_xlat3, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat4 = _SourceSize.xyxy + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat3 = min(u_xlat3, u_xlat4);
    u_xlatu3 =  uvec4(ivec4(u_xlat3.zwxy));
    u_xlatu0.xy = u_xlatu3.zw;
    u_xlat0.xyz = texelFetch(_SourceTex, ivec2(u_xlatu0.xy), int(u_xlatu0.w)).xyz;
    u_xlat16_5.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.x = dot(u_xlat16_5.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat0 = min(u_xlat2, u_xlat4);
    u_xlat1.xy = min(u_xlat1.xy, u_xlat4.xy);
    u_xlatu1.xy =  uvec2(ivec2(u_xlat1.xy));
    u_xlatu0 =  uvec4(ivec4(u_xlat0.zwxy));
    u_xlatu2.xy = u_xlatu0.zw;
    u_xlatu2.z = uint(uint(0u));
    u_xlatu2.w = uint(uint(0u));
    u_xlat2.xyz = texelFetch(_SourceTex, ivec2(u_xlatu2.xy), int(u_xlatu2.w)).xyz;
    u_xlat16_14.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_14.x = dot(u_xlat16_14.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_23 = u_xlat16_14.x + u_xlat16_5.x;
    u_xlatu3.z = uint(uint(0u));
    u_xlatu3.w = uint(uint(0u));
    u_xlat2.xyz = texelFetch(_SourceTex, ivec2(u_xlatu3.xy), int(u_xlatu3.w)).xyz;
    u_xlat16_6.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_32 = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat0.xyz = texelFetch(_SourceTex, ivec2(u_xlatu0.xy), int(u_xlatu0.w)).xyz;
    u_xlat16_6.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.x = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_15.x = u_xlat16_32 + u_xlat16_6.x;
    u_xlat16_0.yw = vec2(u_xlat16_23) + (-u_xlat16_15.xx);
    u_xlat16_23 = u_xlat16_32 + u_xlat16_5.x;
    u_xlat16_15.x = u_xlat16_14.x + u_xlat16_6.x;
    u_xlat16_15.x = u_xlat16_23 + (-u_xlat16_15.x);
    u_xlat16_23 = u_xlat16_14.x + u_xlat16_23;
    u_xlat16_23 = u_xlat16_6.x + u_xlat16_23;
    u_xlat16_23 = u_xlat16_23 * 0.03125;
    u_xlat16_23 = max(u_xlat16_23, 0.0078125);
    u_xlat2.x = min(abs(u_xlat16_0.w), abs(u_xlat16_15.x));
    u_xlat16_0.xz = (-u_xlat16_15.xx);
    u_xlat2.x = u_xlat16_23 + u_xlat2.x;
    u_xlat2.x = float(1.0) / float(u_xlat2.x);
    u_xlat0 = u_xlat16_0 * u_xlat2.xxxx;
    u_xlat0 = max(u_xlat0, vec4(-8.0, -8.0, -8.0, -8.0));
    u_xlat0 = min(u_xlat0, vec4(8.0, 8.0, 8.0, 8.0));
    u_xlat0 = u_xlat0 * _SourceSize.zwzw;
    u_xlat2 = u_xlat0.zwzw * vec4(-0.5, -0.5, -0.166666672, -0.166666672) + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0 * vec4(0.166666672, 0.166666672, 0.5, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_3.xyz = texture(_SourceTex, u_xlat2.xy).xyz;
    u_xlat10_2.xyz = texture(_SourceTex, u_xlat2.zw).xyz;
    u_xlat16_15.xyz = u_xlat10_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.xyz = min(max(u_xlat16_15.xyz, 0.0), 1.0);
#else
    u_xlat16_15.xyz = clamp(u_xlat16_15.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat10_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat10_2.xyz = texture(_SourceTex, u_xlat0.zw).xyz;
    u_xlat10_3.xyz = texture(_SourceTex, u_xlat0.xy).xyz;
    u_xlat16_8.xyz = u_xlat10_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_15.xyz = u_xlat16_15.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat10_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_7.xyz + u_xlat16_8.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_7.xyz = u_xlat16_15.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_7.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_23 = dot(u_xlat16_7.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_34 = min(u_xlat16_14.x, u_xlat16_32);
    u_xlat16_14.x = max(u_xlat16_14.x, u_xlat16_32);
    u_xlat16_14.x = max(u_xlat16_6.x, u_xlat16_14.x);
    u_xlat16_32 = min(u_xlat16_6.x, u_xlat16_34);
    u_xlatu1.z = uint(uint(0u));
    u_xlatu1.w = uint(uint(0u));
    u_xlat1.xyz = texelFetch(_SourceTex, ivec2(u_xlatu1.xy), int(u_xlatu1.w)).xyz;
    u_xlat16_8.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.x = dot(u_xlat16_8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_34 = min(u_xlat16_5.x, u_xlat16_6.x);
    u_xlat16_5.x = max(u_xlat16_5.x, u_xlat16_6.x);
    u_xlat16_5.x = max(u_xlat16_14.x, u_xlat16_5.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_5.x<u_xlat16_23);
#else
    u_xlatb1 = u_xlat16_5.x<u_xlat16_23;
#endif
    u_xlat16_5.x = min(u_xlat16_32, u_xlat16_34);
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat16_23<u_xlat16_5.x);
#else
    u_xlatb10 = u_xlat16_23<u_xlat16_5.x;
#endif
    u_xlatb1 = u_xlatb1 || u_xlatb10;
    SV_Target0.xyz = (bool(u_xlatb1)) ? u_xlat16_15.xyz : u_xlat16_7.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Local Keywords { "_FXAA" "_LINEAR_TO_SRGB_CONVERSION" }
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
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
uvec4 u_xlatu0;
vec3 u_xlat1;
uvec4 u_xlatu1;
bvec3 u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat10_2;
ivec4 u_xlati2;
uvec4 u_xlatu2;
vec4 u_xlat3;
mediump vec3 u_xlat10_3;
ivec4 u_xlati3;
uvec4 u_xlatu3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
bool u_xlatb10;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump float u_xlat16_23;
mediump float u_xlat16_32;
mediump float u_xlat16_34;
void main()
{
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat1.xy = vs_TEXCOORD0.xy * _SourceSize.xy;
    u_xlati2 = ivec4(u_xlat1.xyxy);
    u_xlat1.xy = trunc(u_xlat1.xy);
    u_xlat1.xy = max(u_xlat1.xy, vec2(0.0, 0.0));
    u_xlati3 = u_xlati2.zwzw + ivec4(int(0xFFFFFFFFu), int(0xFFFFFFFFu), 1, int(0xFFFFFFFFu));
    u_xlati2 = u_xlati2 + ivec4(int(0xFFFFFFFFu), 1, 1, 1);
    u_xlat2 = vec4(u_xlati2);
    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat3 = vec4(u_xlati3);
    u_xlat3 = max(u_xlat3, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat4 = _SourceSize.xyxy + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat3 = min(u_xlat3, u_xlat4);
    u_xlatu3 =  uvec4(ivec4(u_xlat3.zwxy));
    u_xlatu0.xy = u_xlatu3.zw;
    u_xlat0.xyz = texelFetch(_SourceTex, ivec2(u_xlatu0.xy), int(u_xlatu0.w)).xyz;
    u_xlat16_5.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.x = dot(u_xlat16_5.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat0 = min(u_xlat2, u_xlat4);
    u_xlat1.xy = min(u_xlat1.xy, u_xlat4.xy);
    u_xlatu1.xy =  uvec2(ivec2(u_xlat1.xy));
    u_xlatu0 =  uvec4(ivec4(u_xlat0.zwxy));
    u_xlatu2.xy = u_xlatu0.zw;
    u_xlatu2.z = uint(uint(0u));
    u_xlatu2.w = uint(uint(0u));
    u_xlat2.xyz = texelFetch(_SourceTex, ivec2(u_xlatu2.xy), int(u_xlatu2.w)).xyz;
    u_xlat16_14.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_14.x = dot(u_xlat16_14.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_23 = u_xlat16_14.x + u_xlat16_5.x;
    u_xlatu3.z = uint(uint(0u));
    u_xlatu3.w = uint(uint(0u));
    u_xlat2.xyz = texelFetch(_SourceTex, ivec2(u_xlatu3.xy), int(u_xlatu3.w)).xyz;
    u_xlat16_6.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_32 = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat0.xyz = texelFetch(_SourceTex, ivec2(u_xlatu0.xy), int(u_xlatu0.w)).xyz;
    u_xlat16_6.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.x = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_15.x = u_xlat16_32 + u_xlat16_6.x;
    u_xlat16_0.yw = vec2(u_xlat16_23) + (-u_xlat16_15.xx);
    u_xlat16_23 = u_xlat16_32 + u_xlat16_5.x;
    u_xlat16_15.x = u_xlat16_14.x + u_xlat16_6.x;
    u_xlat16_15.x = u_xlat16_23 + (-u_xlat16_15.x);
    u_xlat16_23 = u_xlat16_14.x + u_xlat16_23;
    u_xlat16_23 = u_xlat16_6.x + u_xlat16_23;
    u_xlat16_23 = u_xlat16_23 * 0.03125;
    u_xlat16_23 = max(u_xlat16_23, 0.0078125);
    u_xlat2.x = min(abs(u_xlat16_0.w), abs(u_xlat16_15.x));
    u_xlat16_0.xz = (-u_xlat16_15.xx);
    u_xlat2.x = u_xlat16_23 + u_xlat2.x;
    u_xlat2.x = float(1.0) / float(u_xlat2.x);
    u_xlat0 = u_xlat16_0 * u_xlat2.xxxx;
    u_xlat0 = max(u_xlat0, vec4(-8.0, -8.0, -8.0, -8.0));
    u_xlat0 = min(u_xlat0, vec4(8.0, 8.0, 8.0, 8.0));
    u_xlat0 = u_xlat0 * _SourceSize.zwzw;
    u_xlat2 = u_xlat0.zwzw * vec4(-0.5, -0.5, -0.166666672, -0.166666672) + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0 * vec4(0.166666672, 0.166666672, 0.5, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_3.xyz = texture(_SourceTex, u_xlat2.xy).xyz;
    u_xlat10_2.xyz = texture(_SourceTex, u_xlat2.zw).xyz;
    u_xlat16_15.xyz = u_xlat10_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.xyz = min(max(u_xlat16_15.xyz, 0.0), 1.0);
#else
    u_xlat16_15.xyz = clamp(u_xlat16_15.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat10_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat10_2.xyz = texture(_SourceTex, u_xlat0.zw).xyz;
    u_xlat10_3.xyz = texture(_SourceTex, u_xlat0.xy).xyz;
    u_xlat16_8.xyz = u_xlat10_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_15.xyz = u_xlat16_15.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat10_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_7.xyz + u_xlat16_8.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_7.xyz = u_xlat16_15.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_7.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_23 = dot(u_xlat16_7.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_34 = min(u_xlat16_14.x, u_xlat16_32);
    u_xlat16_14.x = max(u_xlat16_14.x, u_xlat16_32);
    u_xlat16_14.x = max(u_xlat16_6.x, u_xlat16_14.x);
    u_xlat16_32 = min(u_xlat16_6.x, u_xlat16_34);
    u_xlatu1.z = uint(uint(0u));
    u_xlatu1.w = uint(uint(0u));
    u_xlat1.xyz = texelFetch(_SourceTex, ivec2(u_xlatu1.xy), int(u_xlatu1.w)).xyz;
    u_xlat16_8.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.x = dot(u_xlat16_8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_34 = min(u_xlat16_5.x, u_xlat16_6.x);
    u_xlat16_5.x = max(u_xlat16_5.x, u_xlat16_6.x);
    u_xlat16_5.x = max(u_xlat16_14.x, u_xlat16_5.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(u_xlat16_5.x<u_xlat16_23);
#else
    u_xlatb1.x = u_xlat16_5.x<u_xlat16_23;
#endif
    u_xlat16_5.x = min(u_xlat16_32, u_xlat16_34);
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat16_23<u_xlat16_5.x);
#else
    u_xlatb10 = u_xlat16_23<u_xlat16_5.x;
#endif
    u_xlatb1.x = u_xlatb1.x || u_xlatb10;
    u_xlat16_5.xyz = (u_xlatb1.x) ? u_xlat16_15.xyz : u_xlat16_7.xyz;
    u_xlat16_6.xyz = log2(u_xlat16_5.xyz);
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_6.xyz = exp2(u_xlat16_6.xyz);
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_7.xyz = u_xlat16_5.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb1.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_5.xyzx).xyz;
    SV_Target0.x = (u_xlatb1.x) ? u_xlat16_7.x : u_xlat16_6.x;
    SV_Target0.y = (u_xlatb1.y) ? u_xlat16_7.y : u_xlat16_6.y;
    SV_Target0.z = (u_xlatb1.z) ? u_xlat16_7.z : u_xlat16_6.z;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Local Keywords { "_DITHERING" "_FXAA" }
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
uniform 	vec4 _Dithering_Params;
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
UNITY_LOCATION(1) uniform mediump sampler2D _BlueNoise_Texture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
uvec4 u_xlatu0;
vec3 u_xlat1;
mediump float u_xlat10_1;
uvec4 u_xlatu1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat10_2;
ivec4 u_xlati2;
uvec4 u_xlatu2;
vec4 u_xlat3;
mediump vec3 u_xlat10_3;
ivec4 u_xlati3;
uvec4 u_xlatu3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
float u_xlat10;
bool u_xlatb10;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump float u_xlat16_23;
mediump float u_xlat16_32;
mediump float u_xlat16_34;
void main()
{
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat1.xy = vs_TEXCOORD0.xy * _SourceSize.xy;
    u_xlati2 = ivec4(u_xlat1.xyxy);
    u_xlat1.xy = trunc(u_xlat1.xy);
    u_xlat1.xy = max(u_xlat1.xy, vec2(0.0, 0.0));
    u_xlati3 = u_xlati2.zwzw + ivec4(int(0xFFFFFFFFu), int(0xFFFFFFFFu), 1, int(0xFFFFFFFFu));
    u_xlati2 = u_xlati2 + ivec4(int(0xFFFFFFFFu), 1, 1, 1);
    u_xlat2 = vec4(u_xlati2);
    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat3 = vec4(u_xlati3);
    u_xlat3 = max(u_xlat3, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat4 = _SourceSize.xyxy + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat3 = min(u_xlat3, u_xlat4);
    u_xlatu3 =  uvec4(ivec4(u_xlat3.zwxy));
    u_xlatu0.xy = u_xlatu3.zw;
    u_xlat0.xyz = texelFetch(_SourceTex, ivec2(u_xlatu0.xy), int(u_xlatu0.w)).xyz;
    u_xlat16_5.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.x = dot(u_xlat16_5.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat0 = min(u_xlat2, u_xlat4);
    u_xlat1.xy = min(u_xlat1.xy, u_xlat4.xy);
    u_xlatu1.xy =  uvec2(ivec2(u_xlat1.xy));
    u_xlatu0 =  uvec4(ivec4(u_xlat0.zwxy));
    u_xlatu2.xy = u_xlatu0.zw;
    u_xlatu2.z = uint(uint(0u));
    u_xlatu2.w = uint(uint(0u));
    u_xlat2.xyz = texelFetch(_SourceTex, ivec2(u_xlatu2.xy), int(u_xlatu2.w)).xyz;
    u_xlat16_14.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_14.x = dot(u_xlat16_14.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_23 = u_xlat16_14.x + u_xlat16_5.x;
    u_xlatu3.z = uint(uint(0u));
    u_xlatu3.w = uint(uint(0u));
    u_xlat2.xyz = texelFetch(_SourceTex, ivec2(u_xlatu3.xy), int(u_xlatu3.w)).xyz;
    u_xlat16_6.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_32 = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat0.xyz = texelFetch(_SourceTex, ivec2(u_xlatu0.xy), int(u_xlatu0.w)).xyz;
    u_xlat16_6.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.x = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_15.x = u_xlat16_32 + u_xlat16_6.x;
    u_xlat16_0.yw = vec2(u_xlat16_23) + (-u_xlat16_15.xx);
    u_xlat16_23 = u_xlat16_32 + u_xlat16_5.x;
    u_xlat16_15.x = u_xlat16_14.x + u_xlat16_6.x;
    u_xlat16_15.x = u_xlat16_23 + (-u_xlat16_15.x);
    u_xlat16_23 = u_xlat16_14.x + u_xlat16_23;
    u_xlat16_23 = u_xlat16_6.x + u_xlat16_23;
    u_xlat16_23 = u_xlat16_23 * 0.03125;
    u_xlat16_23 = max(u_xlat16_23, 0.0078125);
    u_xlat2.x = min(abs(u_xlat16_0.w), abs(u_xlat16_15.x));
    u_xlat16_0.xz = (-u_xlat16_15.xx);
    u_xlat2.x = u_xlat16_23 + u_xlat2.x;
    u_xlat2.x = float(1.0) / float(u_xlat2.x);
    u_xlat0 = u_xlat16_0 * u_xlat2.xxxx;
    u_xlat0 = max(u_xlat0, vec4(-8.0, -8.0, -8.0, -8.0));
    u_xlat0 = min(u_xlat0, vec4(8.0, 8.0, 8.0, 8.0));
    u_xlat0 = u_xlat0 * _SourceSize.zwzw;
    u_xlat2 = u_xlat0.zwzw * vec4(-0.5, -0.5, -0.166666672, -0.166666672) + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0 * vec4(0.166666672, 0.166666672, 0.5, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_3.xyz = texture(_SourceTex, u_xlat2.xy).xyz;
    u_xlat10_2.xyz = texture(_SourceTex, u_xlat2.zw).xyz;
    u_xlat16_15.xyz = u_xlat10_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.xyz = min(max(u_xlat16_15.xyz, 0.0), 1.0);
#else
    u_xlat16_15.xyz = clamp(u_xlat16_15.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat10_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat10_2.xyz = texture(_SourceTex, u_xlat0.zw).xyz;
    u_xlat10_3.xyz = texture(_SourceTex, u_xlat0.xy).xyz;
    u_xlat16_8.xyz = u_xlat10_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_15.xyz = u_xlat16_15.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat10_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_7.xyz + u_xlat16_8.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_7.xyz = u_xlat16_15.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_7.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_23 = dot(u_xlat16_7.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_34 = min(u_xlat16_14.x, u_xlat16_32);
    u_xlat16_14.x = max(u_xlat16_14.x, u_xlat16_32);
    u_xlat16_14.x = max(u_xlat16_6.x, u_xlat16_14.x);
    u_xlat16_32 = min(u_xlat16_6.x, u_xlat16_34);
    u_xlatu1.z = uint(uint(0u));
    u_xlatu1.w = uint(uint(0u));
    u_xlat1.xyz = texelFetch(_SourceTex, ivec2(u_xlatu1.xy), int(u_xlatu1.w)).xyz;
    u_xlat16_8.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.x = dot(u_xlat16_8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_34 = min(u_xlat16_5.x, u_xlat16_6.x);
    u_xlat16_5.x = max(u_xlat16_5.x, u_xlat16_6.x);
    u_xlat16_5.x = max(u_xlat16_14.x, u_xlat16_5.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_5.x<u_xlat16_23);
#else
    u_xlatb1 = u_xlat16_5.x<u_xlat16_23;
#endif
    u_xlat16_5.x = min(u_xlat16_32, u_xlat16_34);
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat16_23<u_xlat16_5.x);
#else
    u_xlatb10 = u_xlat16_23<u_xlat16_5.x;
#endif
    u_xlatb1 = u_xlatb1 || u_xlatb10;
    u_xlat16_5.xyz = (bool(u_xlatb1)) ? u_xlat16_15.xyz : u_xlat16_7.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Dithering_Params.xy + _Dithering_Params.zw;
    u_xlat10_1 = texture(_BlueNoise_Texture, u_xlat1.xy).w;
    u_xlat1.x = u_xlat10_1 * 2.0 + -1.0;
    u_xlat10 = -abs(u_xlat1.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x>=0.0);
#else
    u_xlatb1 = u_xlat1.x>=0.0;
#endif
    u_xlat1.x = (u_xlatb1) ? 1.0 : -1.0;
    u_xlat10 = sqrt(u_xlat10);
    u_xlat10 = (-u_xlat10) + 1.0;
    u_xlat1.x = u_xlat10 * u_xlat1.x;
    u_xlat1.xyz = u_xlat1.xxx * vec3(0.00392156886, 0.00392156886, 0.00392156886) + u_xlat16_5.xyz;
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Local Keywords { "_DITHERING" "_FXAA" "_LINEAR_TO_SRGB_CONVERSION" }
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
uniform 	vec4 _Dithering_Params;
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
UNITY_LOCATION(1) uniform mediump sampler2D _BlueNoise_Texture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
uvec4 u_xlatu0;
vec3 u_xlat1;
mediump float u_xlat10_1;
uvec4 u_xlatu1;
bvec3 u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat10_2;
ivec4 u_xlati2;
uvec4 u_xlatu2;
vec4 u_xlat3;
mediump vec3 u_xlat10_3;
ivec4 u_xlati3;
uvec4 u_xlatu3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
float u_xlat10;
bool u_xlatb10;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump float u_xlat16_23;
mediump float u_xlat16_32;
mediump float u_xlat16_34;
void main()
{
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat1.xy = vs_TEXCOORD0.xy * _SourceSize.xy;
    u_xlati2 = ivec4(u_xlat1.xyxy);
    u_xlat1.xy = trunc(u_xlat1.xy);
    u_xlat1.xy = max(u_xlat1.xy, vec2(0.0, 0.0));
    u_xlati3 = u_xlati2.zwzw + ivec4(int(0xFFFFFFFFu), int(0xFFFFFFFFu), 1, int(0xFFFFFFFFu));
    u_xlati2 = u_xlati2 + ivec4(int(0xFFFFFFFFu), 1, 1, 1);
    u_xlat2 = vec4(u_xlati2);
    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat3 = vec4(u_xlati3);
    u_xlat3 = max(u_xlat3, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat4 = _SourceSize.xyxy + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat3 = min(u_xlat3, u_xlat4);
    u_xlatu3 =  uvec4(ivec4(u_xlat3.zwxy));
    u_xlatu0.xy = u_xlatu3.zw;
    u_xlat0.xyz = texelFetch(_SourceTex, ivec2(u_xlatu0.xy), int(u_xlatu0.w)).xyz;
    u_xlat16_5.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.x = dot(u_xlat16_5.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat0 = min(u_xlat2, u_xlat4);
    u_xlat1.xy = min(u_xlat1.xy, u_xlat4.xy);
    u_xlatu1.xy =  uvec2(ivec2(u_xlat1.xy));
    u_xlatu0 =  uvec4(ivec4(u_xlat0.zwxy));
    u_xlatu2.xy = u_xlatu0.zw;
    u_xlatu2.z = uint(uint(0u));
    u_xlatu2.w = uint(uint(0u));
    u_xlat2.xyz = texelFetch(_SourceTex, ivec2(u_xlatu2.xy), int(u_xlatu2.w)).xyz;
    u_xlat16_14.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_14.x = dot(u_xlat16_14.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_23 = u_xlat16_14.x + u_xlat16_5.x;
    u_xlatu3.z = uint(uint(0u));
    u_xlatu3.w = uint(uint(0u));
    u_xlat2.xyz = texelFetch(_SourceTex, ivec2(u_xlatu3.xy), int(u_xlatu3.w)).xyz;
    u_xlat16_6.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_32 = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat0.xyz = texelFetch(_SourceTex, ivec2(u_xlatu0.xy), int(u_xlatu0.w)).xyz;
    u_xlat16_6.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.x = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_15.x = u_xlat16_32 + u_xlat16_6.x;
    u_xlat16_0.yw = vec2(u_xlat16_23) + (-u_xlat16_15.xx);
    u_xlat16_23 = u_xlat16_32 + u_xlat16_5.x;
    u_xlat16_15.x = u_xlat16_14.x + u_xlat16_6.x;
    u_xlat16_15.x = u_xlat16_23 + (-u_xlat16_15.x);
    u_xlat16_23 = u_xlat16_14.x + u_xlat16_23;
    u_xlat16_23 = u_xlat16_6.x + u_xlat16_23;
    u_xlat16_23 = u_xlat16_23 * 0.03125;
    u_xlat16_23 = max(u_xlat16_23, 0.0078125);
    u_xlat2.x = min(abs(u_xlat16_0.w), abs(u_xlat16_15.x));
    u_xlat16_0.xz = (-u_xlat16_15.xx);
    u_xlat2.x = u_xlat16_23 + u_xlat2.x;
    u_xlat2.x = float(1.0) / float(u_xlat2.x);
    u_xlat0 = u_xlat16_0 * u_xlat2.xxxx;
    u_xlat0 = max(u_xlat0, vec4(-8.0, -8.0, -8.0, -8.0));
    u_xlat0 = min(u_xlat0, vec4(8.0, 8.0, 8.0, 8.0));
    u_xlat0 = u_xlat0 * _SourceSize.zwzw;
    u_xlat2 = u_xlat0.zwzw * vec4(-0.5, -0.5, -0.166666672, -0.166666672) + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0 * vec4(0.166666672, 0.166666672, 0.5, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_3.xyz = texture(_SourceTex, u_xlat2.xy).xyz;
    u_xlat10_2.xyz = texture(_SourceTex, u_xlat2.zw).xyz;
    u_xlat16_15.xyz = u_xlat10_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.xyz = min(max(u_xlat16_15.xyz, 0.0), 1.0);
#else
    u_xlat16_15.xyz = clamp(u_xlat16_15.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat10_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat10_2.xyz = texture(_SourceTex, u_xlat0.zw).xyz;
    u_xlat10_3.xyz = texture(_SourceTex, u_xlat0.xy).xyz;
    u_xlat16_8.xyz = u_xlat10_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_15.xyz = u_xlat16_15.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat10_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_7.xyz + u_xlat16_8.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_7.xyz = u_xlat16_15.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_7.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_23 = dot(u_xlat16_7.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_34 = min(u_xlat16_14.x, u_xlat16_32);
    u_xlat16_14.x = max(u_xlat16_14.x, u_xlat16_32);
    u_xlat16_14.x = max(u_xlat16_6.x, u_xlat16_14.x);
    u_xlat16_32 = min(u_xlat16_6.x, u_xlat16_34);
    u_xlatu1.z = uint(uint(0u));
    u_xlatu1.w = uint(uint(0u));
    u_xlat1.xyz = texelFetch(_SourceTex, ivec2(u_xlatu1.xy), int(u_xlatu1.w)).xyz;
    u_xlat16_8.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.x = dot(u_xlat16_8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_34 = min(u_xlat16_5.x, u_xlat16_6.x);
    u_xlat16_5.x = max(u_xlat16_5.x, u_xlat16_6.x);
    u_xlat16_5.x = max(u_xlat16_14.x, u_xlat16_5.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(u_xlat16_5.x<u_xlat16_23);
#else
    u_xlatb1.x = u_xlat16_5.x<u_xlat16_23;
#endif
    u_xlat16_5.x = min(u_xlat16_32, u_xlat16_34);
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat16_23<u_xlat16_5.x);
#else
    u_xlatb10 = u_xlat16_23<u_xlat16_5.x;
#endif
    u_xlatb1.x = u_xlatb1.x || u_xlatb10;
    u_xlat16_5.xyz = (u_xlatb1.x) ? u_xlat16_15.xyz : u_xlat16_7.xyz;
    u_xlat16_6.xyz = log2(u_xlat16_5.xyz);
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_6.xyz = exp2(u_xlat16_6.xyz);
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_7.xyz = u_xlat16_5.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb1.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_5.xyzx).xyz;
    u_xlat16_5.x = (u_xlatb1.x) ? u_xlat16_7.x : u_xlat16_6.x;
    u_xlat16_5.y = (u_xlatb1.y) ? u_xlat16_7.y : u_xlat16_6.y;
    u_xlat16_5.z = (u_xlatb1.z) ? u_xlat16_7.z : u_xlat16_6.z;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Dithering_Params.xy + _Dithering_Params.zw;
    u_xlat10_1 = texture(_BlueNoise_Texture, u_xlat1.xy).w;
    u_xlat1.x = u_xlat10_1 * 2.0 + -1.0;
    u_xlat10 = -abs(u_xlat1.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(u_xlat1.x>=0.0);
#else
    u_xlatb1.x = u_xlat1.x>=0.0;
#endif
    u_xlat1.x = (u_xlatb1.x) ? 1.0 : -1.0;
    u_xlat10 = sqrt(u_xlat10);
    u_xlat10 = (-u_xlat10) + 1.0;
    u_xlat1.x = u_xlat10 * u_xlat1.x;
    u_xlat1.xyz = u_xlat1.xxx * vec3(0.00392156886, 0.00392156886, 0.00392156886) + u_xlat16_5.xyz;
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Local Keywords { "_FILM_GRAIN" "_FXAA" }
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
uniform 	vec2 _Grain_Params;
uniform 	vec4 _Grain_TilingParams;
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Grain_Texture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
uvec4 u_xlatu0;
vec3 u_xlat1;
mediump float u_xlat10_1;
uvec4 u_xlatu1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat10_2;
ivec4 u_xlati2;
uvec4 u_xlatu2;
vec4 u_xlat3;
mediump vec3 u_xlat10_3;
ivec4 u_xlati3;
uvec4 u_xlatu3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
bool u_xlatb10;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump float u_xlat16_23;
float u_xlat28;
mediump float u_xlat16_32;
mediump float u_xlat16_34;
void main()
{
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat1.xy = vs_TEXCOORD0.xy * _SourceSize.xy;
    u_xlati2 = ivec4(u_xlat1.xyxy);
    u_xlat1.xy = trunc(u_xlat1.xy);
    u_xlat1.xy = max(u_xlat1.xy, vec2(0.0, 0.0));
    u_xlati3 = u_xlati2.zwzw + ivec4(int(0xFFFFFFFFu), int(0xFFFFFFFFu), 1, int(0xFFFFFFFFu));
    u_xlati2 = u_xlati2 + ivec4(int(0xFFFFFFFFu), 1, 1, 1);
    u_xlat2 = vec4(u_xlati2);
    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat3 = vec4(u_xlati3);
    u_xlat3 = max(u_xlat3, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat4 = _SourceSize.xyxy + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat3 = min(u_xlat3, u_xlat4);
    u_xlatu3 =  uvec4(ivec4(u_xlat3.zwxy));
    u_xlatu0.xy = u_xlatu3.zw;
    u_xlat0.xyz = texelFetch(_SourceTex, ivec2(u_xlatu0.xy), int(u_xlatu0.w)).xyz;
    u_xlat16_5.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.x = dot(u_xlat16_5.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat0 = min(u_xlat2, u_xlat4);
    u_xlat1.xy = min(u_xlat1.xy, u_xlat4.xy);
    u_xlatu1.xy =  uvec2(ivec2(u_xlat1.xy));
    u_xlatu0 =  uvec4(ivec4(u_xlat0.zwxy));
    u_xlatu2.xy = u_xlatu0.zw;
    u_xlatu2.z = uint(uint(0u));
    u_xlatu2.w = uint(uint(0u));
    u_xlat2.xyz = texelFetch(_SourceTex, ivec2(u_xlatu2.xy), int(u_xlatu2.w)).xyz;
    u_xlat16_14.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_14.x = dot(u_xlat16_14.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_23 = u_xlat16_14.x + u_xlat16_5.x;
    u_xlatu3.z = uint(uint(0u));
    u_xlatu3.w = uint(uint(0u));
    u_xlat2.xyz = texelFetch(_SourceTex, ivec2(u_xlatu3.xy), int(u_xlatu3.w)).xyz;
    u_xlat16_6.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_32 = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat0.xyz = texelFetch(_SourceTex, ivec2(u_xlatu0.xy), int(u_xlatu0.w)).xyz;
    u_xlat16_6.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.x = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_15.x = u_xlat16_32 + u_xlat16_6.x;
    u_xlat16_0.yw = vec2(u_xlat16_23) + (-u_xlat16_15.xx);
    u_xlat16_23 = u_xlat16_32 + u_xlat16_5.x;
    u_xlat16_15.x = u_xlat16_14.x + u_xlat16_6.x;
    u_xlat16_15.x = u_xlat16_23 + (-u_xlat16_15.x);
    u_xlat16_23 = u_xlat16_14.x + u_xlat16_23;
    u_xlat16_23 = u_xlat16_6.x + u_xlat16_23;
    u_xlat16_23 = u_xlat16_23 * 0.03125;
    u_xlat16_23 = max(u_xlat16_23, 0.0078125);
    u_xlat2.x = min(abs(u_xlat16_0.w), abs(u_xlat16_15.x));
    u_xlat16_0.xz = (-u_xlat16_15.xx);
    u_xlat2.x = u_xlat16_23 + u_xlat2.x;
    u_xlat2.x = float(1.0) / float(u_xlat2.x);
    u_xlat0 = u_xlat16_0 * u_xlat2.xxxx;
    u_xlat0 = max(u_xlat0, vec4(-8.0, -8.0, -8.0, -8.0));
    u_xlat0 = min(u_xlat0, vec4(8.0, 8.0, 8.0, 8.0));
    u_xlat0 = u_xlat0 * _SourceSize.zwzw;
    u_xlat2 = u_xlat0.zwzw * vec4(-0.5, -0.5, -0.166666672, -0.166666672) + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0 * vec4(0.166666672, 0.166666672, 0.5, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_3.xyz = texture(_SourceTex, u_xlat2.xy).xyz;
    u_xlat10_2.xyz = texture(_SourceTex, u_xlat2.zw).xyz;
    u_xlat16_15.xyz = u_xlat10_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.xyz = min(max(u_xlat16_15.xyz, 0.0), 1.0);
#else
    u_xlat16_15.xyz = clamp(u_xlat16_15.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat10_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat10_2.xyz = texture(_SourceTex, u_xlat0.zw).xyz;
    u_xlat10_3.xyz = texture(_SourceTex, u_xlat0.xy).xyz;
    u_xlat16_8.xyz = u_xlat10_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_15.xyz = u_xlat16_15.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat10_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_7.xyz + u_xlat16_8.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_7.xyz = u_xlat16_15.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_7.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_23 = dot(u_xlat16_7.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_34 = min(u_xlat16_14.x, u_xlat16_32);
    u_xlat16_14.x = max(u_xlat16_14.x, u_xlat16_32);
    u_xlat16_14.x = max(u_xlat16_6.x, u_xlat16_14.x);
    u_xlat16_32 = min(u_xlat16_6.x, u_xlat16_34);
    u_xlatu1.z = uint(uint(0u));
    u_xlatu1.w = uint(uint(0u));
    u_xlat1.xyz = texelFetch(_SourceTex, ivec2(u_xlatu1.xy), int(u_xlatu1.w)).xyz;
    u_xlat16_8.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.x = dot(u_xlat16_8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_34 = min(u_xlat16_5.x, u_xlat16_6.x);
    u_xlat16_5.x = max(u_xlat16_5.x, u_xlat16_6.x);
    u_xlat16_5.x = max(u_xlat16_14.x, u_xlat16_5.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_5.x<u_xlat16_23);
#else
    u_xlatb1 = u_xlat16_5.x<u_xlat16_23;
#endif
    u_xlat16_5.x = min(u_xlat16_32, u_xlat16_34);
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat16_23<u_xlat16_5.x);
#else
    u_xlatb10 = u_xlat16_23<u_xlat16_5.x;
#endif
    u_xlatb1 = u_xlatb1 || u_xlatb10;
    u_xlat16_5.xyz = (bool(u_xlatb1)) ? u_xlat16_15.xyz : u_xlat16_7.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Grain_TilingParams.xy + _Grain_TilingParams.zw;
    u_xlat10_1 = texture(_Grain_Texture, u_xlat1.xy).w;
    u_xlat16_32 = u_xlat10_1 + -0.5;
    u_xlat16_32 = u_xlat16_32 + u_xlat16_32;
    u_xlat16_6.xyz = vec3(u_xlat16_32) * u_xlat16_5.xyz;
    u_xlat1.xyz = u_xlat16_6.xyz * _Grain_Params.xxx;
    u_xlat16_32 = dot(u_xlat16_5.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_32 = sqrt(u_xlat16_32);
    u_xlat28 = _Grain_Params.y * (-u_xlat16_32) + 1.0;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat28) + u_xlat16_5.xyz;
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Local Keywords { "_FILM_GRAIN" "_FXAA" "_LINEAR_TO_SRGB_CONVERSION" }
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
uniform 	vec2 _Grain_Params;
uniform 	vec4 _Grain_TilingParams;
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Grain_Texture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
uvec4 u_xlatu0;
vec3 u_xlat1;
mediump float u_xlat10_1;
uvec4 u_xlatu1;
bvec3 u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat10_2;
ivec4 u_xlati2;
uvec4 u_xlatu2;
vec4 u_xlat3;
mediump vec3 u_xlat10_3;
ivec4 u_xlati3;
uvec4 u_xlatu3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
bool u_xlatb10;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump float u_xlat16_23;
float u_xlat28;
mediump float u_xlat16_32;
mediump float u_xlat16_34;
void main()
{
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat1.xy = vs_TEXCOORD0.xy * _SourceSize.xy;
    u_xlati2 = ivec4(u_xlat1.xyxy);
    u_xlat1.xy = trunc(u_xlat1.xy);
    u_xlat1.xy = max(u_xlat1.xy, vec2(0.0, 0.0));
    u_xlati3 = u_xlati2.zwzw + ivec4(int(0xFFFFFFFFu), int(0xFFFFFFFFu), 1, int(0xFFFFFFFFu));
    u_xlati2 = u_xlati2 + ivec4(int(0xFFFFFFFFu), 1, 1, 1);
    u_xlat2 = vec4(u_xlati2);
    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat3 = vec4(u_xlati3);
    u_xlat3 = max(u_xlat3, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat4 = _SourceSize.xyxy + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat3 = min(u_xlat3, u_xlat4);
    u_xlatu3 =  uvec4(ivec4(u_xlat3.zwxy));
    u_xlatu0.xy = u_xlatu3.zw;
    u_xlat0.xyz = texelFetch(_SourceTex, ivec2(u_xlatu0.xy), int(u_xlatu0.w)).xyz;
    u_xlat16_5.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.x = dot(u_xlat16_5.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat0 = min(u_xlat2, u_xlat4);
    u_xlat1.xy = min(u_xlat1.xy, u_xlat4.xy);
    u_xlatu1.xy =  uvec2(ivec2(u_xlat1.xy));
    u_xlatu0 =  uvec4(ivec4(u_xlat0.zwxy));
    u_xlatu2.xy = u_xlatu0.zw;
    u_xlatu2.z = uint(uint(0u));
    u_xlatu2.w = uint(uint(0u));
    u_xlat2.xyz = texelFetch(_SourceTex, ivec2(u_xlatu2.xy), int(u_xlatu2.w)).xyz;
    u_xlat16_14.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_14.x = dot(u_xlat16_14.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_23 = u_xlat16_14.x + u_xlat16_5.x;
    u_xlatu3.z = uint(uint(0u));
    u_xlatu3.w = uint(uint(0u));
    u_xlat2.xyz = texelFetch(_SourceTex, ivec2(u_xlatu3.xy), int(u_xlatu3.w)).xyz;
    u_xlat16_6.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_32 = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat0.xyz = texelFetch(_SourceTex, ivec2(u_xlatu0.xy), int(u_xlatu0.w)).xyz;
    u_xlat16_6.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.x = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_15.x = u_xlat16_32 + u_xlat16_6.x;
    u_xlat16_0.yw = vec2(u_xlat16_23) + (-u_xlat16_15.xx);
    u_xlat16_23 = u_xlat16_32 + u_xlat16_5.x;
    u_xlat16_15.x = u_xlat16_14.x + u_xlat16_6.x;
    u_xlat16_15.x = u_xlat16_23 + (-u_xlat16_15.x);
    u_xlat16_23 = u_xlat16_14.x + u_xlat16_23;
    u_xlat16_23 = u_xlat16_6.x + u_xlat16_23;
    u_xlat16_23 = u_xlat16_23 * 0.03125;
    u_xlat16_23 = max(u_xlat16_23, 0.0078125);
    u_xlat2.x = min(abs(u_xlat16_0.w), abs(u_xlat16_15.x));
    u_xlat16_0.xz = (-u_xlat16_15.xx);
    u_xlat2.x = u_xlat16_23 + u_xlat2.x;
    u_xlat2.x = float(1.0) / float(u_xlat2.x);
    u_xlat0 = u_xlat16_0 * u_xlat2.xxxx;
    u_xlat0 = max(u_xlat0, vec4(-8.0, -8.0, -8.0, -8.0));
    u_xlat0 = min(u_xlat0, vec4(8.0, 8.0, 8.0, 8.0));
    u_xlat0 = u_xlat0 * _SourceSize.zwzw;
    u_xlat2 = u_xlat0.zwzw * vec4(-0.5, -0.5, -0.166666672, -0.166666672) + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0 * vec4(0.166666672, 0.166666672, 0.5, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_3.xyz = texture(_SourceTex, u_xlat2.xy).xyz;
    u_xlat10_2.xyz = texture(_SourceTex, u_xlat2.zw).xyz;
    u_xlat16_15.xyz = u_xlat10_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.xyz = min(max(u_xlat16_15.xyz, 0.0), 1.0);
#else
    u_xlat16_15.xyz = clamp(u_xlat16_15.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat10_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat10_2.xyz = texture(_SourceTex, u_xlat0.zw).xyz;
    u_xlat10_3.xyz = texture(_SourceTex, u_xlat0.xy).xyz;
    u_xlat16_8.xyz = u_xlat10_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_15.xyz = u_xlat16_15.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat10_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_7.xyz + u_xlat16_8.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_7.xyz = u_xlat16_15.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_7.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_23 = dot(u_xlat16_7.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_34 = min(u_xlat16_14.x, u_xlat16_32);
    u_xlat16_14.x = max(u_xlat16_14.x, u_xlat16_32);
    u_xlat16_14.x = max(u_xlat16_6.x, u_xlat16_14.x);
    u_xlat16_32 = min(u_xlat16_6.x, u_xlat16_34);
    u_xlatu1.z = uint(uint(0u));
    u_xlatu1.w = uint(uint(0u));
    u_xlat1.xyz = texelFetch(_SourceTex, ivec2(u_xlatu1.xy), int(u_xlatu1.w)).xyz;
    u_xlat16_8.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.x = dot(u_xlat16_8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_34 = min(u_xlat16_5.x, u_xlat16_6.x);
    u_xlat16_5.x = max(u_xlat16_5.x, u_xlat16_6.x);
    u_xlat16_5.x = max(u_xlat16_14.x, u_xlat16_5.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(u_xlat16_5.x<u_xlat16_23);
#else
    u_xlatb1.x = u_xlat16_5.x<u_xlat16_23;
#endif
    u_xlat16_5.x = min(u_xlat16_32, u_xlat16_34);
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat16_23<u_xlat16_5.x);
#else
    u_xlatb10 = u_xlat16_23<u_xlat16_5.x;
#endif
    u_xlatb1.x = u_xlatb1.x || u_xlatb10;
    u_xlat16_5.xyz = (u_xlatb1.x) ? u_xlat16_15.xyz : u_xlat16_7.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Grain_TilingParams.xy + _Grain_TilingParams.zw;
    u_xlat10_1 = texture(_Grain_Texture, u_xlat1.xy).w;
    u_xlat16_32 = u_xlat10_1 + -0.5;
    u_xlat16_32 = u_xlat16_32 + u_xlat16_32;
    u_xlat16_6.xyz = vec3(u_xlat16_32) * u_xlat16_5.xyz;
    u_xlat1.xyz = u_xlat16_6.xyz * _Grain_Params.xxx;
    u_xlat16_32 = dot(u_xlat16_5.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_32 = sqrt(u_xlat16_32);
    u_xlat28 = _Grain_Params.y * (-u_xlat16_32) + 1.0;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat28) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = log2(abs(u_xlat1.xyz));
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_5.xyz = exp2(u_xlat16_5.xyz);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_6.xyz = u_xlat1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb1.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat1.xyzx).xyz;
    SV_Target0.x = (u_xlatb1.x) ? u_xlat16_6.x : u_xlat16_5.x;
    SV_Target0.y = (u_xlatb1.y) ? u_xlat16_6.y : u_xlat16_5.y;
    SV_Target0.z = (u_xlatb1.z) ? u_xlat16_6.z : u_xlat16_5.z;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Local Keywords { "_DITHERING" "_FILM_GRAIN" "_FXAA" }
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
uniform 	vec2 _Grain_Params;
uniform 	vec4 _Grain_TilingParams;
uniform 	vec4 _Dithering_Params;
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Grain_Texture;
UNITY_LOCATION(2) uniform mediump sampler2D _BlueNoise_Texture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
uvec4 u_xlatu0;
vec3 u_xlat1;
mediump float u_xlat10_1;
uvec4 u_xlatu1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat10_2;
ivec4 u_xlati2;
uvec4 u_xlatu2;
vec4 u_xlat3;
mediump vec3 u_xlat10_3;
ivec4 u_xlati3;
uvec4 u_xlatu3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
bool u_xlatb10;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump float u_xlat16_23;
float u_xlat28;
mediump float u_xlat10_28;
bool u_xlatb28;
mediump float u_xlat16_32;
mediump float u_xlat16_34;
void main()
{
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat1.xy = vs_TEXCOORD0.xy * _SourceSize.xy;
    u_xlati2 = ivec4(u_xlat1.xyxy);
    u_xlat1.xy = trunc(u_xlat1.xy);
    u_xlat1.xy = max(u_xlat1.xy, vec2(0.0, 0.0));
    u_xlati3 = u_xlati2.zwzw + ivec4(int(0xFFFFFFFFu), int(0xFFFFFFFFu), 1, int(0xFFFFFFFFu));
    u_xlati2 = u_xlati2 + ivec4(int(0xFFFFFFFFu), 1, 1, 1);
    u_xlat2 = vec4(u_xlati2);
    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat3 = vec4(u_xlati3);
    u_xlat3 = max(u_xlat3, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat4 = _SourceSize.xyxy + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat3 = min(u_xlat3, u_xlat4);
    u_xlatu3 =  uvec4(ivec4(u_xlat3.zwxy));
    u_xlatu0.xy = u_xlatu3.zw;
    u_xlat0.xyz = texelFetch(_SourceTex, ivec2(u_xlatu0.xy), int(u_xlatu0.w)).xyz;
    u_xlat16_5.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.x = dot(u_xlat16_5.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat0 = min(u_xlat2, u_xlat4);
    u_xlat1.xy = min(u_xlat1.xy, u_xlat4.xy);
    u_xlatu1.xy =  uvec2(ivec2(u_xlat1.xy));
    u_xlatu0 =  uvec4(ivec4(u_xlat0.zwxy));
    u_xlatu2.xy = u_xlatu0.zw;
    u_xlatu2.z = uint(uint(0u));
    u_xlatu2.w = uint(uint(0u));
    u_xlat2.xyz = texelFetch(_SourceTex, ivec2(u_xlatu2.xy), int(u_xlatu2.w)).xyz;
    u_xlat16_14.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_14.x = dot(u_xlat16_14.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_23 = u_xlat16_14.x + u_xlat16_5.x;
    u_xlatu3.z = uint(uint(0u));
    u_xlatu3.w = uint(uint(0u));
    u_xlat2.xyz = texelFetch(_SourceTex, ivec2(u_xlatu3.xy), int(u_xlatu3.w)).xyz;
    u_xlat16_6.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_32 = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat0.xyz = texelFetch(_SourceTex, ivec2(u_xlatu0.xy), int(u_xlatu0.w)).xyz;
    u_xlat16_6.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.x = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_15.x = u_xlat16_32 + u_xlat16_6.x;
    u_xlat16_0.yw = vec2(u_xlat16_23) + (-u_xlat16_15.xx);
    u_xlat16_23 = u_xlat16_32 + u_xlat16_5.x;
    u_xlat16_15.x = u_xlat16_14.x + u_xlat16_6.x;
    u_xlat16_15.x = u_xlat16_23 + (-u_xlat16_15.x);
    u_xlat16_23 = u_xlat16_14.x + u_xlat16_23;
    u_xlat16_23 = u_xlat16_6.x + u_xlat16_23;
    u_xlat16_23 = u_xlat16_23 * 0.03125;
    u_xlat16_23 = max(u_xlat16_23, 0.0078125);
    u_xlat2.x = min(abs(u_xlat16_0.w), abs(u_xlat16_15.x));
    u_xlat16_0.xz = (-u_xlat16_15.xx);
    u_xlat2.x = u_xlat16_23 + u_xlat2.x;
    u_xlat2.x = float(1.0) / float(u_xlat2.x);
    u_xlat0 = u_xlat16_0 * u_xlat2.xxxx;
    u_xlat0 = max(u_xlat0, vec4(-8.0, -8.0, -8.0, -8.0));
    u_xlat0 = min(u_xlat0, vec4(8.0, 8.0, 8.0, 8.0));
    u_xlat0 = u_xlat0 * _SourceSize.zwzw;
    u_xlat2 = u_xlat0.zwzw * vec4(-0.5, -0.5, -0.166666672, -0.166666672) + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0 * vec4(0.166666672, 0.166666672, 0.5, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_3.xyz = texture(_SourceTex, u_xlat2.xy).xyz;
    u_xlat10_2.xyz = texture(_SourceTex, u_xlat2.zw).xyz;
    u_xlat16_15.xyz = u_xlat10_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.xyz = min(max(u_xlat16_15.xyz, 0.0), 1.0);
#else
    u_xlat16_15.xyz = clamp(u_xlat16_15.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat10_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat10_2.xyz = texture(_SourceTex, u_xlat0.zw).xyz;
    u_xlat10_3.xyz = texture(_SourceTex, u_xlat0.xy).xyz;
    u_xlat16_8.xyz = u_xlat10_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_15.xyz = u_xlat16_15.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat10_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_7.xyz + u_xlat16_8.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_7.xyz = u_xlat16_15.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_7.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_23 = dot(u_xlat16_7.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_34 = min(u_xlat16_14.x, u_xlat16_32);
    u_xlat16_14.x = max(u_xlat16_14.x, u_xlat16_32);
    u_xlat16_14.x = max(u_xlat16_6.x, u_xlat16_14.x);
    u_xlat16_32 = min(u_xlat16_6.x, u_xlat16_34);
    u_xlatu1.z = uint(uint(0u));
    u_xlatu1.w = uint(uint(0u));
    u_xlat1.xyz = texelFetch(_SourceTex, ivec2(u_xlatu1.xy), int(u_xlatu1.w)).xyz;
    u_xlat16_8.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.x = dot(u_xlat16_8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_34 = min(u_xlat16_5.x, u_xlat16_6.x);
    u_xlat16_5.x = max(u_xlat16_5.x, u_xlat16_6.x);
    u_xlat16_5.x = max(u_xlat16_14.x, u_xlat16_5.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_5.x<u_xlat16_23);
#else
    u_xlatb1 = u_xlat16_5.x<u_xlat16_23;
#endif
    u_xlat16_5.x = min(u_xlat16_32, u_xlat16_34);
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat16_23<u_xlat16_5.x);
#else
    u_xlatb10 = u_xlat16_23<u_xlat16_5.x;
#endif
    u_xlatb1 = u_xlatb1 || u_xlatb10;
    u_xlat16_5.xyz = (bool(u_xlatb1)) ? u_xlat16_15.xyz : u_xlat16_7.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Grain_TilingParams.xy + _Grain_TilingParams.zw;
    u_xlat10_1 = texture(_Grain_Texture, u_xlat1.xy).w;
    u_xlat16_32 = u_xlat10_1 + -0.5;
    u_xlat16_32 = u_xlat16_32 + u_xlat16_32;
    u_xlat16_6.xyz = vec3(u_xlat16_32) * u_xlat16_5.xyz;
    u_xlat1.xyz = u_xlat16_6.xyz * _Grain_Params.xxx;
    u_xlat16_32 = dot(u_xlat16_5.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_32 = sqrt(u_xlat16_32);
    u_xlat28 = _Grain_Params.y * (-u_xlat16_32) + 1.0;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat28) + u_xlat16_5.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Dithering_Params.xy + _Dithering_Params.zw;
    u_xlat10_28 = texture(_BlueNoise_Texture, u_xlat2.xy).w;
    u_xlat28 = u_xlat10_28 * 2.0 + -1.0;
    u_xlat2.x = -abs(u_xlat28) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(u_xlat28>=0.0);
#else
    u_xlatb28 = u_xlat28>=0.0;
#endif
    u_xlat28 = (u_xlatb28) ? 1.0 : -1.0;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat28 = u_xlat28 * u_xlat2.x;
    u_xlat1.xyz = vec3(u_xlat28) * vec3(0.00392156886, 0.00392156886, 0.00392156886) + u_xlat1.xyz;
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Local Keywords { "_DITHERING" "_FILM_GRAIN" "_FXAA" "_LINEAR_TO_SRGB_CONVERSION" }
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
uniform 	vec2 _Grain_Params;
uniform 	vec4 _Grain_TilingParams;
uniform 	vec4 _Dithering_Params;
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Grain_Texture;
UNITY_LOCATION(2) uniform mediump sampler2D _BlueNoise_Texture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
uvec4 u_xlatu0;
vec3 u_xlat1;
mediump float u_xlat10_1;
uvec4 u_xlatu1;
bvec3 u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat10_2;
ivec4 u_xlati2;
uvec4 u_xlatu2;
vec4 u_xlat3;
mediump vec3 u_xlat10_3;
ivec4 u_xlati3;
uvec4 u_xlatu3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
float u_xlat10;
bool u_xlatb10;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump float u_xlat16_23;
float u_xlat28;
mediump float u_xlat16_32;
mediump float u_xlat16_34;
void main()
{
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat1.xy = vs_TEXCOORD0.xy * _SourceSize.xy;
    u_xlati2 = ivec4(u_xlat1.xyxy);
    u_xlat1.xy = trunc(u_xlat1.xy);
    u_xlat1.xy = max(u_xlat1.xy, vec2(0.0, 0.0));
    u_xlati3 = u_xlati2.zwzw + ivec4(int(0xFFFFFFFFu), int(0xFFFFFFFFu), 1, int(0xFFFFFFFFu));
    u_xlati2 = u_xlati2 + ivec4(int(0xFFFFFFFFu), 1, 1, 1);
    u_xlat2 = vec4(u_xlati2);
    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat3 = vec4(u_xlati3);
    u_xlat3 = max(u_xlat3, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat4 = _SourceSize.xyxy + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat3 = min(u_xlat3, u_xlat4);
    u_xlatu3 =  uvec4(ivec4(u_xlat3.zwxy));
    u_xlatu0.xy = u_xlatu3.zw;
    u_xlat0.xyz = texelFetch(_SourceTex, ivec2(u_xlatu0.xy), int(u_xlatu0.w)).xyz;
    u_xlat16_5.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.x = dot(u_xlat16_5.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat0 = min(u_xlat2, u_xlat4);
    u_xlat1.xy = min(u_xlat1.xy, u_xlat4.xy);
    u_xlatu1.xy =  uvec2(ivec2(u_xlat1.xy));
    u_xlatu0 =  uvec4(ivec4(u_xlat0.zwxy));
    u_xlatu2.xy = u_xlatu0.zw;
    u_xlatu2.z = uint(uint(0u));
    u_xlatu2.w = uint(uint(0u));
    u_xlat2.xyz = texelFetch(_SourceTex, ivec2(u_xlatu2.xy), int(u_xlatu2.w)).xyz;
    u_xlat16_14.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_14.x = dot(u_xlat16_14.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_23 = u_xlat16_14.x + u_xlat16_5.x;
    u_xlatu3.z = uint(uint(0u));
    u_xlatu3.w = uint(uint(0u));
    u_xlat2.xyz = texelFetch(_SourceTex, ivec2(u_xlatu3.xy), int(u_xlatu3.w)).xyz;
    u_xlat16_6.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_32 = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat0.xyz = texelFetch(_SourceTex, ivec2(u_xlatu0.xy), int(u_xlatu0.w)).xyz;
    u_xlat16_6.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.x = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_15.x = u_xlat16_32 + u_xlat16_6.x;
    u_xlat16_0.yw = vec2(u_xlat16_23) + (-u_xlat16_15.xx);
    u_xlat16_23 = u_xlat16_32 + u_xlat16_5.x;
    u_xlat16_15.x = u_xlat16_14.x + u_xlat16_6.x;
    u_xlat16_15.x = u_xlat16_23 + (-u_xlat16_15.x);
    u_xlat16_23 = u_xlat16_14.x + u_xlat16_23;
    u_xlat16_23 = u_xlat16_6.x + u_xlat16_23;
    u_xlat16_23 = u_xlat16_23 * 0.03125;
    u_xlat16_23 = max(u_xlat16_23, 0.0078125);
    u_xlat2.x = min(abs(u_xlat16_0.w), abs(u_xlat16_15.x));
    u_xlat16_0.xz = (-u_xlat16_15.xx);
    u_xlat2.x = u_xlat16_23 + u_xlat2.x;
    u_xlat2.x = float(1.0) / float(u_xlat2.x);
    u_xlat0 = u_xlat16_0 * u_xlat2.xxxx;
    u_xlat0 = max(u_xlat0, vec4(-8.0, -8.0, -8.0, -8.0));
    u_xlat0 = min(u_xlat0, vec4(8.0, 8.0, 8.0, 8.0));
    u_xlat0 = u_xlat0 * _SourceSize.zwzw;
    u_xlat2 = u_xlat0.zwzw * vec4(-0.5, -0.5, -0.166666672, -0.166666672) + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0 * vec4(0.166666672, 0.166666672, 0.5, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_3.xyz = texture(_SourceTex, u_xlat2.xy).xyz;
    u_xlat10_2.xyz = texture(_SourceTex, u_xlat2.zw).xyz;
    u_xlat16_15.xyz = u_xlat10_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.xyz = min(max(u_xlat16_15.xyz, 0.0), 1.0);
#else
    u_xlat16_15.xyz = clamp(u_xlat16_15.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat10_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat10_2.xyz = texture(_SourceTex, u_xlat0.zw).xyz;
    u_xlat10_3.xyz = texture(_SourceTex, u_xlat0.xy).xyz;
    u_xlat16_8.xyz = u_xlat10_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_15.xyz = u_xlat16_15.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat10_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_7.xyz + u_xlat16_8.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_7.xyz = u_xlat16_15.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_7.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_23 = dot(u_xlat16_7.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_34 = min(u_xlat16_14.x, u_xlat16_32);
    u_xlat16_14.x = max(u_xlat16_14.x, u_xlat16_32);
    u_xlat16_14.x = max(u_xlat16_6.x, u_xlat16_14.x);
    u_xlat16_32 = min(u_xlat16_6.x, u_xlat16_34);
    u_xlatu1.z = uint(uint(0u));
    u_xlatu1.w = uint(uint(0u));
    u_xlat1.xyz = texelFetch(_SourceTex, ivec2(u_xlatu1.xy), int(u_xlatu1.w)).xyz;
    u_xlat16_8.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.x = dot(u_xlat16_8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_34 = min(u_xlat16_5.x, u_xlat16_6.x);
    u_xlat16_5.x = max(u_xlat16_5.x, u_xlat16_6.x);
    u_xlat16_5.x = max(u_xlat16_14.x, u_xlat16_5.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(u_xlat16_5.x<u_xlat16_23);
#else
    u_xlatb1.x = u_xlat16_5.x<u_xlat16_23;
#endif
    u_xlat16_5.x = min(u_xlat16_32, u_xlat16_34);
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat16_23<u_xlat16_5.x);
#else
    u_xlatb10 = u_xlat16_23<u_xlat16_5.x;
#endif
    u_xlatb1.x = u_xlatb1.x || u_xlatb10;
    u_xlat16_5.xyz = (u_xlatb1.x) ? u_xlat16_15.xyz : u_xlat16_7.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Grain_TilingParams.xy + _Grain_TilingParams.zw;
    u_xlat10_1 = texture(_Grain_Texture, u_xlat1.xy).w;
    u_xlat16_32 = u_xlat10_1 + -0.5;
    u_xlat16_32 = u_xlat16_32 + u_xlat16_32;
    u_xlat16_6.xyz = vec3(u_xlat16_32) * u_xlat16_5.xyz;
    u_xlat1.xyz = u_xlat16_6.xyz * _Grain_Params.xxx;
    u_xlat16_32 = dot(u_xlat16_5.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_32 = sqrt(u_xlat16_32);
    u_xlat28 = _Grain_Params.y * (-u_xlat16_32) + 1.0;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat28) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = log2(abs(u_xlat1.xyz));
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_5.xyz = exp2(u_xlat16_5.xyz);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_6.xyz = u_xlat1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb1.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat1.xyzx).xyz;
    {
        vec3 hlslcc_movcTemp = u_xlat16_5;
        hlslcc_movcTemp.x = (u_xlatb1.x) ? u_xlat16_6.x : u_xlat16_5.x;
        hlslcc_movcTemp.y = (u_xlatb1.y) ? u_xlat16_6.y : u_xlat16_5.y;
        hlslcc_movcTemp.z = (u_xlatb1.z) ? u_xlat16_6.z : u_xlat16_5.z;
        u_xlat16_5 = hlslcc_movcTemp;
    }
    u_xlat1.xy = vs_TEXCOORD0.xy * _Dithering_Params.xy + _Dithering_Params.zw;
    u_xlat10_1 = texture(_BlueNoise_Texture, u_xlat1.xy).w;
    u_xlat1.x = u_xlat10_1 * 2.0 + -1.0;
    u_xlat10 = -abs(u_xlat1.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(u_xlat1.x>=0.0);
#else
    u_xlatb1.x = u_xlat1.x>=0.0;
#endif
    u_xlat1.x = (u_xlatb1.x) ? 1.0 : -1.0;
    u_xlat10 = sqrt(u_xlat10);
    u_xlat10 = (-u_xlat10) + 1.0;
    u_xlat1.x = u_xlat10 * u_xlat1.x;
    u_xlat1.xyz = u_xlat1.xxx * vec3(0.00392156886, 0.00392156886, 0.00392156886) + u_xlat16_5.xyz;
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
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
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
uvec4 u_xlatu0;
vec2 u_xlat2;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _SourceSize.xy;
    u_xlat0.xy = trunc(u_xlat0.xy);
    u_xlat0.xy = max(u_xlat0.xy, vec2(0.0, 0.0));
    u_xlat2.xy = _SourceSize.xy + vec2(-1.0, -1.0);
    u_xlat0.xy = min(u_xlat2.xy, u_xlat0.xy);
    u_xlatu0.xy =  uvec2(ivec2(u_xlat0.xy));
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat0.xyz = texelFetch(_SourceTex, ivec2(u_xlatu0.xy), int(u_xlatu0.w)).xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_USE_DRAW_PROCEDURAL" }
Local Keywords { "_LINEAR_TO_SRGB_CONVERSION" }
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
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
uvec4 u_xlatu0;
bvec3 u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec2 u_xlat6;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _SourceSize.xy;
    u_xlat0.xy = trunc(u_xlat0.xy);
    u_xlat0.xy = max(u_xlat0.xy, vec2(0.0, 0.0));
    u_xlat6.xy = _SourceSize.xy + vec2(-1.0, -1.0);
    u_xlat0.xy = min(u_xlat6.xy, u_xlat0.xy);
    u_xlatu0.xy =  uvec2(ivec2(u_xlat0.xy));
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat0.xyz = texelFetch(_SourceTex, ivec2(u_xlatu0.xy), int(u_xlatu0.w)).xyz;
    u_xlat16_1.xyz = log2(abs(u_xlat0.xyz));
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_1.xyz = exp2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb0.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat0.xyzx).xyz;
    SV_Target0.x = (u_xlatb0.x) ? u_xlat16_2.x : u_xlat16_1.x;
    SV_Target0.y = (u_xlatb0.y) ? u_xlat16_2.y : u_xlat16_1.y;
    SV_Target0.z = (u_xlatb0.z) ? u_xlat16_2.z : u_xlat16_1.z;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_USE_DRAW_PROCEDURAL" }
Local Keywords { "_DITHERING" }
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
uniform 	vec4 _Dithering_Params;
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
UNITY_LOCATION(1) uniform mediump sampler2D _BlueNoise_Texture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat10_0;
bool u_xlatb0;
vec2 u_xlat1;
uvec4 u_xlatu1;
vec3 u_xlat2;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Dithering_Params.xy + _Dithering_Params.zw;
    u_xlat10_0 = texture(_BlueNoise_Texture, u_xlat0.xy).w;
    u_xlat0.x = u_xlat10_0 * 2.0 + -1.0;
    u_xlat2.x = -abs(u_xlat0.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x>=0.0);
#else
    u_xlatb0 = u_xlat0.x>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat0.x = u_xlat2.x * u_xlat0.x;
    u_xlat2.xy = vs_TEXCOORD0.xy * _SourceSize.xy;
    u_xlat2.xy = trunc(u_xlat2.xy);
    u_xlat2.xy = max(u_xlat2.xy, vec2(0.0, 0.0));
    u_xlat1.xy = _SourceSize.xy + vec2(-1.0, -1.0);
    u_xlat2.xy = min(u_xlat2.xy, u_xlat1.xy);
    u_xlatu1.xy =  uvec2(ivec2(u_xlat2.xy));
    u_xlatu1.z = uint(uint(0u));
    u_xlatu1.w = uint(uint(0u));
    u_xlat2.xyz = texelFetch(_SourceTex, ivec2(u_xlatu1.xy), int(u_xlatu1.w)).xyz;
    u_xlat0.xyz = u_xlat0.xxx * vec3(0.00392156886, 0.00392156886, 0.00392156886) + u_xlat2.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_USE_DRAW_PROCEDURAL" }
Local Keywords { "_DITHERING" "_LINEAR_TO_SRGB_CONVERSION" }
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
uniform 	vec4 _Dithering_Params;
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
UNITY_LOCATION(1) uniform mediump sampler2D _BlueNoise_Texture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat10_0;
uvec4 u_xlatu0;
bvec3 u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
float u_xlat3;
vec2 u_xlat6;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _SourceSize.xy;
    u_xlat0.xy = trunc(u_xlat0.xy);
    u_xlat0.xy = max(u_xlat0.xy, vec2(0.0, 0.0));
    u_xlat6.xy = _SourceSize.xy + vec2(-1.0, -1.0);
    u_xlat0.xy = min(u_xlat6.xy, u_xlat0.xy);
    u_xlatu0.xy =  uvec2(ivec2(u_xlat0.xy));
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat0.xyz = texelFetch(_SourceTex, ivec2(u_xlatu0.xy), int(u_xlatu0.w)).xyz;
    u_xlat16_1.xyz = log2(abs(u_xlat0.xyz));
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_1.xyz = exp2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_2.xyz = u_xlat0.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb0.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat0.xyzx).xyz;
    {
        vec3 hlslcc_movcTemp = u_xlat16_1;
        hlslcc_movcTemp.x = (u_xlatb0.x) ? u_xlat16_2.x : u_xlat16_1.x;
        hlslcc_movcTemp.y = (u_xlatb0.y) ? u_xlat16_2.y : u_xlat16_1.y;
        hlslcc_movcTemp.z = (u_xlatb0.z) ? u_xlat16_2.z : u_xlat16_1.z;
        u_xlat16_1 = hlslcc_movcTemp;
    }
    u_xlat0.xy = vs_TEXCOORD0.xy * _Dithering_Params.xy + _Dithering_Params.zw;
    u_xlat10_0 = texture(_BlueNoise_Texture, u_xlat0.xy).w;
    u_xlat0.x = u_xlat10_0 * 2.0 + -1.0;
    u_xlat3 = -abs(u_xlat0.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat0.x>=0.0);
#else
    u_xlatb0.x = u_xlat0.x>=0.0;
#endif
    u_xlat0.x = (u_xlatb0.x) ? 1.0 : -1.0;
    u_xlat3 = sqrt(u_xlat3);
    u_xlat3 = (-u_xlat3) + 1.0;
    u_xlat0.x = u_xlat3 * u_xlat0.x;
    u_xlat0.xyz = u_xlat0.xxx * vec3(0.00392156886, 0.00392156886, 0.00392156886) + u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_USE_DRAW_PROCEDURAL" }
Local Keywords { "_FILM_GRAIN" }
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
uniform 	vec2 _Grain_Params;
uniform 	vec4 _Grain_TilingParams;
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Grain_Texture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat10_0;
uvec4 u_xlatu0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec2 u_xlat6;
float u_xlat9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Grain_TilingParams.xy + _Grain_TilingParams.zw;
    u_xlat10_0 = texture(_Grain_Texture, u_xlat0.xy).w;
    u_xlat16_1.x = u_xlat10_0 + -0.5;
    u_xlat16_1.x = u_xlat16_1.x + u_xlat16_1.x;
    u_xlat0.xy = vs_TEXCOORD0.xy * _SourceSize.xy;
    u_xlat0.xy = trunc(u_xlat0.xy);
    u_xlat0.xy = max(u_xlat0.xy, vec2(0.0, 0.0));
    u_xlat6.xy = _SourceSize.xy + vec2(-1.0, -1.0);
    u_xlat0.xy = min(u_xlat6.xy, u_xlat0.xy);
    u_xlatu0.xy =  uvec2(ivec2(u_xlat0.xy));
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat0.xyz = texelFetch(_SourceTex, ivec2(u_xlatu0.xy), int(u_xlatu0.w)).xyz;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat16_1.xyz * _Grain_Params.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat9 = _Grain_Params.y * (-u_xlat16_1.x) + 1.0;
    u_xlat0.xyz = u_xlat2.xyz * vec3(u_xlat9) + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_USE_DRAW_PROCEDURAL" }
Local Keywords { "_FILM_GRAIN" "_LINEAR_TO_SRGB_CONVERSION" }
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
uniform 	vec2 _Grain_Params;
uniform 	vec4 _Grain_TilingParams;
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Grain_Texture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat10_0;
uvec4 u_xlatu0;
bvec3 u_xlatb0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec2 u_xlat8;
float u_xlat12;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Grain_TilingParams.xy + _Grain_TilingParams.zw;
    u_xlat10_0 = texture(_Grain_Texture, u_xlat0.xy).w;
    u_xlat16_1.x = u_xlat10_0 + -0.5;
    u_xlat16_1.x = u_xlat16_1.x + u_xlat16_1.x;
    u_xlat0.xy = vs_TEXCOORD0.xy * _SourceSize.xy;
    u_xlat0.xy = trunc(u_xlat0.xy);
    u_xlat0.xy = max(u_xlat0.xy, vec2(0.0, 0.0));
    u_xlat8.xy = _SourceSize.xy + vec2(-1.0, -1.0);
    u_xlat0.xy = min(u_xlat8.xy, u_xlat0.xy);
    u_xlatu0.xy =  uvec2(ivec2(u_xlat0.xy));
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat0.xyz = texelFetch(_SourceTex, ivec2(u_xlatu0.xy), int(u_xlatu0.w)).xyz;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat16_1.xyz * _Grain_Params.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat12 = _Grain_Params.y * (-u_xlat16_1.x) + 1.0;
    u_xlat0.xyz = u_xlat2.xyz * vec3(u_xlat12) + u_xlat0.xyz;
    u_xlat16_1.xyz = log2(abs(u_xlat0.xyz));
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_1.xyz = exp2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat0.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb0.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat0.xyzx).xyz;
    SV_Target0.x = (u_xlatb0.x) ? u_xlat16_3.x : u_xlat16_1.x;
    SV_Target0.y = (u_xlatb0.y) ? u_xlat16_3.y : u_xlat16_1.y;
    SV_Target0.z = (u_xlatb0.z) ? u_xlat16_3.z : u_xlat16_1.z;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_USE_DRAW_PROCEDURAL" }
Local Keywords { "_DITHERING" "_FILM_GRAIN" }
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
uniform 	vec2 _Grain_Params;
uniform 	vec4 _Grain_TilingParams;
uniform 	vec4 _Dithering_Params;
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Grain_Texture;
UNITY_LOCATION(2) uniform mediump sampler2D _BlueNoise_Texture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat10_0;
uvec4 u_xlatu0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec2 u_xlat6;
float u_xlat9;
mediump float u_xlat10_9;
bool u_xlatb9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Grain_TilingParams.xy + _Grain_TilingParams.zw;
    u_xlat10_0 = texture(_Grain_Texture, u_xlat0.xy).w;
    u_xlat16_1.x = u_xlat10_0 + -0.5;
    u_xlat16_1.x = u_xlat16_1.x + u_xlat16_1.x;
    u_xlat0.xy = vs_TEXCOORD0.xy * _SourceSize.xy;
    u_xlat0.xy = trunc(u_xlat0.xy);
    u_xlat0.xy = max(u_xlat0.xy, vec2(0.0, 0.0));
    u_xlat6.xy = _SourceSize.xy + vec2(-1.0, -1.0);
    u_xlat0.xy = min(u_xlat6.xy, u_xlat0.xy);
    u_xlatu0.xy =  uvec2(ivec2(u_xlat0.xy));
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat0.xyz = texelFetch(_SourceTex, ivec2(u_xlatu0.xy), int(u_xlatu0.w)).xyz;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat16_1.xyz * _Grain_Params.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat9 = _Grain_Params.y * (-u_xlat16_1.x) + 1.0;
    u_xlat0.xyz = u_xlat2.xyz * vec3(u_xlat9) + u_xlat0.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Dithering_Params.xy + _Dithering_Params.zw;
    u_xlat10_9 = texture(_BlueNoise_Texture, u_xlat2.xy).w;
    u_xlat9 = u_xlat10_9 * 2.0 + -1.0;
    u_xlat2.x = -abs(u_xlat9) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9>=0.0);
#else
    u_xlatb9 = u_xlat9>=0.0;
#endif
    u_xlat9 = (u_xlatb9) ? 1.0 : -1.0;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat9 = u_xlat9 * u_xlat2.x;
    u_xlat0.xyz = vec3(u_xlat9) * vec3(0.00392156886, 0.00392156886, 0.00392156886) + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_USE_DRAW_PROCEDURAL" }
Local Keywords { "_DITHERING" "_FILM_GRAIN" "_LINEAR_TO_SRGB_CONVERSION" }
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
uniform 	vec2 _Grain_Params;
uniform 	vec4 _Grain_TilingParams;
uniform 	vec4 _Dithering_Params;
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Grain_Texture;
UNITY_LOCATION(2) uniform mediump sampler2D _BlueNoise_Texture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat10_0;
uvec4 u_xlatu0;
bvec3 u_xlatb0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
float u_xlat4;
vec2 u_xlat8;
float u_xlat12;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Grain_TilingParams.xy + _Grain_TilingParams.zw;
    u_xlat10_0 = texture(_Grain_Texture, u_xlat0.xy).w;
    u_xlat16_1.x = u_xlat10_0 + -0.5;
    u_xlat16_1.x = u_xlat16_1.x + u_xlat16_1.x;
    u_xlat0.xy = vs_TEXCOORD0.xy * _SourceSize.xy;
    u_xlat0.xy = trunc(u_xlat0.xy);
    u_xlat0.xy = max(u_xlat0.xy, vec2(0.0, 0.0));
    u_xlat8.xy = _SourceSize.xy + vec2(-1.0, -1.0);
    u_xlat0.xy = min(u_xlat8.xy, u_xlat0.xy);
    u_xlatu0.xy =  uvec2(ivec2(u_xlat0.xy));
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat0.xyz = texelFetch(_SourceTex, ivec2(u_xlatu0.xy), int(u_xlatu0.w)).xyz;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat16_1.xyz * _Grain_Params.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat12 = _Grain_Params.y * (-u_xlat16_1.x) + 1.0;
    u_xlat0.xyz = u_xlat2.xyz * vec3(u_xlat12) + u_xlat0.xyz;
    u_xlat16_1.xyz = log2(abs(u_xlat0.xyz));
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_1.xyz = exp2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat0.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb0.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat0.xyzx).xyz;
    {
        vec3 hlslcc_movcTemp = u_xlat16_1;
        hlslcc_movcTemp.x = (u_xlatb0.x) ? u_xlat16_3.x : u_xlat16_1.x;
        hlslcc_movcTemp.y = (u_xlatb0.y) ? u_xlat16_3.y : u_xlat16_1.y;
        hlslcc_movcTemp.z = (u_xlatb0.z) ? u_xlat16_3.z : u_xlat16_1.z;
        u_xlat16_1 = hlslcc_movcTemp;
    }
    u_xlat0.xy = vs_TEXCOORD0.xy * _Dithering_Params.xy + _Dithering_Params.zw;
    u_xlat10_0 = texture(_BlueNoise_Texture, u_xlat0.xy).w;
    u_xlat0.x = u_xlat10_0 * 2.0 + -1.0;
    u_xlat4 = -abs(u_xlat0.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat0.x>=0.0);
#else
    u_xlatb0.x = u_xlat0.x>=0.0;
#endif
    u_xlat0.x = (u_xlatb0.x) ? 1.0 : -1.0;
    u_xlat4 = sqrt(u_xlat4);
    u_xlat4 = (-u_xlat4) + 1.0;
    u_xlat0.x = u_xlat4 * u_xlat0.x;
    u_xlat0.xyz = u_xlat0.xxx * vec3(0.00392156886, 0.00392156886, 0.00392156886) + u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_USE_DRAW_PROCEDURAL" }
Local Keywords { "_FXAA" }
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
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
uvec4 u_xlatu0;
vec3 u_xlat1;
uvec4 u_xlatu1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat10_2;
ivec4 u_xlati2;
uvec4 u_xlatu2;
vec4 u_xlat3;
mediump vec3 u_xlat10_3;
ivec4 u_xlati3;
uvec4 u_xlatu3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
bool u_xlatb10;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump float u_xlat16_23;
mediump float u_xlat16_32;
mediump float u_xlat16_34;
void main()
{
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat1.xy = vs_TEXCOORD0.xy * _SourceSize.xy;
    u_xlati2 = ivec4(u_xlat1.xyxy);
    u_xlat1.xy = trunc(u_xlat1.xy);
    u_xlat1.xy = max(u_xlat1.xy, vec2(0.0, 0.0));
    u_xlati3 = u_xlati2.zwzw + ivec4(int(0xFFFFFFFFu), int(0xFFFFFFFFu), 1, int(0xFFFFFFFFu));
    u_xlati2 = u_xlati2 + ivec4(int(0xFFFFFFFFu), 1, 1, 1);
    u_xlat2 = vec4(u_xlati2);
    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat3 = vec4(u_xlati3);
    u_xlat3 = max(u_xlat3, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat4 = _SourceSize.xyxy + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat3 = min(u_xlat3, u_xlat4);
    u_xlatu3 =  uvec4(ivec4(u_xlat3.zwxy));
    u_xlatu0.xy = u_xlatu3.zw;
    u_xlat0.xyz = texelFetch(_SourceTex, ivec2(u_xlatu0.xy), int(u_xlatu0.w)).xyz;
    u_xlat16_5.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.x = dot(u_xlat16_5.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat0 = min(u_xlat2, u_xlat4);
    u_xlat1.xy = min(u_xlat1.xy, u_xlat4.xy);
    u_xlatu1.xy =  uvec2(ivec2(u_xlat1.xy));
    u_xlatu0 =  uvec4(ivec4(u_xlat0.zwxy));
    u_xlatu2.xy = u_xlatu0.zw;
    u_xlatu2.z = uint(uint(0u));
    u_xlatu2.w = uint(uint(0u));
    u_xlat2.xyz = texelFetch(_SourceTex, ivec2(u_xlatu2.xy), int(u_xlatu2.w)).xyz;
    u_xlat16_14.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_14.x = dot(u_xlat16_14.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_23 = u_xlat16_14.x + u_xlat16_5.x;
    u_xlatu3.z = uint(uint(0u));
    u_xlatu3.w = uint(uint(0u));
    u_xlat2.xyz = texelFetch(_SourceTex, ivec2(u_xlatu3.xy), int(u_xlatu3.w)).xyz;
    u_xlat16_6.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_32 = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat0.xyz = texelFetch(_SourceTex, ivec2(u_xlatu0.xy), int(u_xlatu0.w)).xyz;
    u_xlat16_6.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.x = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_15.x = u_xlat16_32 + u_xlat16_6.x;
    u_xlat16_0.yw = vec2(u_xlat16_23) + (-u_xlat16_15.xx);
    u_xlat16_23 = u_xlat16_32 + u_xlat16_5.x;
    u_xlat16_15.x = u_xlat16_14.x + u_xlat16_6.x;
    u_xlat16_15.x = u_xlat16_23 + (-u_xlat16_15.x);
    u_xlat16_23 = u_xlat16_14.x + u_xlat16_23;
    u_xlat16_23 = u_xlat16_6.x + u_xlat16_23;
    u_xlat16_23 = u_xlat16_23 * 0.03125;
    u_xlat16_23 = max(u_xlat16_23, 0.0078125);
    u_xlat2.x = min(abs(u_xlat16_0.w), abs(u_xlat16_15.x));
    u_xlat16_0.xz = (-u_xlat16_15.xx);
    u_xlat2.x = u_xlat16_23 + u_xlat2.x;
    u_xlat2.x = float(1.0) / float(u_xlat2.x);
    u_xlat0 = u_xlat16_0 * u_xlat2.xxxx;
    u_xlat0 = max(u_xlat0, vec4(-8.0, -8.0, -8.0, -8.0));
    u_xlat0 = min(u_xlat0, vec4(8.0, 8.0, 8.0, 8.0));
    u_xlat0 = u_xlat0 * _SourceSize.zwzw;
    u_xlat2 = u_xlat0.zwzw * vec4(-0.5, -0.5, -0.166666672, -0.166666672) + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0 * vec4(0.166666672, 0.166666672, 0.5, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_3.xyz = texture(_SourceTex, u_xlat2.xy).xyz;
    u_xlat10_2.xyz = texture(_SourceTex, u_xlat2.zw).xyz;
    u_xlat16_15.xyz = u_xlat10_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.xyz = min(max(u_xlat16_15.xyz, 0.0), 1.0);
#else
    u_xlat16_15.xyz = clamp(u_xlat16_15.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat10_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat10_2.xyz = texture(_SourceTex, u_xlat0.zw).xyz;
    u_xlat10_3.xyz = texture(_SourceTex, u_xlat0.xy).xyz;
    u_xlat16_8.xyz = u_xlat10_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_15.xyz = u_xlat16_15.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat10_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_7.xyz + u_xlat16_8.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_7.xyz = u_xlat16_15.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_7.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_23 = dot(u_xlat16_7.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_34 = min(u_xlat16_14.x, u_xlat16_32);
    u_xlat16_14.x = max(u_xlat16_14.x, u_xlat16_32);
    u_xlat16_14.x = max(u_xlat16_6.x, u_xlat16_14.x);
    u_xlat16_32 = min(u_xlat16_6.x, u_xlat16_34);
    u_xlatu1.z = uint(uint(0u));
    u_xlatu1.w = uint(uint(0u));
    u_xlat1.xyz = texelFetch(_SourceTex, ivec2(u_xlatu1.xy), int(u_xlatu1.w)).xyz;
    u_xlat16_8.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.x = dot(u_xlat16_8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_34 = min(u_xlat16_5.x, u_xlat16_6.x);
    u_xlat16_5.x = max(u_xlat16_5.x, u_xlat16_6.x);
    u_xlat16_5.x = max(u_xlat16_14.x, u_xlat16_5.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_5.x<u_xlat16_23);
#else
    u_xlatb1 = u_xlat16_5.x<u_xlat16_23;
#endif
    u_xlat16_5.x = min(u_xlat16_32, u_xlat16_34);
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat16_23<u_xlat16_5.x);
#else
    u_xlatb10 = u_xlat16_23<u_xlat16_5.x;
#endif
    u_xlatb1 = u_xlatb1 || u_xlatb10;
    SV_Target0.xyz = (bool(u_xlatb1)) ? u_xlat16_15.xyz : u_xlat16_7.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_USE_DRAW_PROCEDURAL" }
Local Keywords { "_FXAA" "_LINEAR_TO_SRGB_CONVERSION" }
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
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
uvec4 u_xlatu0;
vec3 u_xlat1;
uvec4 u_xlatu1;
bvec3 u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat10_2;
ivec4 u_xlati2;
uvec4 u_xlatu2;
vec4 u_xlat3;
mediump vec3 u_xlat10_3;
ivec4 u_xlati3;
uvec4 u_xlatu3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
bool u_xlatb10;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump float u_xlat16_23;
mediump float u_xlat16_32;
mediump float u_xlat16_34;
void main()
{
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat1.xy = vs_TEXCOORD0.xy * _SourceSize.xy;
    u_xlati2 = ivec4(u_xlat1.xyxy);
    u_xlat1.xy = trunc(u_xlat1.xy);
    u_xlat1.xy = max(u_xlat1.xy, vec2(0.0, 0.0));
    u_xlati3 = u_xlati2.zwzw + ivec4(int(0xFFFFFFFFu), int(0xFFFFFFFFu), 1, int(0xFFFFFFFFu));
    u_xlati2 = u_xlati2 + ivec4(int(0xFFFFFFFFu), 1, 1, 1);
    u_xlat2 = vec4(u_xlati2);
    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat3 = vec4(u_xlati3);
    u_xlat3 = max(u_xlat3, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat4 = _SourceSize.xyxy + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat3 = min(u_xlat3, u_xlat4);
    u_xlatu3 =  uvec4(ivec4(u_xlat3.zwxy));
    u_xlatu0.xy = u_xlatu3.zw;
    u_xlat0.xyz = texelFetch(_SourceTex, ivec2(u_xlatu0.xy), int(u_xlatu0.w)).xyz;
    u_xlat16_5.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.x = dot(u_xlat16_5.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat0 = min(u_xlat2, u_xlat4);
    u_xlat1.xy = min(u_xlat1.xy, u_xlat4.xy);
    u_xlatu1.xy =  uvec2(ivec2(u_xlat1.xy));
    u_xlatu0 =  uvec4(ivec4(u_xlat0.zwxy));
    u_xlatu2.xy = u_xlatu0.zw;
    u_xlatu2.z = uint(uint(0u));
    u_xlatu2.w = uint(uint(0u));
    u_xlat2.xyz = texelFetch(_SourceTex, ivec2(u_xlatu2.xy), int(u_xlatu2.w)).xyz;
    u_xlat16_14.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_14.x = dot(u_xlat16_14.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_23 = u_xlat16_14.x + u_xlat16_5.x;
    u_xlatu3.z = uint(uint(0u));
    u_xlatu3.w = uint(uint(0u));
    u_xlat2.xyz = texelFetch(_SourceTex, ivec2(u_xlatu3.xy), int(u_xlatu3.w)).xyz;
    u_xlat16_6.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_32 = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat0.xyz = texelFetch(_SourceTex, ivec2(u_xlatu0.xy), int(u_xlatu0.w)).xyz;
    u_xlat16_6.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.x = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_15.x = u_xlat16_32 + u_xlat16_6.x;
    u_xlat16_0.yw = vec2(u_xlat16_23) + (-u_xlat16_15.xx);
    u_xlat16_23 = u_xlat16_32 + u_xlat16_5.x;
    u_xlat16_15.x = u_xlat16_14.x + u_xlat16_6.x;
    u_xlat16_15.x = u_xlat16_23 + (-u_xlat16_15.x);
    u_xlat16_23 = u_xlat16_14.x + u_xlat16_23;
    u_xlat16_23 = u_xlat16_6.x + u_xlat16_23;
    u_xlat16_23 = u_xlat16_23 * 0.03125;
    u_xlat16_23 = max(u_xlat16_23, 0.0078125);
    u_xlat2.x = min(abs(u_xlat16_0.w), abs(u_xlat16_15.x));
    u_xlat16_0.xz = (-u_xlat16_15.xx);
    u_xlat2.x = u_xlat16_23 + u_xlat2.x;
    u_xlat2.x = float(1.0) / float(u_xlat2.x);
    u_xlat0 = u_xlat16_0 * u_xlat2.xxxx;
    u_xlat0 = max(u_xlat0, vec4(-8.0, -8.0, -8.0, -8.0));
    u_xlat0 = min(u_xlat0, vec4(8.0, 8.0, 8.0, 8.0));
    u_xlat0 = u_xlat0 * _SourceSize.zwzw;
    u_xlat2 = u_xlat0.zwzw * vec4(-0.5, -0.5, -0.166666672, -0.166666672) + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0 * vec4(0.166666672, 0.166666672, 0.5, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_3.xyz = texture(_SourceTex, u_xlat2.xy).xyz;
    u_xlat10_2.xyz = texture(_SourceTex, u_xlat2.zw).xyz;
    u_xlat16_15.xyz = u_xlat10_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.xyz = min(max(u_xlat16_15.xyz, 0.0), 1.0);
#else
    u_xlat16_15.xyz = clamp(u_xlat16_15.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat10_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat10_2.xyz = texture(_SourceTex, u_xlat0.zw).xyz;
    u_xlat10_3.xyz = texture(_SourceTex, u_xlat0.xy).xyz;
    u_xlat16_8.xyz = u_xlat10_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_15.xyz = u_xlat16_15.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat10_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_7.xyz + u_xlat16_8.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_7.xyz = u_xlat16_15.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_7.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_23 = dot(u_xlat16_7.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_34 = min(u_xlat16_14.x, u_xlat16_32);
    u_xlat16_14.x = max(u_xlat16_14.x, u_xlat16_32);
    u_xlat16_14.x = max(u_xlat16_6.x, u_xlat16_14.x);
    u_xlat16_32 = min(u_xlat16_6.x, u_xlat16_34);
    u_xlatu1.z = uint(uint(0u));
    u_xlatu1.w = uint(uint(0u));
    u_xlat1.xyz = texelFetch(_SourceTex, ivec2(u_xlatu1.xy), int(u_xlatu1.w)).xyz;
    u_xlat16_8.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.x = dot(u_xlat16_8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_34 = min(u_xlat16_5.x, u_xlat16_6.x);
    u_xlat16_5.x = max(u_xlat16_5.x, u_xlat16_6.x);
    u_xlat16_5.x = max(u_xlat16_14.x, u_xlat16_5.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(u_xlat16_5.x<u_xlat16_23);
#else
    u_xlatb1.x = u_xlat16_5.x<u_xlat16_23;
#endif
    u_xlat16_5.x = min(u_xlat16_32, u_xlat16_34);
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat16_23<u_xlat16_5.x);
#else
    u_xlatb10 = u_xlat16_23<u_xlat16_5.x;
#endif
    u_xlatb1.x = u_xlatb1.x || u_xlatb10;
    u_xlat16_5.xyz = (u_xlatb1.x) ? u_xlat16_15.xyz : u_xlat16_7.xyz;
    u_xlat16_6.xyz = log2(u_xlat16_5.xyz);
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_6.xyz = exp2(u_xlat16_6.xyz);
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_7.xyz = u_xlat16_5.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb1.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_5.xyzx).xyz;
    SV_Target0.x = (u_xlatb1.x) ? u_xlat16_7.x : u_xlat16_6.x;
    SV_Target0.y = (u_xlatb1.y) ? u_xlat16_7.y : u_xlat16_6.y;
    SV_Target0.z = (u_xlatb1.z) ? u_xlat16_7.z : u_xlat16_6.z;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_USE_DRAW_PROCEDURAL" }
Local Keywords { "_DITHERING" "_FXAA" }
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
uniform 	vec4 _Dithering_Params;
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
UNITY_LOCATION(1) uniform mediump sampler2D _BlueNoise_Texture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
uvec4 u_xlatu0;
vec3 u_xlat1;
mediump float u_xlat10_1;
uvec4 u_xlatu1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat10_2;
ivec4 u_xlati2;
uvec4 u_xlatu2;
vec4 u_xlat3;
mediump vec3 u_xlat10_3;
ivec4 u_xlati3;
uvec4 u_xlatu3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
float u_xlat10;
bool u_xlatb10;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump float u_xlat16_23;
mediump float u_xlat16_32;
mediump float u_xlat16_34;
void main()
{
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat1.xy = vs_TEXCOORD0.xy * _SourceSize.xy;
    u_xlati2 = ivec4(u_xlat1.xyxy);
    u_xlat1.xy = trunc(u_xlat1.xy);
    u_xlat1.xy = max(u_xlat1.xy, vec2(0.0, 0.0));
    u_xlati3 = u_xlati2.zwzw + ivec4(int(0xFFFFFFFFu), int(0xFFFFFFFFu), 1, int(0xFFFFFFFFu));
    u_xlati2 = u_xlati2 + ivec4(int(0xFFFFFFFFu), 1, 1, 1);
    u_xlat2 = vec4(u_xlati2);
    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat3 = vec4(u_xlati3);
    u_xlat3 = max(u_xlat3, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat4 = _SourceSize.xyxy + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat3 = min(u_xlat3, u_xlat4);
    u_xlatu3 =  uvec4(ivec4(u_xlat3.zwxy));
    u_xlatu0.xy = u_xlatu3.zw;
    u_xlat0.xyz = texelFetch(_SourceTex, ivec2(u_xlatu0.xy), int(u_xlatu0.w)).xyz;
    u_xlat16_5.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.x = dot(u_xlat16_5.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat0 = min(u_xlat2, u_xlat4);
    u_xlat1.xy = min(u_xlat1.xy, u_xlat4.xy);
    u_xlatu1.xy =  uvec2(ivec2(u_xlat1.xy));
    u_xlatu0 =  uvec4(ivec4(u_xlat0.zwxy));
    u_xlatu2.xy = u_xlatu0.zw;
    u_xlatu2.z = uint(uint(0u));
    u_xlatu2.w = uint(uint(0u));
    u_xlat2.xyz = texelFetch(_SourceTex, ivec2(u_xlatu2.xy), int(u_xlatu2.w)).xyz;
    u_xlat16_14.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_14.x = dot(u_xlat16_14.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_23 = u_xlat16_14.x + u_xlat16_5.x;
    u_xlatu3.z = uint(uint(0u));
    u_xlatu3.w = uint(uint(0u));
    u_xlat2.xyz = texelFetch(_SourceTex, ivec2(u_xlatu3.xy), int(u_xlatu3.w)).xyz;
    u_xlat16_6.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_32 = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat0.xyz = texelFetch(_SourceTex, ivec2(u_xlatu0.xy), int(u_xlatu0.w)).xyz;
    u_xlat16_6.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.x = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_15.x = u_xlat16_32 + u_xlat16_6.x;
    u_xlat16_0.yw = vec2(u_xlat16_23) + (-u_xlat16_15.xx);
    u_xlat16_23 = u_xlat16_32 + u_xlat16_5.x;
    u_xlat16_15.x = u_xlat16_14.x + u_xlat16_6.x;
    u_xlat16_15.x = u_xlat16_23 + (-u_xlat16_15.x);
    u_xlat16_23 = u_xlat16_14.x + u_xlat16_23;
    u_xlat16_23 = u_xlat16_6.x + u_xlat16_23;
    u_xlat16_23 = u_xlat16_23 * 0.03125;
    u_xlat16_23 = max(u_xlat16_23, 0.0078125);
    u_xlat2.x = min(abs(u_xlat16_0.w), abs(u_xlat16_15.x));
    u_xlat16_0.xz = (-u_xlat16_15.xx);
    u_xlat2.x = u_xlat16_23 + u_xlat2.x;
    u_xlat2.x = float(1.0) / float(u_xlat2.x);
    u_xlat0 = u_xlat16_0 * u_xlat2.xxxx;
    u_xlat0 = max(u_xlat0, vec4(-8.0, -8.0, -8.0, -8.0));
    u_xlat0 = min(u_xlat0, vec4(8.0, 8.0, 8.0, 8.0));
    u_xlat0 = u_xlat0 * _SourceSize.zwzw;
    u_xlat2 = u_xlat0.zwzw * vec4(-0.5, -0.5, -0.166666672, -0.166666672) + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0 * vec4(0.166666672, 0.166666672, 0.5, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_3.xyz = texture(_SourceTex, u_xlat2.xy).xyz;
    u_xlat10_2.xyz = texture(_SourceTex, u_xlat2.zw).xyz;
    u_xlat16_15.xyz = u_xlat10_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.xyz = min(max(u_xlat16_15.xyz, 0.0), 1.0);
#else
    u_xlat16_15.xyz = clamp(u_xlat16_15.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat10_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat10_2.xyz = texture(_SourceTex, u_xlat0.zw).xyz;
    u_xlat10_3.xyz = texture(_SourceTex, u_xlat0.xy).xyz;
    u_xlat16_8.xyz = u_xlat10_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_15.xyz = u_xlat16_15.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat10_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_7.xyz + u_xlat16_8.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_7.xyz = u_xlat16_15.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_7.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_23 = dot(u_xlat16_7.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_34 = min(u_xlat16_14.x, u_xlat16_32);
    u_xlat16_14.x = max(u_xlat16_14.x, u_xlat16_32);
    u_xlat16_14.x = max(u_xlat16_6.x, u_xlat16_14.x);
    u_xlat16_32 = min(u_xlat16_6.x, u_xlat16_34);
    u_xlatu1.z = uint(uint(0u));
    u_xlatu1.w = uint(uint(0u));
    u_xlat1.xyz = texelFetch(_SourceTex, ivec2(u_xlatu1.xy), int(u_xlatu1.w)).xyz;
    u_xlat16_8.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.x = dot(u_xlat16_8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_34 = min(u_xlat16_5.x, u_xlat16_6.x);
    u_xlat16_5.x = max(u_xlat16_5.x, u_xlat16_6.x);
    u_xlat16_5.x = max(u_xlat16_14.x, u_xlat16_5.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_5.x<u_xlat16_23);
#else
    u_xlatb1 = u_xlat16_5.x<u_xlat16_23;
#endif
    u_xlat16_5.x = min(u_xlat16_32, u_xlat16_34);
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat16_23<u_xlat16_5.x);
#else
    u_xlatb10 = u_xlat16_23<u_xlat16_5.x;
#endif
    u_xlatb1 = u_xlatb1 || u_xlatb10;
    u_xlat16_5.xyz = (bool(u_xlatb1)) ? u_xlat16_15.xyz : u_xlat16_7.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Dithering_Params.xy + _Dithering_Params.zw;
    u_xlat10_1 = texture(_BlueNoise_Texture, u_xlat1.xy).w;
    u_xlat1.x = u_xlat10_1 * 2.0 + -1.0;
    u_xlat10 = -abs(u_xlat1.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x>=0.0);
#else
    u_xlatb1 = u_xlat1.x>=0.0;
#endif
    u_xlat1.x = (u_xlatb1) ? 1.0 : -1.0;
    u_xlat10 = sqrt(u_xlat10);
    u_xlat10 = (-u_xlat10) + 1.0;
    u_xlat1.x = u_xlat10 * u_xlat1.x;
    u_xlat1.xyz = u_xlat1.xxx * vec3(0.00392156886, 0.00392156886, 0.00392156886) + u_xlat16_5.xyz;
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_USE_DRAW_PROCEDURAL" }
Local Keywords { "_DITHERING" "_FXAA" "_LINEAR_TO_SRGB_CONVERSION" }
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
uniform 	vec4 _Dithering_Params;
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
UNITY_LOCATION(1) uniform mediump sampler2D _BlueNoise_Texture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
uvec4 u_xlatu0;
vec3 u_xlat1;
mediump float u_xlat10_1;
uvec4 u_xlatu1;
bvec3 u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat10_2;
ivec4 u_xlati2;
uvec4 u_xlatu2;
vec4 u_xlat3;
mediump vec3 u_xlat10_3;
ivec4 u_xlati3;
uvec4 u_xlatu3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
float u_xlat10;
bool u_xlatb10;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump float u_xlat16_23;
mediump float u_xlat16_32;
mediump float u_xlat16_34;
void main()
{
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat1.xy = vs_TEXCOORD0.xy * _SourceSize.xy;
    u_xlati2 = ivec4(u_xlat1.xyxy);
    u_xlat1.xy = trunc(u_xlat1.xy);
    u_xlat1.xy = max(u_xlat1.xy, vec2(0.0, 0.0));
    u_xlati3 = u_xlati2.zwzw + ivec4(int(0xFFFFFFFFu), int(0xFFFFFFFFu), 1, int(0xFFFFFFFFu));
    u_xlati2 = u_xlati2 + ivec4(int(0xFFFFFFFFu), 1, 1, 1);
    u_xlat2 = vec4(u_xlati2);
    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat3 = vec4(u_xlati3);
    u_xlat3 = max(u_xlat3, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat4 = _SourceSize.xyxy + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat3 = min(u_xlat3, u_xlat4);
    u_xlatu3 =  uvec4(ivec4(u_xlat3.zwxy));
    u_xlatu0.xy = u_xlatu3.zw;
    u_xlat0.xyz = texelFetch(_SourceTex, ivec2(u_xlatu0.xy), int(u_xlatu0.w)).xyz;
    u_xlat16_5.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.x = dot(u_xlat16_5.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat0 = min(u_xlat2, u_xlat4);
    u_xlat1.xy = min(u_xlat1.xy, u_xlat4.xy);
    u_xlatu1.xy =  uvec2(ivec2(u_xlat1.xy));
    u_xlatu0 =  uvec4(ivec4(u_xlat0.zwxy));
    u_xlatu2.xy = u_xlatu0.zw;
    u_xlatu2.z = uint(uint(0u));
    u_xlatu2.w = uint(uint(0u));
    u_xlat2.xyz = texelFetch(_SourceTex, ivec2(u_xlatu2.xy), int(u_xlatu2.w)).xyz;
    u_xlat16_14.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_14.x = dot(u_xlat16_14.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_23 = u_xlat16_14.x + u_xlat16_5.x;
    u_xlatu3.z = uint(uint(0u));
    u_xlatu3.w = uint(uint(0u));
    u_xlat2.xyz = texelFetch(_SourceTex, ivec2(u_xlatu3.xy), int(u_xlatu3.w)).xyz;
    u_xlat16_6.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_32 = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat0.xyz = texelFetch(_SourceTex, ivec2(u_xlatu0.xy), int(u_xlatu0.w)).xyz;
    u_xlat16_6.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.x = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_15.x = u_xlat16_32 + u_xlat16_6.x;
    u_xlat16_0.yw = vec2(u_xlat16_23) + (-u_xlat16_15.xx);
    u_xlat16_23 = u_xlat16_32 + u_xlat16_5.x;
    u_xlat16_15.x = u_xlat16_14.x + u_xlat16_6.x;
    u_xlat16_15.x = u_xlat16_23 + (-u_xlat16_15.x);
    u_xlat16_23 = u_xlat16_14.x + u_xlat16_23;
    u_xlat16_23 = u_xlat16_6.x + u_xlat16_23;
    u_xlat16_23 = u_xlat16_23 * 0.03125;
    u_xlat16_23 = max(u_xlat16_23, 0.0078125);
    u_xlat2.x = min(abs(u_xlat16_0.w), abs(u_xlat16_15.x));
    u_xlat16_0.xz = (-u_xlat16_15.xx);
    u_xlat2.x = u_xlat16_23 + u_xlat2.x;
    u_xlat2.x = float(1.0) / float(u_xlat2.x);
    u_xlat0 = u_xlat16_0 * u_xlat2.xxxx;
    u_xlat0 = max(u_xlat0, vec4(-8.0, -8.0, -8.0, -8.0));
    u_xlat0 = min(u_xlat0, vec4(8.0, 8.0, 8.0, 8.0));
    u_xlat0 = u_xlat0 * _SourceSize.zwzw;
    u_xlat2 = u_xlat0.zwzw * vec4(-0.5, -0.5, -0.166666672, -0.166666672) + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0 * vec4(0.166666672, 0.166666672, 0.5, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_3.xyz = texture(_SourceTex, u_xlat2.xy).xyz;
    u_xlat10_2.xyz = texture(_SourceTex, u_xlat2.zw).xyz;
    u_xlat16_15.xyz = u_xlat10_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.xyz = min(max(u_xlat16_15.xyz, 0.0), 1.0);
#else
    u_xlat16_15.xyz = clamp(u_xlat16_15.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat10_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat10_2.xyz = texture(_SourceTex, u_xlat0.zw).xyz;
    u_xlat10_3.xyz = texture(_SourceTex, u_xlat0.xy).xyz;
    u_xlat16_8.xyz = u_xlat10_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_15.xyz = u_xlat16_15.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat10_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_7.xyz + u_xlat16_8.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_7.xyz = u_xlat16_15.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_7.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_23 = dot(u_xlat16_7.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_34 = min(u_xlat16_14.x, u_xlat16_32);
    u_xlat16_14.x = max(u_xlat16_14.x, u_xlat16_32);
    u_xlat16_14.x = max(u_xlat16_6.x, u_xlat16_14.x);
    u_xlat16_32 = min(u_xlat16_6.x, u_xlat16_34);
    u_xlatu1.z = uint(uint(0u));
    u_xlatu1.w = uint(uint(0u));
    u_xlat1.xyz = texelFetch(_SourceTex, ivec2(u_xlatu1.xy), int(u_xlatu1.w)).xyz;
    u_xlat16_8.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.x = dot(u_xlat16_8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_34 = min(u_xlat16_5.x, u_xlat16_6.x);
    u_xlat16_5.x = max(u_xlat16_5.x, u_xlat16_6.x);
    u_xlat16_5.x = max(u_xlat16_14.x, u_xlat16_5.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(u_xlat16_5.x<u_xlat16_23);
#else
    u_xlatb1.x = u_xlat16_5.x<u_xlat16_23;
#endif
    u_xlat16_5.x = min(u_xlat16_32, u_xlat16_34);
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat16_23<u_xlat16_5.x);
#else
    u_xlatb10 = u_xlat16_23<u_xlat16_5.x;
#endif
    u_xlatb1.x = u_xlatb1.x || u_xlatb10;
    u_xlat16_5.xyz = (u_xlatb1.x) ? u_xlat16_15.xyz : u_xlat16_7.xyz;
    u_xlat16_6.xyz = log2(u_xlat16_5.xyz);
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_6.xyz = exp2(u_xlat16_6.xyz);
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_7.xyz = u_xlat16_5.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb1.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_5.xyzx).xyz;
    u_xlat16_5.x = (u_xlatb1.x) ? u_xlat16_7.x : u_xlat16_6.x;
    u_xlat16_5.y = (u_xlatb1.y) ? u_xlat16_7.y : u_xlat16_6.y;
    u_xlat16_5.z = (u_xlatb1.z) ? u_xlat16_7.z : u_xlat16_6.z;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Dithering_Params.xy + _Dithering_Params.zw;
    u_xlat10_1 = texture(_BlueNoise_Texture, u_xlat1.xy).w;
    u_xlat1.x = u_xlat10_1 * 2.0 + -1.0;
    u_xlat10 = -abs(u_xlat1.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(u_xlat1.x>=0.0);
#else
    u_xlatb1.x = u_xlat1.x>=0.0;
#endif
    u_xlat1.x = (u_xlatb1.x) ? 1.0 : -1.0;
    u_xlat10 = sqrt(u_xlat10);
    u_xlat10 = (-u_xlat10) + 1.0;
    u_xlat1.x = u_xlat10 * u_xlat1.x;
    u_xlat1.xyz = u_xlat1.xxx * vec3(0.00392156886, 0.00392156886, 0.00392156886) + u_xlat16_5.xyz;
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_USE_DRAW_PROCEDURAL" }
Local Keywords { "_FILM_GRAIN" "_FXAA" }
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
uniform 	vec2 _Grain_Params;
uniform 	vec4 _Grain_TilingParams;
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Grain_Texture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
uvec4 u_xlatu0;
vec3 u_xlat1;
mediump float u_xlat10_1;
uvec4 u_xlatu1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat10_2;
ivec4 u_xlati2;
uvec4 u_xlatu2;
vec4 u_xlat3;
mediump vec3 u_xlat10_3;
ivec4 u_xlati3;
uvec4 u_xlatu3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
bool u_xlatb10;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump float u_xlat16_23;
float u_xlat28;
mediump float u_xlat16_32;
mediump float u_xlat16_34;
void main()
{
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat1.xy = vs_TEXCOORD0.xy * _SourceSize.xy;
    u_xlati2 = ivec4(u_xlat1.xyxy);
    u_xlat1.xy = trunc(u_xlat1.xy);
    u_xlat1.xy = max(u_xlat1.xy, vec2(0.0, 0.0));
    u_xlati3 = u_xlati2.zwzw + ivec4(int(0xFFFFFFFFu), int(0xFFFFFFFFu), 1, int(0xFFFFFFFFu));
    u_xlati2 = u_xlati2 + ivec4(int(0xFFFFFFFFu), 1, 1, 1);
    u_xlat2 = vec4(u_xlati2);
    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat3 = vec4(u_xlati3);
    u_xlat3 = max(u_xlat3, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat4 = _SourceSize.xyxy + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat3 = min(u_xlat3, u_xlat4);
    u_xlatu3 =  uvec4(ivec4(u_xlat3.zwxy));
    u_xlatu0.xy = u_xlatu3.zw;
    u_xlat0.xyz = texelFetch(_SourceTex, ivec2(u_xlatu0.xy), int(u_xlatu0.w)).xyz;
    u_xlat16_5.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.x = dot(u_xlat16_5.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat0 = min(u_xlat2, u_xlat4);
    u_xlat1.xy = min(u_xlat1.xy, u_xlat4.xy);
    u_xlatu1.xy =  uvec2(ivec2(u_xlat1.xy));
    u_xlatu0 =  uvec4(ivec4(u_xlat0.zwxy));
    u_xlatu2.xy = u_xlatu0.zw;
    u_xlatu2.z = uint(uint(0u));
    u_xlatu2.w = uint(uint(0u));
    u_xlat2.xyz = texelFetch(_SourceTex, ivec2(u_xlatu2.xy), int(u_xlatu2.w)).xyz;
    u_xlat16_14.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_14.x = dot(u_xlat16_14.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_23 = u_xlat16_14.x + u_xlat16_5.x;
    u_xlatu3.z = uint(uint(0u));
    u_xlatu3.w = uint(uint(0u));
    u_xlat2.xyz = texelFetch(_SourceTex, ivec2(u_xlatu3.xy), int(u_xlatu3.w)).xyz;
    u_xlat16_6.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_32 = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat0.xyz = texelFetch(_SourceTex, ivec2(u_xlatu0.xy), int(u_xlatu0.w)).xyz;
    u_xlat16_6.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.x = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_15.x = u_xlat16_32 + u_xlat16_6.x;
    u_xlat16_0.yw = vec2(u_xlat16_23) + (-u_xlat16_15.xx);
    u_xlat16_23 = u_xlat16_32 + u_xlat16_5.x;
    u_xlat16_15.x = u_xlat16_14.x + u_xlat16_6.x;
    u_xlat16_15.x = u_xlat16_23 + (-u_xlat16_15.x);
    u_xlat16_23 = u_xlat16_14.x + u_xlat16_23;
    u_xlat16_23 = u_xlat16_6.x + u_xlat16_23;
    u_xlat16_23 = u_xlat16_23 * 0.03125;
    u_xlat16_23 = max(u_xlat16_23, 0.0078125);
    u_xlat2.x = min(abs(u_xlat16_0.w), abs(u_xlat16_15.x));
    u_xlat16_0.xz = (-u_xlat16_15.xx);
    u_xlat2.x = u_xlat16_23 + u_xlat2.x;
    u_xlat2.x = float(1.0) / float(u_xlat2.x);
    u_xlat0 = u_xlat16_0 * u_xlat2.xxxx;
    u_xlat0 = max(u_xlat0, vec4(-8.0, -8.0, -8.0, -8.0));
    u_xlat0 = min(u_xlat0, vec4(8.0, 8.0, 8.0, 8.0));
    u_xlat0 = u_xlat0 * _SourceSize.zwzw;
    u_xlat2 = u_xlat0.zwzw * vec4(-0.5, -0.5, -0.166666672, -0.166666672) + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0 * vec4(0.166666672, 0.166666672, 0.5, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_3.xyz = texture(_SourceTex, u_xlat2.xy).xyz;
    u_xlat10_2.xyz = texture(_SourceTex, u_xlat2.zw).xyz;
    u_xlat16_15.xyz = u_xlat10_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.xyz = min(max(u_xlat16_15.xyz, 0.0), 1.0);
#else
    u_xlat16_15.xyz = clamp(u_xlat16_15.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat10_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat10_2.xyz = texture(_SourceTex, u_xlat0.zw).xyz;
    u_xlat10_3.xyz = texture(_SourceTex, u_xlat0.xy).xyz;
    u_xlat16_8.xyz = u_xlat10_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_15.xyz = u_xlat16_15.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat10_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_7.xyz + u_xlat16_8.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_7.xyz = u_xlat16_15.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_7.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_23 = dot(u_xlat16_7.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_34 = min(u_xlat16_14.x, u_xlat16_32);
    u_xlat16_14.x = max(u_xlat16_14.x, u_xlat16_32);
    u_xlat16_14.x = max(u_xlat16_6.x, u_xlat16_14.x);
    u_xlat16_32 = min(u_xlat16_6.x, u_xlat16_34);
    u_xlatu1.z = uint(uint(0u));
    u_xlatu1.w = uint(uint(0u));
    u_xlat1.xyz = texelFetch(_SourceTex, ivec2(u_xlatu1.xy), int(u_xlatu1.w)).xyz;
    u_xlat16_8.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.x = dot(u_xlat16_8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_34 = min(u_xlat16_5.x, u_xlat16_6.x);
    u_xlat16_5.x = max(u_xlat16_5.x, u_xlat16_6.x);
    u_xlat16_5.x = max(u_xlat16_14.x, u_xlat16_5.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_5.x<u_xlat16_23);
#else
    u_xlatb1 = u_xlat16_5.x<u_xlat16_23;
#endif
    u_xlat16_5.x = min(u_xlat16_32, u_xlat16_34);
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat16_23<u_xlat16_5.x);
#else
    u_xlatb10 = u_xlat16_23<u_xlat16_5.x;
#endif
    u_xlatb1 = u_xlatb1 || u_xlatb10;
    u_xlat16_5.xyz = (bool(u_xlatb1)) ? u_xlat16_15.xyz : u_xlat16_7.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Grain_TilingParams.xy + _Grain_TilingParams.zw;
    u_xlat10_1 = texture(_Grain_Texture, u_xlat1.xy).w;
    u_xlat16_32 = u_xlat10_1 + -0.5;
    u_xlat16_32 = u_xlat16_32 + u_xlat16_32;
    u_xlat16_6.xyz = vec3(u_xlat16_32) * u_xlat16_5.xyz;
    u_xlat1.xyz = u_xlat16_6.xyz * _Grain_Params.xxx;
    u_xlat16_32 = dot(u_xlat16_5.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_32 = sqrt(u_xlat16_32);
    u_xlat28 = _Grain_Params.y * (-u_xlat16_32) + 1.0;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat28) + u_xlat16_5.xyz;
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_USE_DRAW_PROCEDURAL" }
Local Keywords { "_FILM_GRAIN" "_FXAA" "_LINEAR_TO_SRGB_CONVERSION" }
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
uniform 	vec2 _Grain_Params;
uniform 	vec4 _Grain_TilingParams;
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Grain_Texture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
uvec4 u_xlatu0;
vec3 u_xlat1;
mediump float u_xlat10_1;
uvec4 u_xlatu1;
bvec3 u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat10_2;
ivec4 u_xlati2;
uvec4 u_xlatu2;
vec4 u_xlat3;
mediump vec3 u_xlat10_3;
ivec4 u_xlati3;
uvec4 u_xlatu3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
bool u_xlatb10;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump float u_xlat16_23;
float u_xlat28;
mediump float u_xlat16_32;
mediump float u_xlat16_34;
void main()
{
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat1.xy = vs_TEXCOORD0.xy * _SourceSize.xy;
    u_xlati2 = ivec4(u_xlat1.xyxy);
    u_xlat1.xy = trunc(u_xlat1.xy);
    u_xlat1.xy = max(u_xlat1.xy, vec2(0.0, 0.0));
    u_xlati3 = u_xlati2.zwzw + ivec4(int(0xFFFFFFFFu), int(0xFFFFFFFFu), 1, int(0xFFFFFFFFu));
    u_xlati2 = u_xlati2 + ivec4(int(0xFFFFFFFFu), 1, 1, 1);
    u_xlat2 = vec4(u_xlati2);
    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat3 = vec4(u_xlati3);
    u_xlat3 = max(u_xlat3, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat4 = _SourceSize.xyxy + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat3 = min(u_xlat3, u_xlat4);
    u_xlatu3 =  uvec4(ivec4(u_xlat3.zwxy));
    u_xlatu0.xy = u_xlatu3.zw;
    u_xlat0.xyz = texelFetch(_SourceTex, ivec2(u_xlatu0.xy), int(u_xlatu0.w)).xyz;
    u_xlat16_5.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.x = dot(u_xlat16_5.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat0 = min(u_xlat2, u_xlat4);
    u_xlat1.xy = min(u_xlat1.xy, u_xlat4.xy);
    u_xlatu1.xy =  uvec2(ivec2(u_xlat1.xy));
    u_xlatu0 =  uvec4(ivec4(u_xlat0.zwxy));
    u_xlatu2.xy = u_xlatu0.zw;
    u_xlatu2.z = uint(uint(0u));
    u_xlatu2.w = uint(uint(0u));
    u_xlat2.xyz = texelFetch(_SourceTex, ivec2(u_xlatu2.xy), int(u_xlatu2.w)).xyz;
    u_xlat16_14.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_14.x = dot(u_xlat16_14.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_23 = u_xlat16_14.x + u_xlat16_5.x;
    u_xlatu3.z = uint(uint(0u));
    u_xlatu3.w = uint(uint(0u));
    u_xlat2.xyz = texelFetch(_SourceTex, ivec2(u_xlatu3.xy), int(u_xlatu3.w)).xyz;
    u_xlat16_6.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_32 = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat0.xyz = texelFetch(_SourceTex, ivec2(u_xlatu0.xy), int(u_xlatu0.w)).xyz;
    u_xlat16_6.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.x = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_15.x = u_xlat16_32 + u_xlat16_6.x;
    u_xlat16_0.yw = vec2(u_xlat16_23) + (-u_xlat16_15.xx);
    u_xlat16_23 = u_xlat16_32 + u_xlat16_5.x;
    u_xlat16_15.x = u_xlat16_14.x + u_xlat16_6.x;
    u_xlat16_15.x = u_xlat16_23 + (-u_xlat16_15.x);
    u_xlat16_23 = u_xlat16_14.x + u_xlat16_23;
    u_xlat16_23 = u_xlat16_6.x + u_xlat16_23;
    u_xlat16_23 = u_xlat16_23 * 0.03125;
    u_xlat16_23 = max(u_xlat16_23, 0.0078125);
    u_xlat2.x = min(abs(u_xlat16_0.w), abs(u_xlat16_15.x));
    u_xlat16_0.xz = (-u_xlat16_15.xx);
    u_xlat2.x = u_xlat16_23 + u_xlat2.x;
    u_xlat2.x = float(1.0) / float(u_xlat2.x);
    u_xlat0 = u_xlat16_0 * u_xlat2.xxxx;
    u_xlat0 = max(u_xlat0, vec4(-8.0, -8.0, -8.0, -8.0));
    u_xlat0 = min(u_xlat0, vec4(8.0, 8.0, 8.0, 8.0));
    u_xlat0 = u_xlat0 * _SourceSize.zwzw;
    u_xlat2 = u_xlat0.zwzw * vec4(-0.5, -0.5, -0.166666672, -0.166666672) + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0 * vec4(0.166666672, 0.166666672, 0.5, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_3.xyz = texture(_SourceTex, u_xlat2.xy).xyz;
    u_xlat10_2.xyz = texture(_SourceTex, u_xlat2.zw).xyz;
    u_xlat16_15.xyz = u_xlat10_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.xyz = min(max(u_xlat16_15.xyz, 0.0), 1.0);
#else
    u_xlat16_15.xyz = clamp(u_xlat16_15.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat10_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat10_2.xyz = texture(_SourceTex, u_xlat0.zw).xyz;
    u_xlat10_3.xyz = texture(_SourceTex, u_xlat0.xy).xyz;
    u_xlat16_8.xyz = u_xlat10_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_15.xyz = u_xlat16_15.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat10_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_7.xyz + u_xlat16_8.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_7.xyz = u_xlat16_15.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_7.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_23 = dot(u_xlat16_7.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_34 = min(u_xlat16_14.x, u_xlat16_32);
    u_xlat16_14.x = max(u_xlat16_14.x, u_xlat16_32);
    u_xlat16_14.x = max(u_xlat16_6.x, u_xlat16_14.x);
    u_xlat16_32 = min(u_xlat16_6.x, u_xlat16_34);
    u_xlatu1.z = uint(uint(0u));
    u_xlatu1.w = uint(uint(0u));
    u_xlat1.xyz = texelFetch(_SourceTex, ivec2(u_xlatu1.xy), int(u_xlatu1.w)).xyz;
    u_xlat16_8.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.x = dot(u_xlat16_8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_34 = min(u_xlat16_5.x, u_xlat16_6.x);
    u_xlat16_5.x = max(u_xlat16_5.x, u_xlat16_6.x);
    u_xlat16_5.x = max(u_xlat16_14.x, u_xlat16_5.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(u_xlat16_5.x<u_xlat16_23);
#else
    u_xlatb1.x = u_xlat16_5.x<u_xlat16_23;
#endif
    u_xlat16_5.x = min(u_xlat16_32, u_xlat16_34);
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat16_23<u_xlat16_5.x);
#else
    u_xlatb10 = u_xlat16_23<u_xlat16_5.x;
#endif
    u_xlatb1.x = u_xlatb1.x || u_xlatb10;
    u_xlat16_5.xyz = (u_xlatb1.x) ? u_xlat16_15.xyz : u_xlat16_7.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Grain_TilingParams.xy + _Grain_TilingParams.zw;
    u_xlat10_1 = texture(_Grain_Texture, u_xlat1.xy).w;
    u_xlat16_32 = u_xlat10_1 + -0.5;
    u_xlat16_32 = u_xlat16_32 + u_xlat16_32;
    u_xlat16_6.xyz = vec3(u_xlat16_32) * u_xlat16_5.xyz;
    u_xlat1.xyz = u_xlat16_6.xyz * _Grain_Params.xxx;
    u_xlat16_32 = dot(u_xlat16_5.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_32 = sqrt(u_xlat16_32);
    u_xlat28 = _Grain_Params.y * (-u_xlat16_32) + 1.0;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat28) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = log2(abs(u_xlat1.xyz));
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_5.xyz = exp2(u_xlat16_5.xyz);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_6.xyz = u_xlat1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb1.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat1.xyzx).xyz;
    SV_Target0.x = (u_xlatb1.x) ? u_xlat16_6.x : u_xlat16_5.x;
    SV_Target0.y = (u_xlatb1.y) ? u_xlat16_6.y : u_xlat16_5.y;
    SV_Target0.z = (u_xlatb1.z) ? u_xlat16_6.z : u_xlat16_5.z;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_USE_DRAW_PROCEDURAL" }
Local Keywords { "_DITHERING" "_FILM_GRAIN" "_FXAA" }
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
uniform 	vec2 _Grain_Params;
uniform 	vec4 _Grain_TilingParams;
uniform 	vec4 _Dithering_Params;
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Grain_Texture;
UNITY_LOCATION(2) uniform mediump sampler2D _BlueNoise_Texture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
uvec4 u_xlatu0;
vec3 u_xlat1;
mediump float u_xlat10_1;
uvec4 u_xlatu1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat10_2;
ivec4 u_xlati2;
uvec4 u_xlatu2;
vec4 u_xlat3;
mediump vec3 u_xlat10_3;
ivec4 u_xlati3;
uvec4 u_xlatu3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
bool u_xlatb10;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump float u_xlat16_23;
float u_xlat28;
mediump float u_xlat10_28;
bool u_xlatb28;
mediump float u_xlat16_32;
mediump float u_xlat16_34;
void main()
{
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat1.xy = vs_TEXCOORD0.xy * _SourceSize.xy;
    u_xlati2 = ivec4(u_xlat1.xyxy);
    u_xlat1.xy = trunc(u_xlat1.xy);
    u_xlat1.xy = max(u_xlat1.xy, vec2(0.0, 0.0));
    u_xlati3 = u_xlati2.zwzw + ivec4(int(0xFFFFFFFFu), int(0xFFFFFFFFu), 1, int(0xFFFFFFFFu));
    u_xlati2 = u_xlati2 + ivec4(int(0xFFFFFFFFu), 1, 1, 1);
    u_xlat2 = vec4(u_xlati2);
    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat3 = vec4(u_xlati3);
    u_xlat3 = max(u_xlat3, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat4 = _SourceSize.xyxy + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat3 = min(u_xlat3, u_xlat4);
    u_xlatu3 =  uvec4(ivec4(u_xlat3.zwxy));
    u_xlatu0.xy = u_xlatu3.zw;
    u_xlat0.xyz = texelFetch(_SourceTex, ivec2(u_xlatu0.xy), int(u_xlatu0.w)).xyz;
    u_xlat16_5.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.x = dot(u_xlat16_5.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat0 = min(u_xlat2, u_xlat4);
    u_xlat1.xy = min(u_xlat1.xy, u_xlat4.xy);
    u_xlatu1.xy =  uvec2(ivec2(u_xlat1.xy));
    u_xlatu0 =  uvec4(ivec4(u_xlat0.zwxy));
    u_xlatu2.xy = u_xlatu0.zw;
    u_xlatu2.z = uint(uint(0u));
    u_xlatu2.w = uint(uint(0u));
    u_xlat2.xyz = texelFetch(_SourceTex, ivec2(u_xlatu2.xy), int(u_xlatu2.w)).xyz;
    u_xlat16_14.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_14.x = dot(u_xlat16_14.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_23 = u_xlat16_14.x + u_xlat16_5.x;
    u_xlatu3.z = uint(uint(0u));
    u_xlatu3.w = uint(uint(0u));
    u_xlat2.xyz = texelFetch(_SourceTex, ivec2(u_xlatu3.xy), int(u_xlatu3.w)).xyz;
    u_xlat16_6.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_32 = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat0.xyz = texelFetch(_SourceTex, ivec2(u_xlatu0.xy), int(u_xlatu0.w)).xyz;
    u_xlat16_6.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.x = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_15.x = u_xlat16_32 + u_xlat16_6.x;
    u_xlat16_0.yw = vec2(u_xlat16_23) + (-u_xlat16_15.xx);
    u_xlat16_23 = u_xlat16_32 + u_xlat16_5.x;
    u_xlat16_15.x = u_xlat16_14.x + u_xlat16_6.x;
    u_xlat16_15.x = u_xlat16_23 + (-u_xlat16_15.x);
    u_xlat16_23 = u_xlat16_14.x + u_xlat16_23;
    u_xlat16_23 = u_xlat16_6.x + u_xlat16_23;
    u_xlat16_23 = u_xlat16_23 * 0.03125;
    u_xlat16_23 = max(u_xlat16_23, 0.0078125);
    u_xlat2.x = min(abs(u_xlat16_0.w), abs(u_xlat16_15.x));
    u_xlat16_0.xz = (-u_xlat16_15.xx);
    u_xlat2.x = u_xlat16_23 + u_xlat2.x;
    u_xlat2.x = float(1.0) / float(u_xlat2.x);
    u_xlat0 = u_xlat16_0 * u_xlat2.xxxx;
    u_xlat0 = max(u_xlat0, vec4(-8.0, -8.0, -8.0, -8.0));
    u_xlat0 = min(u_xlat0, vec4(8.0, 8.0, 8.0, 8.0));
    u_xlat0 = u_xlat0 * _SourceSize.zwzw;
    u_xlat2 = u_xlat0.zwzw * vec4(-0.5, -0.5, -0.166666672, -0.166666672) + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0 * vec4(0.166666672, 0.166666672, 0.5, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_3.xyz = texture(_SourceTex, u_xlat2.xy).xyz;
    u_xlat10_2.xyz = texture(_SourceTex, u_xlat2.zw).xyz;
    u_xlat16_15.xyz = u_xlat10_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.xyz = min(max(u_xlat16_15.xyz, 0.0), 1.0);
#else
    u_xlat16_15.xyz = clamp(u_xlat16_15.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat10_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat10_2.xyz = texture(_SourceTex, u_xlat0.zw).xyz;
    u_xlat10_3.xyz = texture(_SourceTex, u_xlat0.xy).xyz;
    u_xlat16_8.xyz = u_xlat10_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_15.xyz = u_xlat16_15.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat10_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_7.xyz + u_xlat16_8.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_7.xyz = u_xlat16_15.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_7.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_23 = dot(u_xlat16_7.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_34 = min(u_xlat16_14.x, u_xlat16_32);
    u_xlat16_14.x = max(u_xlat16_14.x, u_xlat16_32);
    u_xlat16_14.x = max(u_xlat16_6.x, u_xlat16_14.x);
    u_xlat16_32 = min(u_xlat16_6.x, u_xlat16_34);
    u_xlatu1.z = uint(uint(0u));
    u_xlatu1.w = uint(uint(0u));
    u_xlat1.xyz = texelFetch(_SourceTex, ivec2(u_xlatu1.xy), int(u_xlatu1.w)).xyz;
    u_xlat16_8.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.x = dot(u_xlat16_8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_34 = min(u_xlat16_5.x, u_xlat16_6.x);
    u_xlat16_5.x = max(u_xlat16_5.x, u_xlat16_6.x);
    u_xlat16_5.x = max(u_xlat16_14.x, u_xlat16_5.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_5.x<u_xlat16_23);
#else
    u_xlatb1 = u_xlat16_5.x<u_xlat16_23;
#endif
    u_xlat16_5.x = min(u_xlat16_32, u_xlat16_34);
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat16_23<u_xlat16_5.x);
#else
    u_xlatb10 = u_xlat16_23<u_xlat16_5.x;
#endif
    u_xlatb1 = u_xlatb1 || u_xlatb10;
    u_xlat16_5.xyz = (bool(u_xlatb1)) ? u_xlat16_15.xyz : u_xlat16_7.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Grain_TilingParams.xy + _Grain_TilingParams.zw;
    u_xlat10_1 = texture(_Grain_Texture, u_xlat1.xy).w;
    u_xlat16_32 = u_xlat10_1 + -0.5;
    u_xlat16_32 = u_xlat16_32 + u_xlat16_32;
    u_xlat16_6.xyz = vec3(u_xlat16_32) * u_xlat16_5.xyz;
    u_xlat1.xyz = u_xlat16_6.xyz * _Grain_Params.xxx;
    u_xlat16_32 = dot(u_xlat16_5.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_32 = sqrt(u_xlat16_32);
    u_xlat28 = _Grain_Params.y * (-u_xlat16_32) + 1.0;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat28) + u_xlat16_5.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Dithering_Params.xy + _Dithering_Params.zw;
    u_xlat10_28 = texture(_BlueNoise_Texture, u_xlat2.xy).w;
    u_xlat28 = u_xlat10_28 * 2.0 + -1.0;
    u_xlat2.x = -abs(u_xlat28) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(u_xlat28>=0.0);
#else
    u_xlatb28 = u_xlat28>=0.0;
#endif
    u_xlat28 = (u_xlatb28) ? 1.0 : -1.0;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat28 = u_xlat28 * u_xlat2.x;
    u_xlat1.xyz = vec3(u_xlat28) * vec3(0.00392156886, 0.00392156886, 0.00392156886) + u_xlat1.xyz;
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_USE_DRAW_PROCEDURAL" }
Local Keywords { "_DITHERING" "_FILM_GRAIN" "_FXAA" "_LINEAR_TO_SRGB_CONVERSION" }
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
uniform 	vec2 _Grain_Params;
uniform 	vec4 _Grain_TilingParams;
uniform 	vec4 _Dithering_Params;
UNITY_LOCATION(0) uniform mediump sampler2D _SourceTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Grain_Texture;
UNITY_LOCATION(2) uniform mediump sampler2D _BlueNoise_Texture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
uvec4 u_xlatu0;
vec3 u_xlat1;
mediump float u_xlat10_1;
uvec4 u_xlatu1;
bvec3 u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat10_2;
ivec4 u_xlati2;
uvec4 u_xlatu2;
vec4 u_xlat3;
mediump vec3 u_xlat10_3;
ivec4 u_xlati3;
uvec4 u_xlatu3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
float u_xlat10;
bool u_xlatb10;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump float u_xlat16_23;
float u_xlat28;
mediump float u_xlat16_32;
mediump float u_xlat16_34;
void main()
{
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat1.xy = vs_TEXCOORD0.xy * _SourceSize.xy;
    u_xlati2 = ivec4(u_xlat1.xyxy);
    u_xlat1.xy = trunc(u_xlat1.xy);
    u_xlat1.xy = max(u_xlat1.xy, vec2(0.0, 0.0));
    u_xlati3 = u_xlati2.zwzw + ivec4(int(0xFFFFFFFFu), int(0xFFFFFFFFu), 1, int(0xFFFFFFFFu));
    u_xlati2 = u_xlati2 + ivec4(int(0xFFFFFFFFu), 1, 1, 1);
    u_xlat2 = vec4(u_xlati2);
    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat3 = vec4(u_xlati3);
    u_xlat3 = max(u_xlat3, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat4 = _SourceSize.xyxy + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat3 = min(u_xlat3, u_xlat4);
    u_xlatu3 =  uvec4(ivec4(u_xlat3.zwxy));
    u_xlatu0.xy = u_xlatu3.zw;
    u_xlat0.xyz = texelFetch(_SourceTex, ivec2(u_xlatu0.xy), int(u_xlatu0.w)).xyz;
    u_xlat16_5.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.x = dot(u_xlat16_5.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat0 = min(u_xlat2, u_xlat4);
    u_xlat1.xy = min(u_xlat1.xy, u_xlat4.xy);
    u_xlatu1.xy =  uvec2(ivec2(u_xlat1.xy));
    u_xlatu0 =  uvec4(ivec4(u_xlat0.zwxy));
    u_xlatu2.xy = u_xlatu0.zw;
    u_xlatu2.z = uint(uint(0u));
    u_xlatu2.w = uint(uint(0u));
    u_xlat2.xyz = texelFetch(_SourceTex, ivec2(u_xlatu2.xy), int(u_xlatu2.w)).xyz;
    u_xlat16_14.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_14.x = dot(u_xlat16_14.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_23 = u_xlat16_14.x + u_xlat16_5.x;
    u_xlatu3.z = uint(uint(0u));
    u_xlatu3.w = uint(uint(0u));
    u_xlat2.xyz = texelFetch(_SourceTex, ivec2(u_xlatu3.xy), int(u_xlatu3.w)).xyz;
    u_xlat16_6.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_32 = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatu0.z = uint(uint(0u));
    u_xlatu0.w = uint(uint(0u));
    u_xlat0.xyz = texelFetch(_SourceTex, ivec2(u_xlatu0.xy), int(u_xlatu0.w)).xyz;
    u_xlat16_6.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.x = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_15.x = u_xlat16_32 + u_xlat16_6.x;
    u_xlat16_0.yw = vec2(u_xlat16_23) + (-u_xlat16_15.xx);
    u_xlat16_23 = u_xlat16_32 + u_xlat16_5.x;
    u_xlat16_15.x = u_xlat16_14.x + u_xlat16_6.x;
    u_xlat16_15.x = u_xlat16_23 + (-u_xlat16_15.x);
    u_xlat16_23 = u_xlat16_14.x + u_xlat16_23;
    u_xlat16_23 = u_xlat16_6.x + u_xlat16_23;
    u_xlat16_23 = u_xlat16_23 * 0.03125;
    u_xlat16_23 = max(u_xlat16_23, 0.0078125);
    u_xlat2.x = min(abs(u_xlat16_0.w), abs(u_xlat16_15.x));
    u_xlat16_0.xz = (-u_xlat16_15.xx);
    u_xlat2.x = u_xlat16_23 + u_xlat2.x;
    u_xlat2.x = float(1.0) / float(u_xlat2.x);
    u_xlat0 = u_xlat16_0 * u_xlat2.xxxx;
    u_xlat0 = max(u_xlat0, vec4(-8.0, -8.0, -8.0, -8.0));
    u_xlat0 = min(u_xlat0, vec4(8.0, 8.0, 8.0, 8.0));
    u_xlat0 = u_xlat0 * _SourceSize.zwzw;
    u_xlat2 = u_xlat0.zwzw * vec4(-0.5, -0.5, -0.166666672, -0.166666672) + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0 * vec4(0.166666672, 0.166666672, 0.5, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_3.xyz = texture(_SourceTex, u_xlat2.xy).xyz;
    u_xlat10_2.xyz = texture(_SourceTex, u_xlat2.zw).xyz;
    u_xlat16_15.xyz = u_xlat10_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.xyz = min(max(u_xlat16_15.xyz, 0.0), 1.0);
#else
    u_xlat16_15.xyz = clamp(u_xlat16_15.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat10_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat10_2.xyz = texture(_SourceTex, u_xlat0.zw).xyz;
    u_xlat10_3.xyz = texture(_SourceTex, u_xlat0.xy).xyz;
    u_xlat16_8.xyz = u_xlat10_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_15.xyz = u_xlat16_15.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat10_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_7.xyz + u_xlat16_8.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_7.xyz = u_xlat16_15.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_7.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_23 = dot(u_xlat16_7.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_34 = min(u_xlat16_14.x, u_xlat16_32);
    u_xlat16_14.x = max(u_xlat16_14.x, u_xlat16_32);
    u_xlat16_14.x = max(u_xlat16_6.x, u_xlat16_14.x);
    u_xlat16_32 = min(u_xlat16_6.x, u_xlat16_34);
    u_xlatu1.z = uint(uint(0u));
    u_xlatu1.w = uint(uint(0u));
    u_xlat1.xyz = texelFetch(_SourceTex, ivec2(u_xlatu1.xy), int(u_xlatu1.w)).xyz;
    u_xlat16_8.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.x = dot(u_xlat16_8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_34 = min(u_xlat16_5.x, u_xlat16_6.x);
    u_xlat16_5.x = max(u_xlat16_5.x, u_xlat16_6.x);
    u_xlat16_5.x = max(u_xlat16_14.x, u_xlat16_5.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(u_xlat16_5.x<u_xlat16_23);
#else
    u_xlatb1.x = u_xlat16_5.x<u_xlat16_23;
#endif
    u_xlat16_5.x = min(u_xlat16_32, u_xlat16_34);
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat16_23<u_xlat16_5.x);
#else
    u_xlatb10 = u_xlat16_23<u_xlat16_5.x;
#endif
    u_xlatb1.x = u_xlatb1.x || u_xlatb10;
    u_xlat16_5.xyz = (u_xlatb1.x) ? u_xlat16_15.xyz : u_xlat16_7.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Grain_TilingParams.xy + _Grain_TilingParams.zw;
    u_xlat10_1 = texture(_Grain_Texture, u_xlat1.xy).w;
    u_xlat16_32 = u_xlat10_1 + -0.5;
    u_xlat16_32 = u_xlat16_32 + u_xlat16_32;
    u_xlat16_6.xyz = vec3(u_xlat16_32) * u_xlat16_5.xyz;
    u_xlat1.xyz = u_xlat16_6.xyz * _Grain_Params.xxx;
    u_xlat16_32 = dot(u_xlat16_5.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_32 = sqrt(u_xlat16_32);
    u_xlat28 = _Grain_Params.y * (-u_xlat16_32) + 1.0;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat28) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = log2(abs(u_xlat1.xyz));
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_5.xyz = exp2(u_xlat16_5.xyz);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_6.xyz = u_xlat1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb1.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat1.xyzx).xyz;
    {
        vec3 hlslcc_movcTemp = u_xlat16_5;
        hlslcc_movcTemp.x = (u_xlatb1.x) ? u_xlat16_6.x : u_xlat16_5.x;
        hlslcc_movcTemp.y = (u_xlatb1.y) ? u_xlat16_6.y : u_xlat16_5.y;
        hlslcc_movcTemp.z = (u_xlatb1.z) ? u_xlat16_6.z : u_xlat16_5.z;
        u_xlat16_5 = hlslcc_movcTemp;
    }
    u_xlat1.xy = vs_TEXCOORD0.xy * _Dithering_Params.xy + _Dithering_Params.zw;
    u_xlat10_1 = texture(_BlueNoise_Texture, u_xlat1.xy).w;
    u_xlat1.x = u_xlat10_1 * 2.0 + -1.0;
    u_xlat10 = -abs(u_xlat1.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(u_xlat1.x>=0.0);
#else
    u_xlatb1.x = u_xlat1.x>=0.0;
#endif
    u_xlat1.x = (u_xlatb1.x) ? 1.0 : -1.0;
    u_xlat10 = sqrt(u_xlat10);
    u_xlat10 = (-u_xlat10) + 1.0;
    u_xlat1.x = u_xlat10 * u_xlat1.x;
    u_xlat1.xyz = u_xlat1.xxx * vec3(0.00392156886, 0.00392156886, 0.00392156886) + u_xlat16_5.xyz;
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
}
}
}
}