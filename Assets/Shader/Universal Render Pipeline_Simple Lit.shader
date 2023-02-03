//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Universal Render Pipeline/Simple Lit" {
Properties {
_BaseMap ("Base Map (RGB) Smoothness / Alpha (A)", 2D) = "white" { }
_BaseColor ("Base Color", Color) = (1,1,1,1)
_Cutoff ("Alpha Clipping", Range(0, 1)) = 0.5
_SpecColor ("Specular Color", Color) = (0.5,0.5,0.5,0.5)
_SpecGlossMap ("Specular Map", 2D) = "white" { }
[Enum(Specular Alpha,0,Albedo Alpha,1)] _SmoothnessSource ("Smoothness Source", Float) = 0
[ToggleOff] _SpecularHighlights ("Specular Highlights", Float) = 1
_BumpScale ("Scale", Float) = 1
_BumpMap ("Normal Map", 2D) = "bump" { }
_EmissionColor ("Emission Color", Color) = (0,0,0,1)
_EmissionMap ("Emission Map", 2D) = "white" { }
_Surface ("__surface", Float) = 0
_Blend ("__blend", Float) = 0
_AlphaClip ("__clip", Float) = 0
_SrcBlend ("__src", Float) = 1
_DstBlend ("__dst", Float) = 0
_ZWrite ("__zw", Float) = 1
_Cull ("__cull", Float) = 2
[ToggleOff] _ReceiveShadows ("Receive Shadows", Float) = 1
_QueueOffset ("Queue offset", Float) = 0
_Smoothness ("Smoothness", Float) = 0.5
_MainTex ("BaseMap", 2D) = "white" { }
_Color ("Base Color", Color) = (1,1,1,1)
_Shininess ("Smoothness", Float) = 0
_GlossinessSource ("GlossinessSource", Float) = 0
_SpecSource ("SpecularHighlights", Float) = 0
unity_Lightmaps ("unity_Lightmaps", 2DArray) = "" { }
unity_LightmapsInd ("unity_LightmapsInd", 2DArray) = "" { }
unity_ShadowMasks ("unity_ShadowMasks", 2DArray) = "" { }
}
SubShader {
 LOD 300
 Tags { "IGNOREPROJECTOR" = "true" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" "ShaderModel" = "4.5" "UniversalMaterialType" = "SimpleLit" }
 Pass {
  Name "ForwardLit"
  LOD 300
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "UniversalForward" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" "ShaderModel" = "4.5" "UniversalMaterialType" = "SimpleLit" }
  Blend Zero Zero, Zero Zero
  ZWrite Off
  Cull Off
  GpuProgramID 51569
}
 Pass {
  Name "ShadowCaster"
  LOD 300
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "SHADOWCASTER" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" "ShaderModel" = "4.5" "UniversalMaterialType" = "SimpleLit" }
  ColorMask 0 0
  Cull Off
  GpuProgramID 77501
}
 Pass {
  Name "GBuffer"
  LOD 300
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "UniversalGBuffer" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" "ShaderModel" = "4.5" "UniversalMaterialType" = "SimpleLit" }
  ZWrite Off
  Cull Off
  GpuProgramID 140497
}
 Pass {
  Name "DepthOnly"
  LOD 300
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "DepthOnly" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" "ShaderModel" = "4.5" "UniversalMaterialType" = "SimpleLit" }
  ColorMask 0 0
  Cull Off
  GpuProgramID 252942
}
 Pass {
  Name "DepthNormals"
  LOD 300
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "DepthNormals" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" "ShaderModel" = "4.5" "UniversalMaterialType" = "SimpleLit" }
  Cull Off
  GpuProgramID 319578
}
 Pass {
  Name "Universal2D"
  LOD 300
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "Universal2D" "QUEUE" = "Transparent" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Transparent" "ShaderModel" = "4.5" "UniversalMaterialType" = "SimpleLit" }
  GpuProgramID 399446
}
}
SubShader {
 LOD 300
 Tags { "IGNOREPROJECTOR" = "true" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" "ShaderModel" = "2.0" "UniversalMaterialType" = "SimpleLit" }
 Pass {
  Name "ForwardLit"
  LOD 300
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "UniversalForward" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" "ShaderModel" = "2.0" "UniversalMaterialType" = "SimpleLit" }
  Blend Zero Zero, Zero Zero
  ZWrite Off
  Cull Off
  GpuProgramID 467714
Program "vp" {
SubProgram "gles " {
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _BaseMap_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlatb22 = unity_OrthoParams.w==0.0;
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	mediump vec4 unity_LightData;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump float _Surface;
uniform lowp sampler2D _BaseMap;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
bool u_xlatb2;
mediump float u_xlat16_9;
void main()
{
    u_xlat16_0.xyz = _MainLightColor.xyz * unity_LightData.zzz;
    u_xlat16_9 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
    u_xlat16_9 = clamp(u_xlat16_9, 0.0, 1.0);
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(u_xlat16_9) + vs_TEXCOORD1.xyz;
    u_xlat10_1 = texture2D(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat10_1 * _BaseColor;
    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlatb2 = _Surface==1.0;
    SV_Target0.w = (u_xlatb2) ? u_xlat16_1.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_ADDITIONAL_LIGHTS" "_MAIN_LIGHT_SHADOWS" "_MAIN_LIGHT_SHADOWS_CASCADE" }
Local Keywords { "_EMISSION" "_GLOSSINESS_FROM_BASE_ALPHA" "_SPECULAR_COLOR" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb22 = unity_OrthoParams.w==0.0;
#endif
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
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
vec4 ImmCB_0[4];
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	mediump vec4 _AdditionalLightsCount;
uniform 	vec4 _AdditionalLightsPosition[16];
uniform 	mediump vec4 _AdditionalLightsColor[16];
uniform 	mediump vec4 _AdditionalLightsAttenuation[16];
uniform 	mediump vec4 _AdditionalLightsSpotDir[16];
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4_MainLightWorldToShadow[20];
uniform 	vec4 _CascadeShadowSplitSpheres0;
uniform 	vec4 _CascadeShadowSplitSpheres1;
uniform 	vec4 _CascadeShadowSplitSpheres2;
uniform 	vec4 _CascadeShadowSplitSpheres3;
uniform 	vec4 _CascadeShadowSplitSphereRadii;
uniform 	mediump vec4 _MainLightShadowParams;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
UNITY_LOCATION(1) uniform mediump sampler2D _EmissionMap;
UNITY_LOCATION(2) uniform mediump sampler2D _MainLightShadowmapTexture;
UNITY_LOCATION(3) uniform mediump sampler2DShadow hlslcc_zcmp_MainLightShadowmapTexture;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
uint u_xlatu3;
bvec4 u_xlatb3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump float u_xlat16_15;
vec3 u_xlat16;
int u_xlati16;
bool u_xlatb16;
mediump float u_xlat16_28;
float u_xlat29;
uint u_xlatu29;
float u_xlat40;
mediump float u_xlat16_40;
int u_xlati40;
uint u_xlatu40;
bool u_xlatb40;
mediump float u_xlat16_41;
float u_xlat42;
void main()
{
ImmCB_0[0] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.0,1.0,0.0,0.0);
ImmCB_0[2] = vec4(0.0,0.0,1.0,0.0);
ImmCB_0[3] = vec4(0.0,0.0,0.0,1.0);
    u_xlat16_0 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * _BaseColor;
    u_xlat16_1.xyz = texture(_EmissionMap, vs_TEXCOORD0.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * _EmissionColor.xyz;
    u_xlat16_2.x = u_xlat16_0.w * 10.0 + 1.0;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat40 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat40 = max(u_xlat40, 1.17549435e-38);
    u_xlat16_15 = inversesqrt(u_xlat40);
    u_xlat3.xyz = vs_TEXCOORD2.xyz + (-_CascadeShadowSplitSpheres0.xyz);
    u_xlat4.xyz = vs_TEXCOORD2.xyz + (-_CascadeShadowSplitSpheres1.xyz);
    u_xlat5.xyz = vs_TEXCOORD2.xyz + (-_CascadeShadowSplitSpheres2.xyz);
    u_xlat6.xyz = vs_TEXCOORD2.xyz + (-_CascadeShadowSplitSpheres3.xyz);
    u_xlat3.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat3.y = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat3.z = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat3.w = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlatb3 = lessThan(u_xlat3, _CascadeShadowSplitSphereRadii);
    u_xlat16_4.x = (u_xlatb3.x) ? float(1.0) : float(0.0);
    u_xlat16_4.y = (u_xlatb3.y) ? float(1.0) : float(0.0);
    u_xlat16_4.z = (u_xlatb3.z) ? float(1.0) : float(0.0);
    u_xlat16_4.w = (u_xlatb3.w) ? float(1.0) : float(0.0);
    u_xlat16_7.x = (u_xlatb3.x) ? float(-1.0) : float(-0.0);
    u_xlat16_7.y = (u_xlatb3.y) ? float(-1.0) : float(-0.0);
    u_xlat16_7.z = (u_xlatb3.z) ? float(-1.0) : float(-0.0);
    u_xlat16_7.xyz = u_xlat16_4.yzw + u_xlat16_7.xyz;
    u_xlat16_4.yzw = max(u_xlat16_7.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_28 = dot(u_xlat16_4, vec4(4.0, 3.0, 2.0, 1.0));
    u_xlat16_28 = (-u_xlat16_28) + 4.0;
    u_xlatu40 = uint(u_xlat16_28);
    u_xlati40 = int(int(u_xlatu40) << 2);
    u_xlat3.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4_MainLightWorldToShadow[(u_xlati40 + 1)].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[u_xlati40].xyz * vs_TEXCOORD2.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[(u_xlati40 + 2)].xyz * vs_TEXCOORD2.zzz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4_MainLightWorldToShadow[(u_xlati40 + 3)].xyz;
    vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat16_40 = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec0, 0.0);
    u_xlat16_28 = (-_MainLightShadowParams.x) + 1.0;
    u_xlat16_28 = u_xlat16_40 * _MainLightShadowParams.x + u_xlat16_28;
#ifdef UNITY_ADRENO_ES3
    u_xlatb40 = !!(0.0>=u_xlat3.z);
#else
    u_xlatb40 = 0.0>=u_xlat3.z;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb3.x = !!(u_xlat3.z>=1.0);
#else
    u_xlatb3.x = u_xlat3.z>=1.0;
#endif
    u_xlatb40 = u_xlatb40 || u_xlatb3.x;
    u_xlat16_28 = (u_xlatb40) ? 1.0 : u_xlat16_28;
    u_xlat3.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat40 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat40 = u_xlat40 * _MainLightShadowParams.z + _MainLightShadowParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat40 = min(max(u_xlat40, 0.0), 1.0);
#else
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
#endif
    u_xlat16_41 = u_xlat40 * u_xlat40;
    u_xlat16_7.x = (-u_xlat16_28) + 1.0;
    u_xlat16_28 = u_xlat16_41 * u_xlat16_7.x + u_xlat16_28;
    u_xlat16_28 = u_xlat16_28 * unity_LightData.z;
    u_xlat16_7.xyz = vec3(u_xlat16_28) * _MainLightColor.xyz;
    u_xlat16_28 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_28 = min(max(u_xlat16_28, 0.0), 1.0);
#else
    u_xlat16_28 = clamp(u_xlat16_28, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_7.xyz * vec3(u_xlat16_28) + vs_TEXCOORD1.xyz;
    u_xlat3.xyz = vs_TEXCOORD4.xyz * vec3(u_xlat16_15) + _MainLightPosition.xyz;
    u_xlat40 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat40 = max(u_xlat40, 1.17549435e-38);
    u_xlat16_28 = inversesqrt(u_xlat40);
    u_xlat3.xyz = vec3(u_xlat16_28) * u_xlat3.xyz;
    u_xlat40 = dot(vs_TEXCOORD3.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat40 = min(max(u_xlat40, 0.0), 1.0);
#else
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
#endif
    u_xlat16_28 = log2(u_xlat40);
    u_xlat16_28 = u_xlat16_28 * u_xlat16_2.x;
    u_xlat16_28 = exp2(u_xlat16_28);
    u_xlat16_9.xyz = vec3(u_xlat16_28) * _SpecColor.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_9.xyz;
    u_xlat16_28 = min(_AdditionalLightsCount.x, unity_LightData.y);
    u_xlatu40 =  uint(int(u_xlat16_28));
    u_xlat16_9.xyz = u_xlat16_8.xyz;
    u_xlat16_10.xyz = u_xlat16_7.xyz;
    for(uint u_xlatu_loop_1 = uint(0u) ; u_xlatu_loop_1<u_xlatu40 ; u_xlatu_loop_1++)
    {
        u_xlati16 = int(uint(u_xlatu_loop_1 & 3u));
        u_xlatu29 = uint(u_xlatu_loop_1 >> 2u);
        u_xlat16_28 = dot(unity_LightIndices[int(u_xlatu29)], ImmCB_0[u_xlati16]);
        u_xlati16 = int(u_xlat16_28);
        u_xlat5.xyz = (-vs_TEXCOORD2.xyz) * _AdditionalLightsPosition[u_xlati16].www + _AdditionalLightsPosition[u_xlati16].xyz;
        u_xlat29 = dot(u_xlat5.xyz, u_xlat5.xyz);
        u_xlat29 = max(u_xlat29, 6.10351562e-05);
        u_xlat42 = inversesqrt(u_xlat29);
        u_xlat5.xyz = vec3(u_xlat42) * u_xlat5.xyz;
        u_xlat42 = float(1.0) / float(u_xlat29);
        u_xlat29 = u_xlat29 * _AdditionalLightsAttenuation[u_xlati16].x + _AdditionalLightsAttenuation[u_xlati16].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat29 = min(max(u_xlat29, 0.0), 1.0);
#else
        u_xlat29 = clamp(u_xlat29, 0.0, 1.0);
#endif
        u_xlat29 = u_xlat29 * u_xlat42;
        u_xlat16_28 = dot(_AdditionalLightsSpotDir[u_xlati16].xyz, u_xlat5.xyz);
        u_xlat16_28 = u_xlat16_28 * _AdditionalLightsAttenuation[u_xlati16].z + _AdditionalLightsAttenuation[u_xlati16].w;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_28 = min(max(u_xlat16_28, 0.0), 1.0);
#else
        u_xlat16_28 = clamp(u_xlat16_28, 0.0, 1.0);
#endif
        u_xlat16_28 = u_xlat16_28 * u_xlat16_28;
        u_xlat29 = u_xlat16_28 * u_xlat29;
        u_xlat16_11.xyz = vec3(u_xlat29) * _AdditionalLightsColor[u_xlati16].xyz;
        u_xlat16_28 = dot(vs_TEXCOORD3.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
        u_xlat16_28 = min(max(u_xlat16_28, 0.0), 1.0);
#else
        u_xlat16_28 = clamp(u_xlat16_28, 0.0, 1.0);
#endif
        u_xlat16_9.xyz = u_xlat16_11.xyz * vec3(u_xlat16_28) + u_xlat16_9.xyz;
        u_xlat16.xyz = vs_TEXCOORD4.xyz * vec3(u_xlat16_15) + u_xlat5.xyz;
        u_xlat5.x = dot(u_xlat16.xyz, u_xlat16.xyz);
        u_xlat5.x = max(u_xlat5.x, 1.17549435e-38);
        u_xlat16_28 = inversesqrt(u_xlat5.x);
        u_xlat16.xyz = vec3(u_xlat16_28) * u_xlat16.xyz;
        u_xlat16.x = dot(vs_TEXCOORD3.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
        u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
        u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
        u_xlat16_28 = log2(u_xlat16.x);
        u_xlat16_28 = u_xlat16_28 * u_xlat16_2.x;
        u_xlat16_28 = exp2(u_xlat16_28);
        u_xlat16_12.xyz = vec3(u_xlat16_28) * _SpecColor.xyz;
        u_xlat16_10.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + u_xlat16_10.xyz;
    }
    u_xlat16_2.xyz = u_xlat16_9.xyz * u_xlat16_0.xyz + u_xlat1.xyz;
    SV_Target0.xyz = u_xlat16_10.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_Surface==1.0);
#else
    u_xlatb1 = _Surface==1.0;
#endif
    SV_Target0.w = (u_xlatb1) ? u_xlat16_0.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles " {
Local Keywords { "_RECEIVE_SHADOWS_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _BaseMap_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlatb22 = unity_OrthoParams.w==0.0;
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	mediump vec4 unity_LightData;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump float _Surface;
uniform lowp sampler2D _BaseMap;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
bool u_xlatb2;
mediump float u_xlat16_9;
void main()
{
    u_xlat16_0.xyz = _MainLightColor.xyz * unity_LightData.zzz;
    u_xlat16_9 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
    u_xlat16_9 = clamp(u_xlat16_9, 0.0, 1.0);
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(u_xlat16_9) + vs_TEXCOORD1.xyz;
    u_xlat10_1 = texture2D(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat10_1 * _BaseColor;
    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlatb2 = _Surface==1.0;
    SV_Target0.w = (u_xlatb2) ? u_xlat16_1.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_ADDITIONAL_LIGHTS" "_MAIN_LIGHT_SHADOWS" "_MAIN_LIGHT_SHADOWS_CASCADE" }
Local Keywords { "_EMISSION" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb22 = unity_OrthoParams.w==0.0;
#endif
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
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
vec4 ImmCB_0[4];
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	mediump vec4 _AdditionalLightsCount;
uniform 	vec4 _AdditionalLightsPosition[16];
uniform 	mediump vec4 _AdditionalLightsColor[16];
uniform 	mediump vec4 _AdditionalLightsAttenuation[16];
uniform 	mediump vec4 _AdditionalLightsSpotDir[16];
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4_MainLightWorldToShadow[20];
uniform 	vec4 _CascadeShadowSplitSpheres0;
uniform 	vec4 _CascadeShadowSplitSpheres1;
uniform 	vec4 _CascadeShadowSplitSpheres2;
uniform 	vec4 _CascadeShadowSplitSpheres3;
uniform 	vec4 _CascadeShadowSplitSphereRadii;
uniform 	mediump vec4 _MainLightShadowParams;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
UNITY_LOCATION(1) uniform mediump sampler2D _EmissionMap;
UNITY_LOCATION(2) uniform mediump sampler2D _MainLightShadowmapTexture;
UNITY_LOCATION(3) uniform mediump sampler2DShadow hlslcc_zcmp_MainLightShadowmapTexture;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
uint u_xlatu2;
bvec4 u_xlatb2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
int u_xlati11;
bool u_xlatb11;
mediump float u_xlat16_15;
float u_xlat20;
uint u_xlatu20;
mediump float u_xlat16_24;
float u_xlat28;
mediump float u_xlat16_28;
int u_xlati28;
uint u_xlatu28;
bool u_xlatb28;
float u_xlat29;
mediump float u_xlat16_33;
void main()
{
ImmCB_0[0] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.0,1.0,0.0,0.0);
ImmCB_0[2] = vec4(0.0,0.0,1.0,0.0);
ImmCB_0[3] = vec4(0.0,0.0,0.0,1.0);
    u_xlat16_0 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * _BaseColor;
    u_xlat16_1.xyz = texture(_EmissionMap, vs_TEXCOORD0.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * _EmissionColor.xyz;
    u_xlat2.xyz = vs_TEXCOORD2.xyz + (-_CascadeShadowSplitSpheres0.xyz);
    u_xlat3.xyz = vs_TEXCOORD2.xyz + (-_CascadeShadowSplitSpheres1.xyz);
    u_xlat4.xyz = vs_TEXCOORD2.xyz + (-_CascadeShadowSplitSpheres2.xyz);
    u_xlat5.xyz = vs_TEXCOORD2.xyz + (-_CascadeShadowSplitSpheres3.xyz);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.y = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat2.z = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat2.w = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlatb2 = lessThan(u_xlat2, _CascadeShadowSplitSphereRadii);
    u_xlat16_3.x = (u_xlatb2.x) ? float(1.0) : float(0.0);
    u_xlat16_3.y = (u_xlatb2.y) ? float(1.0) : float(0.0);
    u_xlat16_3.z = (u_xlatb2.z) ? float(1.0) : float(0.0);
    u_xlat16_3.w = (u_xlatb2.w) ? float(1.0) : float(0.0);
    u_xlat16_6.x = (u_xlatb2.x) ? float(-1.0) : float(-0.0);
    u_xlat16_6.y = (u_xlatb2.y) ? float(-1.0) : float(-0.0);
    u_xlat16_6.z = (u_xlatb2.z) ? float(-1.0) : float(-0.0);
    u_xlat16_6.xyz = u_xlat16_3.yzw + u_xlat16_6.xyz;
    u_xlat16_3.yzw = max(u_xlat16_6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_6.x = dot(u_xlat16_3, vec4(4.0, 3.0, 2.0, 1.0));
    u_xlat16_6.x = (-u_xlat16_6.x) + 4.0;
    u_xlatu28 = uint(u_xlat16_6.x);
    u_xlati28 = int(int(u_xlatu28) << 2);
    u_xlat2.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4_MainLightWorldToShadow[(u_xlati28 + 1)].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[u_xlati28].xyz * vs_TEXCOORD2.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[(u_xlati28 + 2)].xyz * vs_TEXCOORD2.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4_MainLightWorldToShadow[(u_xlati28 + 3)].xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat16_28 = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec0, 0.0);
    u_xlat16_6.x = (-_MainLightShadowParams.x) + 1.0;
    u_xlat16_6.x = u_xlat16_28 * _MainLightShadowParams.x + u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(0.0>=u_xlat2.z);
#else
    u_xlatb28 = 0.0>=u_xlat2.z;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(u_xlat2.z>=1.0);
#else
    u_xlatb2.x = u_xlat2.z>=1.0;
#endif
    u_xlatb28 = u_xlatb28 || u_xlatb2.x;
    u_xlat16_6.x = (u_xlatb28) ? 1.0 : u_xlat16_6.x;
    u_xlat2.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat28 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat28 = u_xlat28 * _MainLightShadowParams.z + _MainLightShadowParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat28 = min(max(u_xlat28, 0.0), 1.0);
#else
    u_xlat28 = clamp(u_xlat28, 0.0, 1.0);
#endif
    u_xlat16_15 = u_xlat28 * u_xlat28;
    u_xlat16_24 = (-u_xlat16_6.x) + 1.0;
    u_xlat16_6.x = u_xlat16_15 * u_xlat16_24 + u_xlat16_6.x;
    u_xlat16_6.x = u_xlat16_6.x * unity_LightData.z;
    u_xlat16_6.xyz = u_xlat16_6.xxx * _MainLightColor.xyz;
    u_xlat16_33 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33 = min(max(u_xlat16_33, 0.0), 1.0);
#else
    u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(u_xlat16_33) + vs_TEXCOORD1.xyz;
    u_xlat16_33 = min(_AdditionalLightsCount.x, unity_LightData.y);
    u_xlatu28 =  uint(int(u_xlat16_33));
    u_xlat16_7.xyz = u_xlat16_6.xyz;
    for(uint u_xlatu_loop_1 = uint(0u) ; u_xlatu_loop_1<u_xlatu28 ; u_xlatu_loop_1++)
    {
        u_xlati11 = int(uint(u_xlatu_loop_1 & 3u));
        u_xlatu20 = uint(u_xlatu_loop_1 >> 2u);
        u_xlat16_33 = dot(unity_LightIndices[int(u_xlatu20)], ImmCB_0[u_xlati11]);
        u_xlati11 = int(u_xlat16_33);
        u_xlat4.xyz = (-vs_TEXCOORD2.xyz) * _AdditionalLightsPosition[u_xlati11].www + _AdditionalLightsPosition[u_xlati11].xyz;
        u_xlat20 = dot(u_xlat4.xyz, u_xlat4.xyz);
        u_xlat20 = max(u_xlat20, 6.10351562e-05);
        u_xlat29 = inversesqrt(u_xlat20);
        u_xlat4.xyz = vec3(u_xlat29) * u_xlat4.xyz;
        u_xlat29 = float(1.0) / float(u_xlat20);
        u_xlat20 = u_xlat20 * _AdditionalLightsAttenuation[u_xlati11].x + _AdditionalLightsAttenuation[u_xlati11].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
        u_xlat20 = u_xlat20 * u_xlat29;
        u_xlat16_33 = dot(_AdditionalLightsSpotDir[u_xlati11].xyz, u_xlat4.xyz);
        u_xlat16_33 = u_xlat16_33 * _AdditionalLightsAttenuation[u_xlati11].z + _AdditionalLightsAttenuation[u_xlati11].w;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_33 = min(max(u_xlat16_33, 0.0), 1.0);
#else
        u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
#endif
        u_xlat16_33 = u_xlat16_33 * u_xlat16_33;
        u_xlat20 = u_xlat20 * u_xlat16_33;
        u_xlat16_8.xyz = vec3(u_xlat20) * _AdditionalLightsColor[u_xlati11].xyz;
        u_xlat16_33 = dot(vs_TEXCOORD3.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
        u_xlat16_33 = min(max(u_xlat16_33, 0.0), 1.0);
#else
        u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
#endif
        u_xlat16_7.xyz = u_xlat16_8.xyz * vec3(u_xlat16_33) + u_xlat16_7.xyz;
    }
    SV_Target0.xyz = u_xlat16_7.xyz * u_xlat16_0.xyz + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_Surface==1.0);
#else
    u_xlatb1 = _Surface==1.0;
#endif
    SV_Target0.w = (u_xlatb1) ? u_xlat16_0.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles " {
Local Keywords { "_ALPHAPREMULTIPLY_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _BaseMap_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlatb22 = unity_OrthoParams.w==0.0;
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	mediump vec4 unity_LightData;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump float _Surface;
uniform lowp sampler2D _BaseMap;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
bool u_xlatb3;
mediump float u_xlat16_12;
void main()
{
    u_xlat16_0.xyz = _MainLightColor.xyz * unity_LightData.zzz;
    u_xlat16_12 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
    u_xlat16_12 = clamp(u_xlat16_12, 0.0, 1.0);
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(u_xlat16_12) + vs_TEXCOORD1.xyz;
    u_xlat10_1 = texture2D(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat10_1 * _BaseColor;
    u_xlat16_2.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
    u_xlatb3 = _Surface==1.0;
    SV_Target0.w = (u_xlatb3) ? u_xlat16_1.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_ADDITIONAL_LIGHTS" "_MAIN_LIGHT_SHADOWS" "_MAIN_LIGHT_SHADOWS_CASCADE" }
Local Keywords { "_GLOSSINESS_FROM_BASE_ALPHA" "_SPECULAR_COLOR" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb22 = unity_OrthoParams.w==0.0;
#endif
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
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
vec4 ImmCB_0[4];
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	mediump vec4 _AdditionalLightsCount;
uniform 	vec4 _AdditionalLightsPosition[16];
uniform 	mediump vec4 _AdditionalLightsColor[16];
uniform 	mediump vec4 _AdditionalLightsAttenuation[16];
uniform 	mediump vec4 _AdditionalLightsSpotDir[16];
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4_MainLightWorldToShadow[20];
uniform 	vec4 _CascadeShadowSplitSpheres0;
uniform 	vec4 _CascadeShadowSplitSpheres1;
uniform 	vec4 _CascadeShadowSplitSpheres2;
uniform 	vec4 _CascadeShadowSplitSpheres3;
uniform 	vec4 _CascadeShadowSplitSphereRadii;
uniform 	mediump vec4 _MainLightShadowParams;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainLightShadowmapTexture;
UNITY_LOCATION(2) uniform mediump sampler2DShadow hlslcc_zcmp_MainLightShadowmapTexture;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump float u_xlat16_1;
vec4 u_xlat2;
mediump float u_xlat16_2;
int u_xlati2;
uint u_xlatu2;
bvec4 u_xlatb2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump float u_xlat16_13;
vec3 u_xlat14;
uint u_xlatu14;
bool u_xlatb14;
mediump float u_xlat16_25;
float u_xlat26;
int u_xlati26;
bool u_xlatb26;
mediump float u_xlat16_37;
float u_xlat38;
uint u_xlatu38;
float u_xlat40;
void main()
{
ImmCB_0[0] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.0,1.0,0.0,0.0);
ImmCB_0[2] = vec4(0.0,0.0,1.0,0.0);
ImmCB_0[3] = vec4(0.0,0.0,0.0,1.0);
    u_xlat16_0 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * _BaseColor;
    u_xlat16_1 = u_xlat16_0.w * 10.0 + 1.0;
    u_xlat16_1 = exp2(u_xlat16_1);
    u_xlat2.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat2.x = max(u_xlat2.x, 1.17549435e-38);
    u_xlat16_13 = inversesqrt(u_xlat2.x);
    u_xlat2.xyz = vs_TEXCOORD2.xyz + (-_CascadeShadowSplitSpheres0.xyz);
    u_xlat3.xyz = vs_TEXCOORD2.xyz + (-_CascadeShadowSplitSpheres1.xyz);
    u_xlat4.xyz = vs_TEXCOORD2.xyz + (-_CascadeShadowSplitSpheres2.xyz);
    u_xlat5.xyz = vs_TEXCOORD2.xyz + (-_CascadeShadowSplitSpheres3.xyz);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.y = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat2.z = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat2.w = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlatb2 = lessThan(u_xlat2, _CascadeShadowSplitSphereRadii);
    u_xlat16_3.x = (u_xlatb2.x) ? float(1.0) : float(0.0);
    u_xlat16_3.y = (u_xlatb2.y) ? float(1.0) : float(0.0);
    u_xlat16_3.z = (u_xlatb2.z) ? float(1.0) : float(0.0);
    u_xlat16_3.w = (u_xlatb2.w) ? float(1.0) : float(0.0);
    u_xlat16_6.x = (u_xlatb2.x) ? float(-1.0) : float(-0.0);
    u_xlat16_6.y = (u_xlatb2.y) ? float(-1.0) : float(-0.0);
    u_xlat16_6.z = (u_xlatb2.z) ? float(-1.0) : float(-0.0);
    u_xlat16_6.xyz = u_xlat16_3.yzw + u_xlat16_6.xyz;
    u_xlat16_3.yzw = max(u_xlat16_6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_25 = dot(u_xlat16_3, vec4(4.0, 3.0, 2.0, 1.0));
    u_xlat16_25 = (-u_xlat16_25) + 4.0;
    u_xlatu2 = uint(u_xlat16_25);
    u_xlati2 = int(int(u_xlatu2) << 2);
    u_xlat14.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4_MainLightWorldToShadow[(u_xlati2 + 1)].xyz;
    u_xlat14.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[u_xlati2].xyz * vs_TEXCOORD2.xxx + u_xlat14.xyz;
    u_xlat14.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[(u_xlati2 + 2)].xyz * vs_TEXCOORD2.zzz + u_xlat14.xyz;
    u_xlat2.xyz = u_xlat14.xyz + hlslcc_mtx4x4_MainLightWorldToShadow[(u_xlati2 + 3)].xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat16_2 = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec0, 0.0);
    u_xlat16_25 = (-_MainLightShadowParams.x) + 1.0;
    u_xlat16_25 = u_xlat16_2 * _MainLightShadowParams.x + u_xlat16_25;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(0.0>=u_xlat2.z);
#else
    u_xlatb2.x = 0.0>=u_xlat2.z;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(u_xlat2.z>=1.0);
#else
    u_xlatb14 = u_xlat2.z>=1.0;
#endif
    u_xlatb2.x = u_xlatb14 || u_xlatb2.x;
    u_xlat16_25 = (u_xlatb2.x) ? 1.0 : u_xlat16_25;
    u_xlat2.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.x = u_xlat2.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_37 = u_xlat2.x * u_xlat2.x;
    u_xlat16_6.x = (-u_xlat16_25) + 1.0;
    u_xlat16_25 = u_xlat16_37 * u_xlat16_6.x + u_xlat16_25;
    u_xlat16_25 = u_xlat16_25 * unity_LightData.z;
    u_xlat16_6.xyz = vec3(u_xlat16_25) * _MainLightColor.xyz;
    u_xlat16_25 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25 = min(max(u_xlat16_25, 0.0), 1.0);
#else
    u_xlat16_25 = clamp(u_xlat16_25, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(u_xlat16_25) + vs_TEXCOORD1.xyz;
    u_xlat2.xyz = vs_TEXCOORD4.xyz * vec3(u_xlat16_13) + _MainLightPosition.xyz;
    u_xlat38 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat38 = max(u_xlat38, 1.17549435e-38);
    u_xlat16_25 = inversesqrt(u_xlat38);
    u_xlat2.xyz = vec3(u_xlat16_25) * u_xlat2.xyz;
    u_xlat2.x = dot(vs_TEXCOORD3.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_25 = log2(u_xlat2.x);
    u_xlat16_25 = u_xlat16_25 * u_xlat16_1;
    u_xlat16_25 = exp2(u_xlat16_25);
    u_xlat16_8.xyz = vec3(u_xlat16_25) * _SpecColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz;
    u_xlat16_25 = min(_AdditionalLightsCount.x, unity_LightData.y);
    u_xlatu2 =  uint(int(u_xlat16_25));
    u_xlat16_8.xyz = u_xlat16_7.xyz;
    u_xlat16_9.xyz = u_xlat16_6.xyz;
    for(uint u_xlatu_loop_1 = uint(0u) ; u_xlatu_loop_1<u_xlatu2 ; u_xlatu_loop_1++)
    {
        u_xlati26 = int(uint(u_xlatu_loop_1 & 3u));
        u_xlatu38 = uint(u_xlatu_loop_1 >> 2u);
        u_xlat16_25 = dot(unity_LightIndices[int(u_xlatu38)], ImmCB_0[u_xlati26]);
        u_xlati26 = int(u_xlat16_25);
        u_xlat4.xyz = (-vs_TEXCOORD2.xyz) * _AdditionalLightsPosition[u_xlati26].www + _AdditionalLightsPosition[u_xlati26].xyz;
        u_xlat38 = dot(u_xlat4.xyz, u_xlat4.xyz);
        u_xlat38 = max(u_xlat38, 6.10351562e-05);
        u_xlat40 = inversesqrt(u_xlat38);
        u_xlat4.xyz = vec3(u_xlat40) * u_xlat4.xyz;
        u_xlat40 = float(1.0) / float(u_xlat38);
        u_xlat38 = u_xlat38 * _AdditionalLightsAttenuation[u_xlati26].x + _AdditionalLightsAttenuation[u_xlati26].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat38 = min(max(u_xlat38, 0.0), 1.0);
#else
        u_xlat38 = clamp(u_xlat38, 0.0, 1.0);
#endif
        u_xlat38 = u_xlat38 * u_xlat40;
        u_xlat16_25 = dot(_AdditionalLightsSpotDir[u_xlati26].xyz, u_xlat4.xyz);
        u_xlat16_25 = u_xlat16_25 * _AdditionalLightsAttenuation[u_xlati26].z + _AdditionalLightsAttenuation[u_xlati26].w;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_25 = min(max(u_xlat16_25, 0.0), 1.0);
#else
        u_xlat16_25 = clamp(u_xlat16_25, 0.0, 1.0);
#endif
        u_xlat16_25 = u_xlat16_25 * u_xlat16_25;
        u_xlat38 = u_xlat16_25 * u_xlat38;
        u_xlat16_10.xyz = vec3(u_xlat38) * _AdditionalLightsColor[u_xlati26].xyz;
        u_xlat16_25 = dot(vs_TEXCOORD3.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
        u_xlat16_25 = min(max(u_xlat16_25, 0.0), 1.0);
#else
        u_xlat16_25 = clamp(u_xlat16_25, 0.0, 1.0);
#endif
        u_xlat16_8.xyz = u_xlat16_10.xyz * vec3(u_xlat16_25) + u_xlat16_8.xyz;
        u_xlat4.xyz = vs_TEXCOORD4.xyz * vec3(u_xlat16_13) + u_xlat4.xyz;
        u_xlat26 = dot(u_xlat4.xyz, u_xlat4.xyz);
        u_xlat26 = max(u_xlat26, 1.17549435e-38);
        u_xlat16_25 = inversesqrt(u_xlat26);
        u_xlat4.xyz = vec3(u_xlat16_25) * u_xlat4.xyz;
        u_xlat26 = dot(vs_TEXCOORD3.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
        u_xlat26 = min(max(u_xlat26, 0.0), 1.0);
#else
        u_xlat26 = clamp(u_xlat26, 0.0, 1.0);
#endif
        u_xlat16_25 = log2(u_xlat26);
        u_xlat16_25 = u_xlat16_25 * u_xlat16_1;
        u_xlat16_25 = exp2(u_xlat16_25);
        u_xlat16_11.xyz = vec3(u_xlat16_25) * _SpecColor.xyz;
        u_xlat16_9.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz + u_xlat16_9.xyz;
    }
    SV_Target0.xyz = u_xlat16_8.xyz * u_xlat16_0.xyz + u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(_Surface==1.0);
#else
    u_xlatb2.x = _Surface==1.0;
#endif
    SV_Target0.w = (u_xlatb2.x) ? u_xlat16_0.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles " {
Local Keywords { "_ALPHAPREMULTIPLY_ON" "_RECEIVE_SHADOWS_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _BaseMap_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlatb22 = unity_OrthoParams.w==0.0;
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	mediump vec4 unity_LightData;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump float _Surface;
uniform lowp sampler2D _BaseMap;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
bool u_xlatb3;
mediump float u_xlat16_12;
void main()
{
    u_xlat16_0.xyz = _MainLightColor.xyz * unity_LightData.zzz;
    u_xlat16_12 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
    u_xlat16_12 = clamp(u_xlat16_12, 0.0, 1.0);
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(u_xlat16_12) + vs_TEXCOORD1.xyz;
    u_xlat10_1 = texture2D(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat10_1 * _BaseColor;
    u_xlat16_2.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
    u_xlatb3 = _Surface==1.0;
    SV_Target0.w = (u_xlatb3) ? u_xlat16_1.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_ADDITIONAL_LIGHTS" "_MAIN_LIGHT_SHADOWS" "_MAIN_LIGHT_SHADOWS_CASCADE" }
Local Keywords { "_GLOSSINESS_FROM_BASE_ALPHA" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb22 = unity_OrthoParams.w==0.0;
#endif
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
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
vec4 ImmCB_0[4];
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	mediump vec4 _AdditionalLightsCount;
uniform 	vec4 _AdditionalLightsPosition[16];
uniform 	mediump vec4 _AdditionalLightsColor[16];
uniform 	mediump vec4 _AdditionalLightsAttenuation[16];
uniform 	mediump vec4 _AdditionalLightsSpotDir[16];
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4_MainLightWorldToShadow[20];
uniform 	vec4 _CascadeShadowSplitSpheres0;
uniform 	vec4 _CascadeShadowSplitSpheres1;
uniform 	vec4 _CascadeShadowSplitSpheres2;
uniform 	vec4 _CascadeShadowSplitSpheres3;
uniform 	vec4 _CascadeShadowSplitSphereRadii;
uniform 	mediump vec4 _MainLightShadowParams;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainLightShadowmapTexture;
UNITY_LOCATION(2) uniform mediump sampler2DShadow hlslcc_zcmp_MainLightShadowmapTexture;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump float u_xlat16_1;
int u_xlati1;
uint u_xlatu1;
bvec4 u_xlatb1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat9;
uint u_xlatu9;
bool u_xlatb9;
mediump float u_xlat16_13;
int u_xlati17;
bool u_xlatb17;
mediump float u_xlat16_21;
float u_xlat25;
uint u_xlatu25;
float u_xlat27;
mediump float u_xlat16_29;
void main()
{
ImmCB_0[0] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.0,1.0,0.0,0.0);
ImmCB_0[2] = vec4(0.0,0.0,1.0,0.0);
ImmCB_0[3] = vec4(0.0,0.0,0.0,1.0);
    u_xlat16_0 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * _BaseColor;
    u_xlat1.xyz = vs_TEXCOORD2.xyz + (-_CascadeShadowSplitSpheres0.xyz);
    u_xlat2.xyz = vs_TEXCOORD2.xyz + (-_CascadeShadowSplitSpheres1.xyz);
    u_xlat3.xyz = vs_TEXCOORD2.xyz + (-_CascadeShadowSplitSpheres2.xyz);
    u_xlat4.xyz = vs_TEXCOORD2.xyz + (-_CascadeShadowSplitSpheres3.xyz);
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.y = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.z = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat1.w = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlatb1 = lessThan(u_xlat1, _CascadeShadowSplitSphereRadii);
    u_xlat16_2.x = (u_xlatb1.x) ? float(1.0) : float(0.0);
    u_xlat16_2.y = (u_xlatb1.y) ? float(1.0) : float(0.0);
    u_xlat16_2.z = (u_xlatb1.z) ? float(1.0) : float(0.0);
    u_xlat16_2.w = (u_xlatb1.w) ? float(1.0) : float(0.0);
    u_xlat16_5.x = (u_xlatb1.x) ? float(-1.0) : float(-0.0);
    u_xlat16_5.y = (u_xlatb1.y) ? float(-1.0) : float(-0.0);
    u_xlat16_5.z = (u_xlatb1.z) ? float(-1.0) : float(-0.0);
    u_xlat16_5.xyz = u_xlat16_2.yzw + u_xlat16_5.xyz;
    u_xlat16_2.yzw = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.x = dot(u_xlat16_2, vec4(4.0, 3.0, 2.0, 1.0));
    u_xlat16_5.x = (-u_xlat16_5.x) + 4.0;
    u_xlatu1 = uint(u_xlat16_5.x);
    u_xlati1 = int(int(u_xlatu1) << 2);
    u_xlat9.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4_MainLightWorldToShadow[(u_xlati1 + 1)].xyz;
    u_xlat9.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[u_xlati1].xyz * vs_TEXCOORD2.xxx + u_xlat9.xyz;
    u_xlat9.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[(u_xlati1 + 2)].xyz * vs_TEXCOORD2.zzz + u_xlat9.xyz;
    u_xlat1.xyz = u_xlat9.xyz + hlslcc_mtx4x4_MainLightWorldToShadow[(u_xlati1 + 3)].xyz;
    vec3 txVec0 = vec3(u_xlat1.xy,u_xlat1.z);
    u_xlat16_1 = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec0, 0.0);
    u_xlat16_5.x = (-_MainLightShadowParams.x) + 1.0;
    u_xlat16_5.x = u_xlat16_1 * _MainLightShadowParams.x + u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(0.0>=u_xlat1.z);
#else
    u_xlatb1.x = 0.0>=u_xlat1.z;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat1.z>=1.0);
#else
    u_xlatb9 = u_xlat1.z>=1.0;
#endif
    u_xlatb1.x = u_xlatb9 || u_xlatb1.x;
    u_xlat16_5.x = (u_xlatb1.x) ? 1.0 : u_xlat16_5.x;
    u_xlat1.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = u_xlat1.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_13 = u_xlat1.x * u_xlat1.x;
    u_xlat16_21 = (-u_xlat16_5.x) + 1.0;
    u_xlat16_5.x = u_xlat16_13 * u_xlat16_21 + u_xlat16_5.x;
    u_xlat16_5.x = u_xlat16_5.x * unity_LightData.z;
    u_xlat16_5.xyz = u_xlat16_5.xxx * _MainLightColor.xyz;
    u_xlat16_29 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_29 = min(max(u_xlat16_29, 0.0), 1.0);
#else
    u_xlat16_29 = clamp(u_xlat16_29, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(u_xlat16_29) + vs_TEXCOORD1.xyz;
    u_xlat16_29 = min(_AdditionalLightsCount.x, unity_LightData.y);
    u_xlatu1 =  uint(int(u_xlat16_29));
    u_xlat16_6.xyz = u_xlat16_5.xyz;
    for(uint u_xlatu_loop_1 = uint(0u) ; u_xlatu_loop_1<u_xlatu1 ; u_xlatu_loop_1++)
    {
        u_xlati17 = int(uint(u_xlatu_loop_1 & 3u));
        u_xlatu25 = uint(u_xlatu_loop_1 >> 2u);
        u_xlat16_29 = dot(unity_LightIndices[int(u_xlatu25)], ImmCB_0[u_xlati17]);
        u_xlati17 = int(u_xlat16_29);
        u_xlat3.xyz = (-vs_TEXCOORD2.xyz) * _AdditionalLightsPosition[u_xlati17].www + _AdditionalLightsPosition[u_xlati17].xyz;
        u_xlat25 = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat25 = max(u_xlat25, 6.10351562e-05);
        u_xlat27 = inversesqrt(u_xlat25);
        u_xlat3.xyz = vec3(u_xlat27) * u_xlat3.xyz;
        u_xlat27 = float(1.0) / float(u_xlat25);
        u_xlat25 = u_xlat25 * _AdditionalLightsAttenuation[u_xlati17].x + _AdditionalLightsAttenuation[u_xlati17].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat25 = min(max(u_xlat25, 0.0), 1.0);
#else
        u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
#endif
        u_xlat25 = u_xlat25 * u_xlat27;
        u_xlat16_29 = dot(_AdditionalLightsSpotDir[u_xlati17].xyz, u_xlat3.xyz);
        u_xlat16_29 = u_xlat16_29 * _AdditionalLightsAttenuation[u_xlati17].z + _AdditionalLightsAttenuation[u_xlati17].w;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_29 = min(max(u_xlat16_29, 0.0), 1.0);
#else
        u_xlat16_29 = clamp(u_xlat16_29, 0.0, 1.0);
#endif
        u_xlat16_29 = u_xlat16_29 * u_xlat16_29;
        u_xlat25 = u_xlat25 * u_xlat16_29;
        u_xlat16_7.xyz = vec3(u_xlat25) * _AdditionalLightsColor[u_xlati17].xyz;
        u_xlat16_29 = dot(vs_TEXCOORD3.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
        u_xlat16_29 = min(max(u_xlat16_29, 0.0), 1.0);
#else
        u_xlat16_29 = clamp(u_xlat16_29, 0.0, 1.0);
#endif
        u_xlat16_6.xyz = u_xlat16_7.xyz * vec3(u_xlat16_29) + u_xlat16_6.xyz;
    }
    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(_Surface==1.0);
#else
    u_xlatb1.x = _Surface==1.0;
#endif
    SV_Target0.w = (u_xlatb1.x) ? u_xlat16_0.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles " {
Local Keywords { "_GLOSSINESS_FROM_BASE_ALPHA" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _BaseMap_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlatb22 = unity_OrthoParams.w==0.0;
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	mediump vec4 unity_LightData;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump float _Surface;
uniform lowp sampler2D _BaseMap;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
bool u_xlatb2;
mediump float u_xlat16_9;
void main()
{
    u_xlat16_0.xyz = _MainLightColor.xyz * unity_LightData.zzz;
    u_xlat16_9 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
    u_xlat16_9 = clamp(u_xlat16_9, 0.0, 1.0);
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(u_xlat16_9) + vs_TEXCOORD1.xyz;
    u_xlat10_1 = texture2D(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat10_1 * _BaseColor;
    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlatb2 = _Surface==1.0;
    SV_Target0.w = (u_xlatb2) ? u_xlat16_1.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_ADDITIONAL_LIGHTS" "_MAIN_LIGHT_SHADOWS" "_MAIN_LIGHT_SHADOWS_CASCADE" }
Local Keywords { "_ALPHAPREMULTIPLY_ON" "_RECEIVE_SHADOWS_OFF" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb22 = unity_OrthoParams.w==0.0;
#endif
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
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
vec4 ImmCB_0[4];
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	mediump vec4 _AdditionalLightsCount;
uniform 	vec4 _AdditionalLightsPosition[16];
uniform 	mediump vec4 _AdditionalLightsColor[16];
uniform 	mediump vec4 _AdditionalLightsAttenuation[16];
uniform 	mediump vec4 _AdditionalLightsSpotDir[16];
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
uint u_xlatu3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
uint u_xlatu10;
int u_xlati17;
bool u_xlatb17;
mediump float u_xlat16_22;
float u_xlat24;
uint u_xlatu24;
float u_xlat26;
void main()
{
ImmCB_0[0] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.0,1.0,0.0,0.0);
ImmCB_0[2] = vec4(0.0,0.0,1.0,0.0);
ImmCB_0[3] = vec4(0.0,0.0,0.0,1.0);
    u_xlat16_0 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * _BaseColor;
    u_xlat16_1.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat16_2.xyz = _MainLightColor.xyz * unity_LightData.zzz;
    u_xlat16_22 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_22 = min(max(u_xlat16_22, 0.0), 1.0);
#else
    u_xlat16_22 = clamp(u_xlat16_22, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_22) + vs_TEXCOORD1.xyz;
    u_xlat16_22 = min(_AdditionalLightsCount.x, unity_LightData.y);
    u_xlatu3 =  uint(int(u_xlat16_22));
    u_xlat16_4.xyz = u_xlat16_2.xyz;
    for(uint u_xlatu_loop_1 = uint(0u) ; u_xlatu_loop_1<u_xlatu3 ; u_xlatu_loop_1++)
    {
        u_xlati17 = int(uint(u_xlatu_loop_1 & 3u));
        u_xlatu24 = uint(u_xlatu_loop_1 >> 2u);
        u_xlat16_22 = dot(unity_LightIndices[int(u_xlatu24)], ImmCB_0[u_xlati17]);
        u_xlati17 = int(u_xlat16_22);
        u_xlat5.xyz = (-vs_TEXCOORD2.xyz) * _AdditionalLightsPosition[u_xlati17].www + _AdditionalLightsPosition[u_xlati17].xyz;
        u_xlat24 = dot(u_xlat5.xyz, u_xlat5.xyz);
        u_xlat24 = max(u_xlat24, 6.10351562e-05);
        u_xlat26 = inversesqrt(u_xlat24);
        u_xlat5.xyz = vec3(u_xlat26) * u_xlat5.xyz;
        u_xlat26 = float(1.0) / float(u_xlat24);
        u_xlat24 = u_xlat24 * _AdditionalLightsAttenuation[u_xlati17].x + _AdditionalLightsAttenuation[u_xlati17].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
        u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
        u_xlat24 = u_xlat24 * u_xlat26;
        u_xlat16_22 = dot(_AdditionalLightsSpotDir[u_xlati17].xyz, u_xlat5.xyz);
        u_xlat16_22 = u_xlat16_22 * _AdditionalLightsAttenuation[u_xlati17].z + _AdditionalLightsAttenuation[u_xlati17].w;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_22 = min(max(u_xlat16_22, 0.0), 1.0);
#else
        u_xlat16_22 = clamp(u_xlat16_22, 0.0, 1.0);
#endif
        u_xlat16_22 = u_xlat16_22 * u_xlat16_22;
        u_xlat24 = u_xlat16_22 * u_xlat24;
        u_xlat16_6.xyz = vec3(u_xlat24) * _AdditionalLightsColor[u_xlati17].xyz;
        u_xlat16_22 = dot(vs_TEXCOORD3.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
        u_xlat16_22 = min(max(u_xlat16_22, 0.0), 1.0);
#else
        u_xlat16_22 = clamp(u_xlat16_22, 0.0, 1.0);
#endif
        u_xlat16_4.xyz = u_xlat16_6.xyz * vec3(u_xlat16_22) + u_xlat16_4.xyz;
    }
    SV_Target0.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_Surface==1.0);
#else
    u_xlatb3 = _Surface==1.0;
#endif
    SV_Target0.w = (u_xlatb3) ? u_xlat16_0.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles " {
Local Keywords { "_GLOSSINESS_FROM_BASE_ALPHA" "_SPECULAR_COLOR" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _BaseMap_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlatb22 = unity_OrthoParams.w==0.0;
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	mediump vec4 unity_LightData;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _SpecColor;
uniform 	mediump float _Surface;
uniform lowp sampler2D _BaseMap;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb3;
mediump float u_xlat16_5;
float u_xlat12;
mediump float u_xlat16_13;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = vs_TEXCOORD4.xyz * u_xlat16_1.xxx + _MainLightPosition.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat12);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_1.x = log2(u_xlat0.x);
    u_xlat10_0 = texture2D(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _BaseColor;
    u_xlat16_5 = u_xlat16_0.w * 10.0 + 1.0;
    u_xlat16_5 = exp2(u_xlat16_5);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_5;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * _SpecColor.xyz;
    u_xlat16_2.xyz = _MainLightColor.xyz * unity_LightData.zzz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_13 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
    u_xlat16_13 = clamp(u_xlat16_13, 0.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_13) + vs_TEXCOORD1.xyz;
    SV_Target0.xyz = u_xlat16_2.xyz * u_xlat16_0.xyz + u_xlat16_1.xyz;
    u_xlatb3 = _Surface==1.0;
    SV_Target0.w = (u_xlatb3) ? u_xlat16_0.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_ADDITIONAL_LIGHTS" "_MAIN_LIGHT_SHADOWS" "_MAIN_LIGHT_SHADOWS_CASCADE" }
Local Keywords { "_ALPHAPREMULTIPLY_ON" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb22 = unity_OrthoParams.w==0.0;
#endif
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
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
vec4 ImmCB_0[4];
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	mediump vec4 _AdditionalLightsCount;
uniform 	vec4 _AdditionalLightsPosition[16];
uniform 	mediump vec4 _AdditionalLightsColor[16];
uniform 	mediump vec4 _AdditionalLightsAttenuation[16];
uniform 	mediump vec4 _AdditionalLightsSpotDir[16];
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4_MainLightWorldToShadow[20];
uniform 	vec4 _CascadeShadowSplitSpheres0;
uniform 	vec4 _CascadeShadowSplitSpheres1;
uniform 	vec4 _CascadeShadowSplitSpheres2;
uniform 	vec4 _CascadeShadowSplitSpheres3;
uniform 	vec4 _CascadeShadowSplitSphereRadii;
uniform 	mediump vec4 _MainLightShadowParams;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainLightShadowmapTexture;
UNITY_LOCATION(2) uniform mediump sampler2DShadow hlslcc_zcmp_MainLightShadowmapTexture;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump float u_xlat16_2;
int u_xlati2;
uint u_xlatu2;
bvec4 u_xlatb2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat11;
uint u_xlatu11;
bool u_xlatb11;
mediump float u_xlat16_15;
int u_xlati20;
bool u_xlatb20;
mediump float u_xlat16_28;
float u_xlat29;
uint u_xlatu29;
float u_xlat31;
void main()
{
ImmCB_0[0] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.0,1.0,0.0,0.0);
ImmCB_0[2] = vec4(0.0,0.0,1.0,0.0);
ImmCB_0[3] = vec4(0.0,0.0,0.0,1.0);
    u_xlat16_0 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * _BaseColor;
    u_xlat16_1.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat2.xyz = vs_TEXCOORD2.xyz + (-_CascadeShadowSplitSpheres0.xyz);
    u_xlat3.xyz = vs_TEXCOORD2.xyz + (-_CascadeShadowSplitSpheres1.xyz);
    u_xlat4.xyz = vs_TEXCOORD2.xyz + (-_CascadeShadowSplitSpheres2.xyz);
    u_xlat5.xyz = vs_TEXCOORD2.xyz + (-_CascadeShadowSplitSpheres3.xyz);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.y = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat2.z = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat2.w = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlatb2 = lessThan(u_xlat2, _CascadeShadowSplitSphereRadii);
    u_xlat16_3.x = (u_xlatb2.x) ? float(1.0) : float(0.0);
    u_xlat16_3.y = (u_xlatb2.y) ? float(1.0) : float(0.0);
    u_xlat16_3.z = (u_xlatb2.z) ? float(1.0) : float(0.0);
    u_xlat16_3.w = (u_xlatb2.w) ? float(1.0) : float(0.0);
    u_xlat16_6.x = (u_xlatb2.x) ? float(-1.0) : float(-0.0);
    u_xlat16_6.y = (u_xlatb2.y) ? float(-1.0) : float(-0.0);
    u_xlat16_6.z = (u_xlatb2.z) ? float(-1.0) : float(-0.0);
    u_xlat16_6.xyz = u_xlat16_3.yzw + u_xlat16_6.xyz;
    u_xlat16_3.yzw = max(u_xlat16_6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_28 = dot(u_xlat16_3, vec4(4.0, 3.0, 2.0, 1.0));
    u_xlat16_28 = (-u_xlat16_28) + 4.0;
    u_xlatu2 = uint(u_xlat16_28);
    u_xlati2 = int(int(u_xlatu2) << 2);
    u_xlat11.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4_MainLightWorldToShadow[(u_xlati2 + 1)].xyz;
    u_xlat11.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[u_xlati2].xyz * vs_TEXCOORD2.xxx + u_xlat11.xyz;
    u_xlat11.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[(u_xlati2 + 2)].xyz * vs_TEXCOORD2.zzz + u_xlat11.xyz;
    u_xlat2.xyz = u_xlat11.xyz + hlslcc_mtx4x4_MainLightWorldToShadow[(u_xlati2 + 3)].xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat16_2 = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec0, 0.0);
    u_xlat16_28 = (-_MainLightShadowParams.x) + 1.0;
    u_xlat16_28 = u_xlat16_2 * _MainLightShadowParams.x + u_xlat16_28;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(0.0>=u_xlat2.z);
#else
    u_xlatb2.x = 0.0>=u_xlat2.z;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(u_xlat2.z>=1.0);
#else
    u_xlatb11 = u_xlat2.z>=1.0;
#endif
    u_xlatb2.x = u_xlatb11 || u_xlatb2.x;
    u_xlat16_28 = (u_xlatb2.x) ? 1.0 : u_xlat16_28;
    u_xlat2.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.x = u_xlat2.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat2.x * u_xlat2.x;
    u_xlat16_15 = (-u_xlat16_28) + 1.0;
    u_xlat16_28 = u_xlat16_6.x * u_xlat16_15 + u_xlat16_28;
    u_xlat16_28 = u_xlat16_28 * unity_LightData.z;
    u_xlat16_6.xyz = vec3(u_xlat16_28) * _MainLightColor.xyz;
    u_xlat16_28 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_28 = min(max(u_xlat16_28, 0.0), 1.0);
#else
    u_xlat16_28 = clamp(u_xlat16_28, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(u_xlat16_28) + vs_TEXCOORD1.xyz;
    u_xlat16_28 = min(_AdditionalLightsCount.x, unity_LightData.y);
    u_xlatu2 =  uint(int(u_xlat16_28));
    u_xlat16_7.xyz = u_xlat16_6.xyz;
    for(uint u_xlatu_loop_1 = uint(0u) ; u_xlatu_loop_1<u_xlatu2 ; u_xlatu_loop_1++)
    {
        u_xlati20 = int(uint(u_xlatu_loop_1 & 3u));
        u_xlatu29 = uint(u_xlatu_loop_1 >> 2u);
        u_xlat16_28 = dot(unity_LightIndices[int(u_xlatu29)], ImmCB_0[u_xlati20]);
        u_xlati20 = int(u_xlat16_28);
        u_xlat4.xyz = (-vs_TEXCOORD2.xyz) * _AdditionalLightsPosition[u_xlati20].www + _AdditionalLightsPosition[u_xlati20].xyz;
        u_xlat29 = dot(u_xlat4.xyz, u_xlat4.xyz);
        u_xlat29 = max(u_xlat29, 6.10351562e-05);
        u_xlat31 = inversesqrt(u_xlat29);
        u_xlat4.xyz = vec3(u_xlat31) * u_xlat4.xyz;
        u_xlat31 = float(1.0) / float(u_xlat29);
        u_xlat29 = u_xlat29 * _AdditionalLightsAttenuation[u_xlati20].x + _AdditionalLightsAttenuation[u_xlati20].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat29 = min(max(u_xlat29, 0.0), 1.0);
#else
        u_xlat29 = clamp(u_xlat29, 0.0, 1.0);
#endif
        u_xlat29 = u_xlat29 * u_xlat31;
        u_xlat16_28 = dot(_AdditionalLightsSpotDir[u_xlati20].xyz, u_xlat4.xyz);
        u_xlat16_28 = u_xlat16_28 * _AdditionalLightsAttenuation[u_xlati20].z + _AdditionalLightsAttenuation[u_xlati20].w;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_28 = min(max(u_xlat16_28, 0.0), 1.0);
#else
        u_xlat16_28 = clamp(u_xlat16_28, 0.0, 1.0);
#endif
        u_xlat16_28 = u_xlat16_28 * u_xlat16_28;
        u_xlat29 = u_xlat16_28 * u_xlat29;
        u_xlat16_8.xyz = vec3(u_xlat29) * _AdditionalLightsColor[u_xlati20].xyz;
        u_xlat16_28 = dot(vs_TEXCOORD3.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
        u_xlat16_28 = min(max(u_xlat16_28, 0.0), 1.0);
#else
        u_xlat16_28 = clamp(u_xlat16_28, 0.0, 1.0);
#endif
        u_xlat16_7.xyz = u_xlat16_8.xyz * vec3(u_xlat16_28) + u_xlat16_7.xyz;
    }
    SV_Target0.xyz = u_xlat16_1.xyz * u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(_Surface==1.0);
#else
    u_xlatb2.x = _Surface==1.0;
#endif
    SV_Target0.w = (u_xlatb2.x) ? u_xlat16_0.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles " {
Local Keywords { "_EMISSION" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _BaseMap_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlatb22 = unity_OrthoParams.w==0.0;
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	mediump vec4 unity_LightData;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump float _Surface;
uniform lowp sampler2D _BaseMap;
uniform lowp sampler2D _EmissionMap;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
mediump float u_xlat16_9;
void main()
{
    u_xlat16_0.xyz = _MainLightColor.xyz * unity_LightData.zzz;
    u_xlat16_9 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
    u_xlat16_9 = clamp(u_xlat16_9, 0.0, 1.0);
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(u_xlat16_9) + vs_TEXCOORD1.xyz;
    u_xlat10_1.xyz = texture2D(_EmissionMap, vs_TEXCOORD0.xy).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * _EmissionColor.xyz;
    u_xlat10_2 = texture2D(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_2 = u_xlat10_2 * _BaseColor;
    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz + u_xlat1.xyz;
    u_xlatb1 = _Surface==1.0;
    SV_Target0.w = (u_xlatb1) ? u_xlat16_2.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_ADDITIONAL_LIGHTS" "_MAIN_LIGHT_SHADOWS" "_MAIN_LIGHT_SHADOWS_CASCADE" }
Local Keywords { "_RECEIVE_SHADOWS_OFF" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb22 = unity_OrthoParams.w==0.0;
#endif
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
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
vec4 ImmCB_0[4];
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	mediump vec4 _AdditionalLightsCount;
uniform 	vec4 _AdditionalLightsPosition[16];
uniform 	mediump vec4 _AdditionalLightsColor[16];
uniform 	mediump vec4 _AdditionalLightsAttenuation[16];
uniform 	mediump vec4 _AdditionalLightsSpotDir[16];
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
uint u_xlatu2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
uint u_xlatu8;
int u_xlati14;
bool u_xlatb14;
mediump float u_xlat16_19;
float u_xlat20;
uint u_xlatu20;
float u_xlat22;
void main()
{
ImmCB_0[0] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.0,1.0,0.0,0.0);
ImmCB_0[2] = vec4(0.0,0.0,1.0,0.0);
ImmCB_0[3] = vec4(0.0,0.0,0.0,1.0);
    u_xlat16_0 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * _BaseColor;
    u_xlat16_1.xyz = _MainLightColor.xyz * unity_LightData.zzz;
    u_xlat16_19 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19 = min(max(u_xlat16_19, 0.0), 1.0);
#else
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(u_xlat16_19) + vs_TEXCOORD1.xyz;
    u_xlat16_19 = min(_AdditionalLightsCount.x, unity_LightData.y);
    u_xlatu2 =  uint(int(u_xlat16_19));
    u_xlat16_3.xyz = u_xlat16_1.xyz;
    for(uint u_xlatu_loop_1 = uint(0u) ; u_xlatu_loop_1<u_xlatu2 ; u_xlatu_loop_1++)
    {
        u_xlati14 = int(uint(u_xlatu_loop_1 & 3u));
        u_xlatu20 = uint(u_xlatu_loop_1 >> 2u);
        u_xlat16_19 = dot(unity_LightIndices[int(u_xlatu20)], ImmCB_0[u_xlati14]);
        u_xlati14 = int(u_xlat16_19);
        u_xlat4.xyz = (-vs_TEXCOORD2.xyz) * _AdditionalLightsPosition[u_xlati14].www + _AdditionalLightsPosition[u_xlati14].xyz;
        u_xlat20 = dot(u_xlat4.xyz, u_xlat4.xyz);
        u_xlat20 = max(u_xlat20, 6.10351562e-05);
        u_xlat22 = inversesqrt(u_xlat20);
        u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz;
        u_xlat22 = float(1.0) / float(u_xlat20);
        u_xlat20 = u_xlat20 * _AdditionalLightsAttenuation[u_xlati14].x + _AdditionalLightsAttenuation[u_xlati14].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
        u_xlat20 = u_xlat20 * u_xlat22;
        u_xlat16_19 = dot(_AdditionalLightsSpotDir[u_xlati14].xyz, u_xlat4.xyz);
        u_xlat16_19 = u_xlat16_19 * _AdditionalLightsAttenuation[u_xlati14].z + _AdditionalLightsAttenuation[u_xlati14].w;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_19 = min(max(u_xlat16_19, 0.0), 1.0);
#else
        u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
#endif
        u_xlat16_19 = u_xlat16_19 * u_xlat16_19;
        u_xlat20 = u_xlat16_19 * u_xlat20;
        u_xlat16_5.xyz = vec3(u_xlat20) * _AdditionalLightsColor[u_xlati14].xyz;
        u_xlat16_19 = dot(vs_TEXCOORD3.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
        u_xlat16_19 = min(max(u_xlat16_19, 0.0), 1.0);
#else
        u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
#endif
        u_xlat16_3.xyz = u_xlat16_5.xyz * vec3(u_xlat16_19) + u_xlat16_3.xyz;
    }
    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_Surface==1.0);
#else
    u_xlatb2 = _Surface==1.0;
#endif
    SV_Target0.w = (u_xlatb2) ? u_xlat16_0.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles " {
Local Keywords { "_EMISSION" "_GLOSSINESS_FROM_BASE_ALPHA" "_SPECULAR_COLOR" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _BaseMap_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlatb22 = unity_OrthoParams.w==0.0;
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	mediump vec4 unity_LightData;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _SpecColor;
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump float _Surface;
uniform lowp sampler2D _BaseMap;
uniform lowp sampler2D _EmissionMap;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_6;
float u_xlat15;
mediump float u_xlat16_16;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = vs_TEXCOORD4.xyz * u_xlat16_1.xxx + _MainLightPosition.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat15);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_1.x = log2(u_xlat0.x);
    u_xlat10_0 = texture2D(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _BaseColor;
    u_xlat16_6 = u_xlat16_0.w * 10.0 + 1.0;
    u_xlat16_6 = exp2(u_xlat16_6);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_6;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * _SpecColor.xyz;
    u_xlat10_2.xyz = texture2D(_EmissionMap, vs_TEXCOORD0.xy).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * _EmissionColor.xyz;
    u_xlat16_16 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
    u_xlat16_16 = clamp(u_xlat16_16, 0.0, 1.0);
    u_xlat16_3.xyz = _MainLightColor.xyz * unity_LightData.zzz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(u_xlat16_16) + vs_TEXCOORD1.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_0.xyz + u_xlat2.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * u_xlat16_1.xyz + u_xlat16_4.xyz;
    u_xlatb2 = _Surface==1.0;
    SV_Target0.w = (u_xlatb2) ? u_xlat16_0.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_ADDITIONAL_LIGHTS" "_MAIN_LIGHT_SHADOWS" "_MAIN_LIGHT_SHADOWS_CASCADE" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb22 = unity_OrthoParams.w==0.0;
#endif
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
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
vec4 ImmCB_0[4];
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	mediump vec4 _AdditionalLightsCount;
uniform 	vec4 _AdditionalLightsPosition[16];
uniform 	mediump vec4 _AdditionalLightsColor[16];
uniform 	mediump vec4 _AdditionalLightsAttenuation[16];
uniform 	mediump vec4 _AdditionalLightsSpotDir[16];
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4_MainLightWorldToShadow[20];
uniform 	vec4 _CascadeShadowSplitSpheres0;
uniform 	vec4 _CascadeShadowSplitSpheres1;
uniform 	vec4 _CascadeShadowSplitSpheres2;
uniform 	vec4 _CascadeShadowSplitSpheres3;
uniform 	vec4 _CascadeShadowSplitSphereRadii;
uniform 	mediump vec4 _MainLightShadowParams;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainLightShadowmapTexture;
UNITY_LOCATION(2) uniform mediump sampler2DShadow hlslcc_zcmp_MainLightShadowmapTexture;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump float u_xlat16_1;
int u_xlati1;
uint u_xlatu1;
bvec4 u_xlatb1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat9;
uint u_xlatu9;
bool u_xlatb9;
mediump float u_xlat16_13;
int u_xlati17;
bool u_xlatb17;
mediump float u_xlat16_21;
float u_xlat25;
uint u_xlatu25;
float u_xlat27;
mediump float u_xlat16_29;
void main()
{
ImmCB_0[0] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.0,1.0,0.0,0.0);
ImmCB_0[2] = vec4(0.0,0.0,1.0,0.0);
ImmCB_0[3] = vec4(0.0,0.0,0.0,1.0);
    u_xlat16_0 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * _BaseColor;
    u_xlat1.xyz = vs_TEXCOORD2.xyz + (-_CascadeShadowSplitSpheres0.xyz);
    u_xlat2.xyz = vs_TEXCOORD2.xyz + (-_CascadeShadowSplitSpheres1.xyz);
    u_xlat3.xyz = vs_TEXCOORD2.xyz + (-_CascadeShadowSplitSpheres2.xyz);
    u_xlat4.xyz = vs_TEXCOORD2.xyz + (-_CascadeShadowSplitSpheres3.xyz);
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.y = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.z = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat1.w = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlatb1 = lessThan(u_xlat1, _CascadeShadowSplitSphereRadii);
    u_xlat16_2.x = (u_xlatb1.x) ? float(1.0) : float(0.0);
    u_xlat16_2.y = (u_xlatb1.y) ? float(1.0) : float(0.0);
    u_xlat16_2.z = (u_xlatb1.z) ? float(1.0) : float(0.0);
    u_xlat16_2.w = (u_xlatb1.w) ? float(1.0) : float(0.0);
    u_xlat16_5.x = (u_xlatb1.x) ? float(-1.0) : float(-0.0);
    u_xlat16_5.y = (u_xlatb1.y) ? float(-1.0) : float(-0.0);
    u_xlat16_5.z = (u_xlatb1.z) ? float(-1.0) : float(-0.0);
    u_xlat16_5.xyz = u_xlat16_2.yzw + u_xlat16_5.xyz;
    u_xlat16_2.yzw = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.x = dot(u_xlat16_2, vec4(4.0, 3.0, 2.0, 1.0));
    u_xlat16_5.x = (-u_xlat16_5.x) + 4.0;
    u_xlatu1 = uint(u_xlat16_5.x);
    u_xlati1 = int(int(u_xlatu1) << 2);
    u_xlat9.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4_MainLightWorldToShadow[(u_xlati1 + 1)].xyz;
    u_xlat9.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[u_xlati1].xyz * vs_TEXCOORD2.xxx + u_xlat9.xyz;
    u_xlat9.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[(u_xlati1 + 2)].xyz * vs_TEXCOORD2.zzz + u_xlat9.xyz;
    u_xlat1.xyz = u_xlat9.xyz + hlslcc_mtx4x4_MainLightWorldToShadow[(u_xlati1 + 3)].xyz;
    vec3 txVec0 = vec3(u_xlat1.xy,u_xlat1.z);
    u_xlat16_1 = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec0, 0.0);
    u_xlat16_5.x = (-_MainLightShadowParams.x) + 1.0;
    u_xlat16_5.x = u_xlat16_1 * _MainLightShadowParams.x + u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(0.0>=u_xlat1.z);
#else
    u_xlatb1.x = 0.0>=u_xlat1.z;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat1.z>=1.0);
#else
    u_xlatb9 = u_xlat1.z>=1.0;
#endif
    u_xlatb1.x = u_xlatb9 || u_xlatb1.x;
    u_xlat16_5.x = (u_xlatb1.x) ? 1.0 : u_xlat16_5.x;
    u_xlat1.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = u_xlat1.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_13 = u_xlat1.x * u_xlat1.x;
    u_xlat16_21 = (-u_xlat16_5.x) + 1.0;
    u_xlat16_5.x = u_xlat16_13 * u_xlat16_21 + u_xlat16_5.x;
    u_xlat16_5.x = u_xlat16_5.x * unity_LightData.z;
    u_xlat16_5.xyz = u_xlat16_5.xxx * _MainLightColor.xyz;
    u_xlat16_29 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_29 = min(max(u_xlat16_29, 0.0), 1.0);
#else
    u_xlat16_29 = clamp(u_xlat16_29, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(u_xlat16_29) + vs_TEXCOORD1.xyz;
    u_xlat16_29 = min(_AdditionalLightsCount.x, unity_LightData.y);
    u_xlatu1 =  uint(int(u_xlat16_29));
    u_xlat16_6.xyz = u_xlat16_5.xyz;
    for(uint u_xlatu_loop_1 = uint(0u) ; u_xlatu_loop_1<u_xlatu1 ; u_xlatu_loop_1++)
    {
        u_xlati17 = int(uint(u_xlatu_loop_1 & 3u));
        u_xlatu25 = uint(u_xlatu_loop_1 >> 2u);
        u_xlat16_29 = dot(unity_LightIndices[int(u_xlatu25)], ImmCB_0[u_xlati17]);
        u_xlati17 = int(u_xlat16_29);
        u_xlat3.xyz = (-vs_TEXCOORD2.xyz) * _AdditionalLightsPosition[u_xlati17].www + _AdditionalLightsPosition[u_xlati17].xyz;
        u_xlat25 = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat25 = max(u_xlat25, 6.10351562e-05);
        u_xlat27 = inversesqrt(u_xlat25);
        u_xlat3.xyz = vec3(u_xlat27) * u_xlat3.xyz;
        u_xlat27 = float(1.0) / float(u_xlat25);
        u_xlat25 = u_xlat25 * _AdditionalLightsAttenuation[u_xlati17].x + _AdditionalLightsAttenuation[u_xlati17].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat25 = min(max(u_xlat25, 0.0), 1.0);
#else
        u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
#endif
        u_xlat25 = u_xlat25 * u_xlat27;
        u_xlat16_29 = dot(_AdditionalLightsSpotDir[u_xlati17].xyz, u_xlat3.xyz);
        u_xlat16_29 = u_xlat16_29 * _AdditionalLightsAttenuation[u_xlati17].z + _AdditionalLightsAttenuation[u_xlati17].w;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_29 = min(max(u_xlat16_29, 0.0), 1.0);
#else
        u_xlat16_29 = clamp(u_xlat16_29, 0.0, 1.0);
#endif
        u_xlat16_29 = u_xlat16_29 * u_xlat16_29;
        u_xlat25 = u_xlat25 * u_xlat16_29;
        u_xlat16_7.xyz = vec3(u_xlat25) * _AdditionalLightsColor[u_xlati17].xyz;
        u_xlat16_29 = dot(vs_TEXCOORD3.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
        u_xlat16_29 = min(max(u_xlat16_29, 0.0), 1.0);
#else
        u_xlat16_29 = clamp(u_xlat16_29, 0.0, 1.0);
#endif
        u_xlat16_6.xyz = u_xlat16_7.xyz * vec3(u_xlat16_29) + u_xlat16_6.xyz;
    }
    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(_Surface==1.0);
#else
    u_xlatb1.x = _Surface==1.0;
#endif
    SV_Target0.w = (u_xlatb1.x) ? u_xlat16_0.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_MAIN_LIGHT_SHADOWS" "_MAIN_LIGHT_SHADOWS_CASCADE" }
Local Keywords { "_EMISSION" "_GLOSSINESS_FROM_BASE_ALPHA" "_SPECULAR_COLOR" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb22 = unity_OrthoParams.w==0.0;
#endif
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4_MainLightWorldToShadow[20];
uniform 	vec4 _CascadeShadowSplitSpheres0;
uniform 	vec4 _CascadeShadowSplitSpheres1;
uniform 	vec4 _CascadeShadowSplitSpheres2;
uniform 	vec4 _CascadeShadowSplitSpheres3;
uniform 	vec4 _CascadeShadowSplitSphereRadii;
uniform 	mediump vec4 _MainLightShadowParams;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
UNITY_LOCATION(1) uniform mediump sampler2D _EmissionMap;
UNITY_LOCATION(2) uniform mediump sampler2D _MainLightShadowmapTexture;
UNITY_LOCATION(3) uniform mediump sampler2DShadow hlslcc_zcmp_MainLightShadowmapTexture;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bvec4 u_xlatb0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
int u_xlati1;
uint u_xlatu1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat7;
bool u_xlatb7;
mediump float u_xlat16_8;
mediump float u_xlat16_14;
float u_xlat19;
bool u_xlatb19;
mediump float u_xlat16_20;
mediump float u_xlat16_22;
void main()
{
    u_xlat0.xyz = vs_TEXCOORD2.xyz + (-_CascadeShadowSplitSpheres0.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat1.xyz = vs_TEXCOORD2.xyz + (-_CascadeShadowSplitSpheres1.xyz);
    u_xlat0.y = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.xyz = vs_TEXCOORD2.xyz + (-_CascadeShadowSplitSpheres2.xyz);
    u_xlat0.z = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.xyz = vs_TEXCOORD2.xyz + (-_CascadeShadowSplitSpheres3.xyz);
    u_xlat0.w = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlatb0 = lessThan(u_xlat0, _CascadeShadowSplitSphereRadii);
    u_xlat16_2.x = (u_xlatb0.x) ? float(-1.0) : float(-0.0);
    u_xlat16_2.y = (u_xlatb0.y) ? float(-1.0) : float(-0.0);
    u_xlat16_2.z = (u_xlatb0.z) ? float(-1.0) : float(-0.0);
    u_xlat16_0.x = (u_xlatb0.x) ? float(1.0) : float(0.0);
    u_xlat16_0.y = (u_xlatb0.y) ? float(1.0) : float(0.0);
    u_xlat16_0.z = (u_xlatb0.z) ? float(1.0) : float(0.0);
    u_xlat16_0.w = (u_xlatb0.w) ? float(1.0) : float(0.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_0.yzw;
    u_xlat16_0.yzw = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.x = dot(u_xlat16_0, vec4(4.0, 3.0, 2.0, 1.0));
    u_xlat16_2.x = (-u_xlat16_2.x) + 4.0;
    u_xlatu1 = uint(u_xlat16_2.x);
    u_xlati1 = int(int(u_xlatu1) << 2);
    u_xlat7.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4_MainLightWorldToShadow[(u_xlati1 + 1)].xyz;
    u_xlat7.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[u_xlati1].xyz * vs_TEXCOORD2.xxx + u_xlat7.xyz;
    u_xlat7.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[(u_xlati1 + 2)].xyz * vs_TEXCOORD2.zzz + u_xlat7.xyz;
    u_xlat1.xyz = u_xlat7.xyz + hlslcc_mtx4x4_MainLightWorldToShadow[(u_xlati1 + 3)].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(0.0>=u_xlat1.z);
#else
    u_xlatb19 = 0.0>=u_xlat1.z;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlat1.z>=1.0);
#else
    u_xlatb3 = u_xlat1.z>=1.0;
#endif
    vec3 txVec0 = vec3(u_xlat1.xy,u_xlat1.z);
    u_xlat16_1.x = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec0, 0.0);
    u_xlatb7 = u_xlatb19 || u_xlatb3;
    u_xlat16_2.x = (-_MainLightShadowParams.x) + 1.0;
    u_xlat16_2.x = u_xlat16_1.x * _MainLightShadowParams.x + u_xlat16_2.x;
    u_xlat16_2.x = (u_xlatb7) ? 1.0 : u_xlat16_2.x;
    u_xlat16_8 = (-u_xlat16_2.x) + 1.0;
    u_xlat1.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = u_xlat1.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_14 = u_xlat1.x * u_xlat1.x;
    u_xlat16_2.x = u_xlat16_14 * u_xlat16_8 + u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * unity_LightData.z;
    u_xlat16_2.xyz = u_xlat16_2.xxx * _MainLightColor.xyz;
    u_xlat16_20 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_20 = min(max(u_xlat16_20, 0.0), 1.0);
#else
    u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = u_xlat16_2.xyz * vec3(u_xlat16_20) + vs_TEXCOORD1.xyz;
    u_xlat16_1.xyz = texture(_EmissionMap, vs_TEXCOORD0.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * _EmissionColor.xyz;
    u_xlat16_0 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * _BaseColor;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_0.xyz + u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat1.x = max(u_xlat1.x, 1.17549435e-38);
    u_xlat16_20 = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = vs_TEXCOORD4.xyz * vec3(u_xlat16_20) + _MainLightPosition.xyz;
    u_xlat19 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat19 = max(u_xlat19, 1.17549435e-38);
    u_xlat16_20 = inversesqrt(u_xlat19);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_20);
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_20 = log2(u_xlat1.x);
    u_xlat16_22 = u_xlat16_0.w * 10.0 + 1.0;
    u_xlat16_22 = exp2(u_xlat16_22);
    u_xlat16_20 = u_xlat16_20 * u_xlat16_22;
    u_xlat16_20 = exp2(u_xlat16_20);
    u_xlat16_5.xyz = vec3(u_xlat16_20) * _SpecColor.xyz;
    SV_Target0.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_Surface==1.0);
#else
    u_xlatb1 = _Surface==1.0;
#endif
    SV_Target0.w = (u_xlatb1) ? u_xlat16_0.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles " {
Keywords { "_ADDITIONAL_LIGHTS" "_MAIN_LIGHT_SHADOWS" }
Local Keywords { "_EMISSION" "_GLOSSINESS_FROM_BASE_ALPHA" "_SPECULAR_COLOR" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _BaseMap_ST;
uniform 	vec4 hlslcc_mtx4x4_MainLightWorldToShadow[20];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlatb22 = unity_OrthoParams.w==0.0;
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat5.xyz = u_xlat4.yyy * hlslcc_mtx4x4_MainLightWorldToShadow[1].xyz;
    u_xlat5.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[0].xyz * u_xlat4.xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[2].xyz * u_xlat4.zzz + u_xlat5.xyz;
    vs_TEXCOORD7.xyz = u_xlat5.xyz + hlslcc_mtx4x4_MainLightWorldToShadow[3].xyz;
    vs_TEXCOORD7.w = 0.0;
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	mediump vec4 _AdditionalLightsCount;
uniform 	vec4 _AdditionalLightsPosition[16];
uniform 	mediump vec4 _AdditionalLightsColor[16];
uniform 	mediump vec4 _AdditionalLightsAttenuation[16];
uniform 	mediump vec4 _AdditionalLightsSpotDir[16];
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 unity_LightData;
uniform 	mediump vec4 unity_LightIndices[2];
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _SpecColor;
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump float _Surface;
uniform 	mediump vec4 _MainLightShadowParams;
uniform lowp sampler2D _BaseMap;
uniform lowp sampler2D _EmissionMap;
uniform highp sampler2D _MainLightShadowmapTexture;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
int u_xlati3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump float u_xlat16_13;
vec3 u_xlat14;
int u_xlati14;
bool u_xlatb14;
mediump vec2 u_xlat16_24;
float u_xlat25;
bool u_xlatb25;
float u_xlat34;
int u_xlati34;
bool u_xlatb34;
mediump float u_xlat16_35;
float u_xlat36;
#define UNITY_DYNAMIC_INDEX_ES2 0






vec4 _AdditionalLightsPositionDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _AdditionalLightsPosition[i];
#else
#define d_ar _AdditionalLightsPosition
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}


mediump vec4 _AdditionalLightsAttenuationDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _AdditionalLightsAttenuation[i];
#else
#define d_ar _AdditionalLightsAttenuation
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}


mediump vec4 _AdditionalLightsSpotDirDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _AdditionalLightsSpotDir[i];
#else
#define d_ar _AdditionalLightsSpotDir
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}


mediump vec4 _AdditionalLightsColorDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _AdditionalLightsColor[i];
#else
#define d_ar _AdditionalLightsColor
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}

void main()
{
    u_xlat10_0 = texture2D(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _BaseColor;
    u_xlat10_1.xyz = texture2D(_EmissionMap, vs_TEXCOORD0.xy).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * _EmissionColor.xyz;
    u_xlat16_2.x = u_xlat16_0.w * 10.0 + 1.0;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat34 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat34 = max(u_xlat34, 1.17549435e-38);
    u_xlat16_13 = inversesqrt(u_xlat34);
    u_xlat34 = texture2D(_MainLightShadowmapTexture, vs_TEXCOORD7.xy).x;
    u_xlatb34 = u_xlat34<vs_TEXCOORD7.z;
    u_xlat16_24.x = (-_MainLightShadowParams.x) + 1.0;
    u_xlat16_35 = (u_xlatb34) ? 0.0 : _MainLightShadowParams.x;
    u_xlat16_24.x = u_xlat16_35 + u_xlat16_24.x;
    u_xlatb34 = 0.0>=vs_TEXCOORD7.z;
    u_xlatb3 = vs_TEXCOORD7.z>=1.0;
    u_xlatb34 = u_xlatb34 || u_xlatb3;
    u_xlat16_24.x = (u_xlatb34) ? 1.0 : u_xlat16_24.x;
    u_xlat3.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat34 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat34 = u_xlat34 * _MainLightShadowParams.z + _MainLightShadowParams.w;
    u_xlat34 = clamp(u_xlat34, 0.0, 1.0);
    u_xlat16_35 = u_xlat34 * u_xlat34;
    u_xlat16_4.x = (-u_xlat16_24.x) + 1.0;
    u_xlat16_24.x = u_xlat16_35 * u_xlat16_4.x + u_xlat16_24.x;
    u_xlat16_24.x = u_xlat16_24.x * unity_LightData.z;
    u_xlat16_4.xyz = u_xlat16_24.xxx * _MainLightColor.xyz;
    u_xlat16_24.x = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
    u_xlat16_24.x = clamp(u_xlat16_24.x, 0.0, 1.0);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_24.xxx + vs_TEXCOORD1.xyz;
    u_xlat3.xyz = vs_TEXCOORD4.xyz * vec3(u_xlat16_13) + _MainLightPosition.xyz;
    u_xlat34 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat34 = max(u_xlat34, 1.17549435e-38);
    u_xlat16_24.x = inversesqrt(u_xlat34);
    u_xlat3.xyz = u_xlat16_24.xxx * u_xlat3.xyz;
    u_xlat34 = dot(vs_TEXCOORD3.xyz, u_xlat3.xyz);
    u_xlat34 = clamp(u_xlat34, 0.0, 1.0);
    u_xlat16_24.x = log2(u_xlat34);
    u_xlat16_24.x = u_xlat16_24.x * u_xlat16_2.x;
    u_xlat16_24.x = exp2(u_xlat16_24.x);
    u_xlat16_6.xyz = u_xlat16_24.xxx * _SpecColor.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat16_24.x = min(_AdditionalLightsCount.x, unity_LightData.y);
    u_xlati34 = int(u_xlat16_24.x);
    u_xlat16_6.xyz = u_xlat16_5.xyz;
    u_xlat16_7.xyz = u_xlat16_4.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<u_xlati34 ; u_xlati_loop_1++)
    {
        u_xlat14.x = float(u_xlati_loop_1);
        u_xlatb25 = u_xlat14.x<2.0;
        u_xlat16_24.xy = (bool(u_xlatb25)) ? unity_LightIndices[0].xy : unity_LightIndices[0].zw;
        u_xlat36 = u_xlat14.x + -2.0;
        u_xlat14.x = (u_xlatb25) ? u_xlat14.x : u_xlat36;
        u_xlatb14 = u_xlat14.x<1.0;
        u_xlat16_24.x = (u_xlatb14) ? u_xlat16_24.x : u_xlat16_24.y;
        u_xlati14 = int(u_xlat16_24.x);
        u_xlat8.xyz = (-vs_TEXCOORD2.xyz) * _AdditionalLightsPositionDynamicIndex(u_xlati14).www + _AdditionalLightsPositionDynamicIndex(u_xlati14).xyz;
        u_xlat25 = dot(u_xlat8.xyz, u_xlat8.xyz);
        u_xlat25 = max(u_xlat25, 6.10351562e-05);
        u_xlat36 = inversesqrt(u_xlat25);
        u_xlat8.xyz = vec3(u_xlat36) * u_xlat8.xyz;
        u_xlat36 = float(1.0) / u_xlat25;
        u_xlat25 = u_xlat25 * _AdditionalLightsAttenuationDynamicIndex(u_xlati14).x + _AdditionalLightsAttenuationDynamicIndex(u_xlati14).y;
        u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
        u_xlat25 = u_xlat25 * u_xlat36;
        u_xlat16_24.x = dot(_AdditionalLightsSpotDirDynamicIndex(u_xlati14).xyz, u_xlat8.xyz);
        u_xlat16_24.x = u_xlat16_24.x * _AdditionalLightsAttenuationDynamicIndex(u_xlati14).z + _AdditionalLightsAttenuationDynamicIndex(u_xlati14).w;
        u_xlat16_24.x = clamp(u_xlat16_24.x, 0.0, 1.0);
        u_xlat16_24.x = u_xlat16_24.x * u_xlat16_24.x;
        u_xlat25 = u_xlat16_24.x * u_xlat25;
        u_xlat16_9.xyz = vec3(u_xlat25) * _AdditionalLightsColorDynamicIndex(u_xlati14).xyz;
        u_xlat16_24.x = dot(vs_TEXCOORD3.xyz, u_xlat8.xyz);
        u_xlat16_24.x = clamp(u_xlat16_24.x, 0.0, 1.0);
        u_xlat16_6.xyz = u_xlat16_9.xyz * u_xlat16_24.xxx + u_xlat16_6.xyz;
        u_xlat14.xyz = vs_TEXCOORD4.xyz * vec3(u_xlat16_13) + u_xlat8.xyz;
        u_xlat8.x = dot(u_xlat14.xyz, u_xlat14.xyz);
        u_xlat8.x = max(u_xlat8.x, 1.17549435e-38);
        u_xlat16_24.x = inversesqrt(u_xlat8.x);
        u_xlat14.xyz = u_xlat16_24.xxx * u_xlat14.xyz;
        u_xlat14.x = dot(vs_TEXCOORD3.xyz, u_xlat14.xyz);
        u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
        u_xlat16_24.x = log2(u_xlat14.x);
        u_xlat16_24.x = u_xlat16_24.x * u_xlat16_2.x;
        u_xlat16_24.x = exp2(u_xlat16_24.x);
        u_xlat16_10.xyz = u_xlat16_24.xxx * _SpecColor.xyz;
        u_xlat16_7.xyz = u_xlat16_9.xyz * u_xlat16_10.xyz + u_xlat16_7.xyz;
    }
    u_xlat16_2.xyz = u_xlat16_6.xyz * u_xlat16_0.xyz + u_xlat1.xyz;
    SV_Target0.xyz = u_xlat16_7.xyz + u_xlat16_2.xyz;
    u_xlatb1 = _Surface==1.0;
    SV_Target0.w = (u_xlatb1) ? u_xlat16_0.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_MAIN_LIGHT_SHADOWS" "_MAIN_LIGHT_SHADOWS_CASCADE" }
Local Keywords { "_EMISSION" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb22 = unity_OrthoParams.w==0.0;
#endif
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4_MainLightWorldToShadow[20];
uniform 	vec4 _CascadeShadowSplitSpheres0;
uniform 	vec4 _CascadeShadowSplitSpheres1;
uniform 	vec4 _CascadeShadowSplitSpheres2;
uniform 	vec4 _CascadeShadowSplitSpheres3;
uniform 	vec4 _CascadeShadowSplitSphereRadii;
uniform 	mediump vec4 _MainLightShadowParams;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
UNITY_LOCATION(1) uniform mediump sampler2D _EmissionMap;
UNITY_LOCATION(2) uniform mediump sampler2D _MainLightShadowmapTexture;
UNITY_LOCATION(3) uniform mediump sampler2DShadow hlslcc_zcmp_MainLightShadowmapTexture;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bvec4 u_xlatb0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
int u_xlati1;
uint u_xlatu1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
bool u_xlatb3;
vec3 u_xlat5;
bool u_xlatb5;
mediump float u_xlat16_6;
mediump float u_xlat16_10;
bool u_xlatb13;
mediump float u_xlat16_14;
void main()
{
    u_xlat0.xyz = vs_TEXCOORD2.xyz + (-_CascadeShadowSplitSpheres0.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat1.xyz = vs_TEXCOORD2.xyz + (-_CascadeShadowSplitSpheres1.xyz);
    u_xlat0.y = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.xyz = vs_TEXCOORD2.xyz + (-_CascadeShadowSplitSpheres2.xyz);
    u_xlat0.z = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.xyz = vs_TEXCOORD2.xyz + (-_CascadeShadowSplitSpheres3.xyz);
    u_xlat0.w = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlatb0 = lessThan(u_xlat0, _CascadeShadowSplitSphereRadii);
    u_xlat16_2.x = (u_xlatb0.x) ? float(-1.0) : float(-0.0);
    u_xlat16_2.y = (u_xlatb0.y) ? float(-1.0) : float(-0.0);
    u_xlat16_2.z = (u_xlatb0.z) ? float(-1.0) : float(-0.0);
    u_xlat16_0.x = (u_xlatb0.x) ? float(1.0) : float(0.0);
    u_xlat16_0.y = (u_xlatb0.y) ? float(1.0) : float(0.0);
    u_xlat16_0.z = (u_xlatb0.z) ? float(1.0) : float(0.0);
    u_xlat16_0.w = (u_xlatb0.w) ? float(1.0) : float(0.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_0.yzw;
    u_xlat16_0.yzw = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.x = dot(u_xlat16_0, vec4(4.0, 3.0, 2.0, 1.0));
    u_xlat16_2.x = (-u_xlat16_2.x) + 4.0;
    u_xlatu1 = uint(u_xlat16_2.x);
    u_xlati1 = int(int(u_xlatu1) << 2);
    u_xlat5.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4_MainLightWorldToShadow[(u_xlati1 + 1)].xyz;
    u_xlat5.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[u_xlati1].xyz * vs_TEXCOORD2.xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[(u_xlati1 + 2)].xyz * vs_TEXCOORD2.zzz + u_xlat5.xyz;
    u_xlat1.xyz = u_xlat5.xyz + hlslcc_mtx4x4_MainLightWorldToShadow[(u_xlati1 + 3)].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(0.0>=u_xlat1.z);
#else
    u_xlatb13 = 0.0>=u_xlat1.z;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlat1.z>=1.0);
#else
    u_xlatb3 = u_xlat1.z>=1.0;
#endif
    vec3 txVec0 = vec3(u_xlat1.xy,u_xlat1.z);
    u_xlat16_1.x = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec0, 0.0);
    u_xlatb5 = u_xlatb13 || u_xlatb3;
    u_xlat16_2.x = (-_MainLightShadowParams.x) + 1.0;
    u_xlat16_2.x = u_xlat16_1.x * _MainLightShadowParams.x + u_xlat16_2.x;
    u_xlat16_2.x = (u_xlatb5) ? 1.0 : u_xlat16_2.x;
    u_xlat16_6 = (-u_xlat16_2.x) + 1.0;
    u_xlat1.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = u_xlat1.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_10 = u_xlat1.x * u_xlat1.x;
    u_xlat16_2.x = u_xlat16_10 * u_xlat16_6 + u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * unity_LightData.z;
    u_xlat16_2.xyz = u_xlat16_2.xxx * _MainLightColor.xyz;
    u_xlat16_14 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14 = min(max(u_xlat16_14, 0.0), 1.0);
#else
    u_xlat16_14 = clamp(u_xlat16_14, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_14) + vs_TEXCOORD1.xyz;
    u_xlat16_1.xyz = texture(_EmissionMap, vs_TEXCOORD0.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * _EmissionColor.xyz;
    u_xlat16_0 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * _BaseColor;
    SV_Target0.xyz = u_xlat16_2.xyz * u_xlat16_0.xyz + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_Surface==1.0);
#else
    u_xlatb1 = _Surface==1.0;
#endif
    SV_Target0.w = (u_xlatb1) ? u_xlat16_0.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles " {
Keywords { "_ADDITIONAL_LIGHTS" "_MAIN_LIGHT_SHADOWS" }
Local Keywords { "_EMISSION" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _BaseMap_ST;
uniform 	vec4 hlslcc_mtx4x4_MainLightWorldToShadow[20];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlatb22 = unity_OrthoParams.w==0.0;
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat5.xyz = u_xlat4.yyy * hlslcc_mtx4x4_MainLightWorldToShadow[1].xyz;
    u_xlat5.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[0].xyz * u_xlat4.xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[2].xyz * u_xlat4.zzz + u_xlat5.xyz;
    vs_TEXCOORD7.xyz = u_xlat5.xyz + hlslcc_mtx4x4_MainLightWorldToShadow[3].xyz;
    vs_TEXCOORD7.w = 0.0;
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	mediump vec4 _AdditionalLightsCount;
uniform 	vec4 _AdditionalLightsPosition[16];
uniform 	mediump vec4 _AdditionalLightsColor[16];
uniform 	mediump vec4 _AdditionalLightsAttenuation[16];
uniform 	mediump vec4 _AdditionalLightsSpotDir[16];
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 unity_LightData;
uniform 	mediump vec4 unity_LightIndices[2];
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump float _Surface;
uniform 	mediump vec4 _MainLightShadowParams;
uniform lowp sampler2D _BaseMap;
uniform lowp sampler2D _EmissionMap;
uniform highp sampler2D _MainLightShadowmapTexture;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
int u_xlati3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump float u_xlat16_9;
float u_xlat10;
int u_xlati10;
bool u_xlatb10;
mediump float u_xlat16_16;
float u_xlat17;
bool u_xlatb17;
float u_xlat22;
int u_xlati22;
bool u_xlatb22;
mediump float u_xlat16_23;
float u_xlat24;
#define UNITY_DYNAMIC_INDEX_ES2 0






vec4 _AdditionalLightsPositionDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _AdditionalLightsPosition[i];
#else
#define d_ar _AdditionalLightsPosition
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}


mediump vec4 _AdditionalLightsAttenuationDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _AdditionalLightsAttenuation[i];
#else
#define d_ar _AdditionalLightsAttenuation
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}


mediump vec4 _AdditionalLightsSpotDirDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _AdditionalLightsSpotDir[i];
#else
#define d_ar _AdditionalLightsSpotDir
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}


mediump vec4 _AdditionalLightsColorDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _AdditionalLightsColor[i];
#else
#define d_ar _AdditionalLightsColor
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}

void main()
{
    u_xlat10_0 = texture2D(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _BaseColor;
    u_xlat10_1.xyz = texture2D(_EmissionMap, vs_TEXCOORD0.xy).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * _EmissionColor.xyz;
    u_xlat22 = texture2D(_MainLightShadowmapTexture, vs_TEXCOORD7.xy).x;
    u_xlatb22 = u_xlat22<vs_TEXCOORD7.z;
    u_xlat16_2.x = (-_MainLightShadowParams.x) + 1.0;
    u_xlat16_9 = (u_xlatb22) ? 0.0 : _MainLightShadowParams.x;
    u_xlat16_2.x = u_xlat16_9 + u_xlat16_2.x;
    u_xlatb22 = 0.0>=vs_TEXCOORD7.z;
    u_xlatb3 = vs_TEXCOORD7.z>=1.0;
    u_xlatb22 = u_xlatb22 || u_xlatb3;
    u_xlat16_2.x = (u_xlatb22) ? 1.0 : u_xlat16_2.x;
    u_xlat3.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat22 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat22 = u_xlat22 * _MainLightShadowParams.z + _MainLightShadowParams.w;
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat16_9 = u_xlat22 * u_xlat22;
    u_xlat16_16 = (-u_xlat16_2.x) + 1.0;
    u_xlat16_2.x = u_xlat16_9 * u_xlat16_16 + u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * unity_LightData.z;
    u_xlat16_2.xyz = u_xlat16_2.xxx * _MainLightColor.xyz;
    u_xlat16_23 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_23) + vs_TEXCOORD1.xyz;
    u_xlat16_23 = min(_AdditionalLightsCount.x, unity_LightData.y);
    u_xlati22 = int(u_xlat16_23);
    u_xlat16_4.xyz = u_xlat16_2.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<u_xlati22 ; u_xlati_loop_1++)
    {
        u_xlat10 = float(u_xlati_loop_1);
        u_xlatb17 = u_xlat10<2.0;
        u_xlat16_5.xy = (bool(u_xlatb17)) ? unity_LightIndices[0].xy : unity_LightIndices[0].zw;
        u_xlat24 = u_xlat10 + -2.0;
        u_xlat10 = (u_xlatb17) ? u_xlat10 : u_xlat24;
        u_xlatb10 = u_xlat10<1.0;
        u_xlat16_23 = (u_xlatb10) ? u_xlat16_5.x : u_xlat16_5.y;
        u_xlati10 = int(u_xlat16_23);
        u_xlat6.xyz = (-vs_TEXCOORD2.xyz) * _AdditionalLightsPositionDynamicIndex(u_xlati10).www + _AdditionalLightsPositionDynamicIndex(u_xlati10).xyz;
        u_xlat17 = dot(u_xlat6.xyz, u_xlat6.xyz);
        u_xlat17 = max(u_xlat17, 6.10351562e-05);
        u_xlat24 = inversesqrt(u_xlat17);
        u_xlat6.xyz = vec3(u_xlat24) * u_xlat6.xyz;
        u_xlat24 = float(1.0) / u_xlat17;
        u_xlat17 = u_xlat17 * _AdditionalLightsAttenuationDynamicIndex(u_xlati10).x + _AdditionalLightsAttenuationDynamicIndex(u_xlati10).y;
        u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
        u_xlat17 = u_xlat17 * u_xlat24;
        u_xlat16_23 = dot(_AdditionalLightsSpotDirDynamicIndex(u_xlati10).xyz, u_xlat6.xyz);
        u_xlat16_23 = u_xlat16_23 * _AdditionalLightsAttenuationDynamicIndex(u_xlati10).z + _AdditionalLightsAttenuationDynamicIndex(u_xlati10).w;
        u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
        u_xlat16_23 = u_xlat16_23 * u_xlat16_23;
        u_xlat17 = u_xlat16_23 * u_xlat17;
        u_xlat16_5.xyz = vec3(u_xlat17) * _AdditionalLightsColorDynamicIndex(u_xlati10).xyz;
        u_xlat16_23 = dot(vs_TEXCOORD3.xyz, u_xlat6.xyz);
        u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
        u_xlat16_4.xyz = u_xlat16_5.xyz * vec3(u_xlat16_23) + u_xlat16_4.xyz;
    }
    SV_Target0.xyz = u_xlat16_4.xyz * u_xlat16_0.xyz + u_xlat1.xyz;
    u_xlatb1 = _Surface==1.0;
    SV_Target0.w = (u_xlatb1) ? u_xlat16_0.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_MAIN_LIGHT_SHADOWS" "_MAIN_LIGHT_SHADOWS_CASCADE" }
Local Keywords { "_GLOSSINESS_FROM_BASE_ALPHA" "_SPECULAR_COLOR" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb22 = unity_OrthoParams.w==0.0;
#endif
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4_MainLightWorldToShadow[20];
uniform 	vec4 _CascadeShadowSplitSpheres0;
uniform 	vec4 _CascadeShadowSplitSpheres1;
uniform 	vec4 _CascadeShadowSplitSpheres2;
uniform 	vec4 _CascadeShadowSplitSpheres3;
uniform 	vec4 _CascadeShadowSplitSphereRadii;
uniform 	mediump vec4 _MainLightShadowParams;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainLightShadowmapTexture;
UNITY_LOCATION(2) uniform mediump sampler2DShadow hlslcc_zcmp_MainLightShadowmapTexture;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bvec4 u_xlatb0;
vec3 u_xlat1;
mediump float u_xlat16_1;
int u_xlati1;
uint u_xlatu1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat7;
bool u_xlatb7;
mediump float u_xlat16_8;
mediump float u_xlat16_14;
float u_xlat19;
bool u_xlatb19;
mediump float u_xlat16_20;
mediump float u_xlat16_22;
void main()
{
    u_xlat0.xyz = vs_TEXCOORD2.xyz + (-_CascadeShadowSplitSpheres0.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat1.xyz = vs_TEXCOORD2.xyz + (-_CascadeShadowSplitSpheres1.xyz);
    u_xlat0.y = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.xyz = vs_TEXCOORD2.xyz + (-_CascadeShadowSplitSpheres2.xyz);
    u_xlat0.z = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.xyz = vs_TEXCOORD2.xyz + (-_CascadeShadowSplitSpheres3.xyz);
    u_xlat0.w = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlatb0 = lessThan(u_xlat0, _CascadeShadowSplitSphereRadii);
    u_xlat16_2.x = (u_xlatb0.x) ? float(-1.0) : float(-0.0);
    u_xlat16_2.y = (u_xlatb0.y) ? float(-1.0) : float(-0.0);
    u_xlat16_2.z = (u_xlatb0.z) ? float(-1.0) : float(-0.0);
    u_xlat16_0.x = (u_xlatb0.x) ? float(1.0) : float(0.0);
    u_xlat16_0.y = (u_xlatb0.y) ? float(1.0) : float(0.0);
    u_xlat16_0.z = (u_xlatb0.z) ? float(1.0) : float(0.0);
    u_xlat16_0.w = (u_xlatb0.w) ? float(1.0) : float(0.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_0.yzw;
    u_xlat16_0.yzw = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.x = dot(u_xlat16_0, vec4(4.0, 3.0, 2.0, 1.0));
    u_xlat16_2.x = (-u_xlat16_2.x) + 4.0;
    u_xlatu1 = uint(u_xlat16_2.x);
    u_xlati1 = int(int(u_xlatu1) << 2);
    u_xlat7.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4_MainLightWorldToShadow[(u_xlati1 + 1)].xyz;
    u_xlat7.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[u_xlati1].xyz * vs_TEXCOORD2.xxx + u_xlat7.xyz;
    u_xlat7.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[(u_xlati1 + 2)].xyz * vs_TEXCOORD2.zzz + u_xlat7.xyz;
    u_xlat1.xyz = u_xlat7.xyz + hlslcc_mtx4x4_MainLightWorldToShadow[(u_xlati1 + 3)].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(0.0>=u_xlat1.z);
#else
    u_xlatb19 = 0.0>=u_xlat1.z;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlat1.z>=1.0);
#else
    u_xlatb3 = u_xlat1.z>=1.0;
#endif
    vec3 txVec0 = vec3(u_xlat1.xy,u_xlat1.z);
    u_xlat16_1 = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec0, 0.0);
    u_xlatb7 = u_xlatb19 || u_xlatb3;
    u_xlat16_2.x = (-_MainLightShadowParams.x) + 1.0;
    u_xlat16_2.x = u_xlat16_1 * _MainLightShadowParams.x + u_xlat16_2.x;
    u_xlat16_2.x = (u_xlatb7) ? 1.0 : u_xlat16_2.x;
    u_xlat16_8 = (-u_xlat16_2.x) + 1.0;
    u_xlat1.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = u_xlat1.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_14 = u_xlat1.x * u_xlat1.x;
    u_xlat16_2.x = u_xlat16_14 * u_xlat16_8 + u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * unity_LightData.z;
    u_xlat16_2.xyz = u_xlat16_2.xxx * _MainLightColor.xyz;
    u_xlat16_20 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_20 = min(max(u_xlat16_20, 0.0), 1.0);
#else
    u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = u_xlat16_2.xyz * vec3(u_xlat16_20) + vs_TEXCOORD1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat1.x = max(u_xlat1.x, 1.17549435e-38);
    u_xlat16_20 = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = vs_TEXCOORD4.xyz * vec3(u_xlat16_20) + _MainLightPosition.xyz;
    u_xlat19 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat19 = max(u_xlat19, 1.17549435e-38);
    u_xlat16_20 = inversesqrt(u_xlat19);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_20);
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_20 = log2(u_xlat1.x);
    u_xlat16_0 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * _BaseColor;
    u_xlat16_22 = u_xlat16_0.w * 10.0 + 1.0;
    u_xlat16_22 = exp2(u_xlat16_22);
    u_xlat16_20 = u_xlat16_20 * u_xlat16_22;
    u_xlat16_20 = exp2(u_xlat16_20);
    u_xlat16_5.xyz = vec3(u_xlat16_20) * _SpecColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz;
    SV_Target0.xyz = u_xlat16_4.xyz * u_xlat16_0.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_Surface==1.0);
#else
    u_xlatb1 = _Surface==1.0;
#endif
    SV_Target0.w = (u_xlatb1) ? u_xlat16_0.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles " {
Keywords { "_ADDITIONAL_LIGHTS" "_MAIN_LIGHT_SHADOWS" }
Local Keywords { "_GLOSSINESS_FROM_BASE_ALPHA" "_SPECULAR_COLOR" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _BaseMap_ST;
uniform 	vec4 hlslcc_mtx4x4_MainLightWorldToShadow[20];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlatb22 = unity_OrthoParams.w==0.0;
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat5.xyz = u_xlat4.yyy * hlslcc_mtx4x4_MainLightWorldToShadow[1].xyz;
    u_xlat5.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[0].xyz * u_xlat4.xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[2].xyz * u_xlat4.zzz + u_xlat5.xyz;
    vs_TEXCOORD7.xyz = u_xlat5.xyz + hlslcc_mtx4x4_MainLightWorldToShadow[3].xyz;
    vs_TEXCOORD7.w = 0.0;
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	mediump vec4 _AdditionalLightsCount;
uniform 	vec4 _AdditionalLightsPosition[16];
uniform 	mediump vec4 _AdditionalLightsColor[16];
uniform 	mediump vec4 _AdditionalLightsAttenuation[16];
uniform 	mediump vec4 _AdditionalLightsSpotDir[16];
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 unity_LightData;
uniform 	mediump vec4 unity_LightIndices[2];
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _SpecColor;
uniform 	mediump float _Surface;
uniform 	mediump vec4 _MainLightShadowParams;
uniform lowp sampler2D _BaseMap;
uniform highp sampler2D _MainLightShadowmapTexture;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump float u_xlat16_1;
vec3 u_xlat2;
int u_xlati2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump float u_xlat16_11;
int u_xlati12;
bool u_xlatb12;
mediump vec2 u_xlat16_21;
float u_xlat22;
int u_xlati22;
bool u_xlatb22;
mediump float u_xlat16_31;
float u_xlat32;
bool u_xlatb32;
float u_xlat37;
#define UNITY_DYNAMIC_INDEX_ES2 0






vec4 _AdditionalLightsPositionDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _AdditionalLightsPosition[i];
#else
#define d_ar _AdditionalLightsPosition
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}


mediump vec4 _AdditionalLightsAttenuationDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _AdditionalLightsAttenuation[i];
#else
#define d_ar _AdditionalLightsAttenuation
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}


mediump vec4 _AdditionalLightsSpotDirDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _AdditionalLightsSpotDir[i];
#else
#define d_ar _AdditionalLightsSpotDir
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}


mediump vec4 _AdditionalLightsColorDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _AdditionalLightsColor[i];
#else
#define d_ar _AdditionalLightsColor
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}

void main()
{
    u_xlat10_0 = texture2D(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _BaseColor;
    u_xlat16_1 = u_xlat16_0.w * 10.0 + 1.0;
    u_xlat16_1 = exp2(u_xlat16_1);
    u_xlat2.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat2.x = max(u_xlat2.x, 1.17549435e-38);
    u_xlat16_11 = inversesqrt(u_xlat2.x);
    u_xlat2.x = texture2D(_MainLightShadowmapTexture, vs_TEXCOORD7.xy).x;
    u_xlatb2 = u_xlat2.x<vs_TEXCOORD7.z;
    u_xlat16_21.x = (-_MainLightShadowParams.x) + 1.0;
    u_xlat16_31 = (u_xlatb2) ? 0.0 : _MainLightShadowParams.x;
    u_xlat16_21.x = u_xlat16_31 + u_xlat16_21.x;
    u_xlatb2 = 0.0>=vs_TEXCOORD7.z;
    u_xlatb12 = vs_TEXCOORD7.z>=1.0;
    u_xlatb2 = u_xlatb12 || u_xlatb2;
    u_xlat16_21.x = (u_xlatb2) ? 1.0 : u_xlat16_21.x;
    u_xlat2.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.x = u_xlat2.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat16_31 = u_xlat2.x * u_xlat2.x;
    u_xlat16_3.x = (-u_xlat16_21.x) + 1.0;
    u_xlat16_21.x = u_xlat16_31 * u_xlat16_3.x + u_xlat16_21.x;
    u_xlat16_21.x = u_xlat16_21.x * unity_LightData.z;
    u_xlat16_3.xyz = u_xlat16_21.xxx * _MainLightColor.xyz;
    u_xlat16_21.x = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
    u_xlat16_21.x = clamp(u_xlat16_21.x, 0.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_3.xyz * u_xlat16_21.xxx + vs_TEXCOORD1.xyz;
    u_xlat2.xyz = vs_TEXCOORD4.xyz * vec3(u_xlat16_11) + _MainLightPosition.xyz;
    u_xlat32 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat32 = max(u_xlat32, 1.17549435e-38);
    u_xlat16_21.x = inversesqrt(u_xlat32);
    u_xlat2.xyz = u_xlat16_21.xxx * u_xlat2.xyz;
    u_xlat2.x = dot(vs_TEXCOORD3.xyz, u_xlat2.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat16_21.x = log2(u_xlat2.x);
    u_xlat16_21.x = u_xlat16_21.x * u_xlat16_1;
    u_xlat16_21.x = exp2(u_xlat16_21.x);
    u_xlat16_5.xyz = u_xlat16_21.xxx * _SpecColor.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz;
    u_xlat16_21.x = min(_AdditionalLightsCount.x, unity_LightData.y);
    u_xlati2 = int(u_xlat16_21.x);
    u_xlat16_5.xyz = u_xlat16_4.xyz;
    u_xlat16_6.xyz = u_xlat16_3.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<u_xlati2 ; u_xlati_loop_1++)
    {
        u_xlat22 = float(u_xlati_loop_1);
        u_xlatb32 = u_xlat22<2.0;
        u_xlat16_21.xy = (bool(u_xlatb32)) ? unity_LightIndices[0].xy : unity_LightIndices[0].zw;
        u_xlat7.x = u_xlat22 + -2.0;
        u_xlat22 = (u_xlatb32) ? u_xlat22 : u_xlat7.x;
        u_xlatb22 = u_xlat22<1.0;
        u_xlat16_21.x = (u_xlatb22) ? u_xlat16_21.x : u_xlat16_21.y;
        u_xlati22 = int(u_xlat16_21.x);
        u_xlat7.xyz = (-vs_TEXCOORD2.xyz) * _AdditionalLightsPositionDynamicIndex(u_xlati22).www + _AdditionalLightsPositionDynamicIndex(u_xlati22).xyz;
        u_xlat32 = dot(u_xlat7.xyz, u_xlat7.xyz);
        u_xlat32 = max(u_xlat32, 6.10351562e-05);
        u_xlat37 = inversesqrt(u_xlat32);
        u_xlat7.xyz = vec3(u_xlat37) * u_xlat7.xyz;
        u_xlat37 = float(1.0) / u_xlat32;
        u_xlat32 = u_xlat32 * _AdditionalLightsAttenuationDynamicIndex(u_xlati22).x + _AdditionalLightsAttenuationDynamicIndex(u_xlati22).y;
        u_xlat32 = clamp(u_xlat32, 0.0, 1.0);
        u_xlat32 = u_xlat32 * u_xlat37;
        u_xlat16_21.x = dot(_AdditionalLightsSpotDirDynamicIndex(u_xlati22).xyz, u_xlat7.xyz);
        u_xlat16_21.x = u_xlat16_21.x * _AdditionalLightsAttenuationDynamicIndex(u_xlati22).z + _AdditionalLightsAttenuationDynamicIndex(u_xlati22).w;
        u_xlat16_21.x = clamp(u_xlat16_21.x, 0.0, 1.0);
        u_xlat16_21.x = u_xlat16_21.x * u_xlat16_21.x;
        u_xlat32 = u_xlat16_21.x * u_xlat32;
        u_xlat16_8.xyz = vec3(u_xlat32) * _AdditionalLightsColorDynamicIndex(u_xlati22).xyz;
        u_xlat16_21.x = dot(vs_TEXCOORD3.xyz, u_xlat7.xyz);
        u_xlat16_21.x = clamp(u_xlat16_21.x, 0.0, 1.0);
        u_xlat16_5.xyz = u_xlat16_8.xyz * u_xlat16_21.xxx + u_xlat16_5.xyz;
        u_xlat7.xyz = vs_TEXCOORD4.xyz * vec3(u_xlat16_11) + u_xlat7.xyz;
        u_xlat22 = dot(u_xlat7.xyz, u_xlat7.xyz);
        u_xlat22 = max(u_xlat22, 1.17549435e-38);
        u_xlat16_21.x = inversesqrt(u_xlat22);
        u_xlat7.xyz = u_xlat16_21.xxx * u_xlat7.xyz;
        u_xlat22 = dot(vs_TEXCOORD3.xyz, u_xlat7.xyz);
        u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
        u_xlat16_21.x = log2(u_xlat22);
        u_xlat16_21.x = u_xlat16_21.x * u_xlat16_1;
        u_xlat16_21.x = exp2(u_xlat16_21.x);
        u_xlat16_9.xyz = u_xlat16_21.xxx * _SpecColor.xyz;
        u_xlat16_6.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz + u_xlat16_6.xyz;
    }
    SV_Target0.xyz = u_xlat16_5.xyz * u_xlat16_0.xyz + u_xlat16_6.xyz;
    u_xlatb2 = _Surface==1.0;
    SV_Target0.w = (u_xlatb2) ? u_xlat16_0.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_MAIN_LIGHT_SHADOWS" "_MAIN_LIGHT_SHADOWS_CASCADE" }
Local Keywords { "_GLOSSINESS_FROM_BASE_ALPHA" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb22 = unity_OrthoParams.w==0.0;
#endif
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4_MainLightWorldToShadow[20];
uniform 	vec4 _CascadeShadowSplitSpheres0;
uniform 	vec4 _CascadeShadowSplitSpheres1;
uniform 	vec4 _CascadeShadowSplitSpheres2;
uniform 	vec4 _CascadeShadowSplitSpheres3;
uniform 	vec4 _CascadeShadowSplitSphereRadii;
uniform 	mediump vec4 _MainLightShadowParams;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainLightShadowmapTexture;
UNITY_LOCATION(2) uniform mediump sampler2DShadow hlslcc_zcmp_MainLightShadowmapTexture;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bvec4 u_xlatb0;
vec3 u_xlat1;
mediump float u_xlat16_1;
int u_xlati1;
uint u_xlatu1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
bool u_xlatb3;
vec3 u_xlat5;
bool u_xlatb5;
mediump float u_xlat16_6;
mediump float u_xlat16_10;
bool u_xlatb13;
mediump float u_xlat16_14;
void main()
{
    u_xlat0.xyz = vs_TEXCOORD2.xyz + (-_CascadeShadowSplitSpheres0.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat1.xyz = vs_TEXCOORD2.xyz + (-_CascadeShadowSplitSpheres1.xyz);
    u_xlat0.y = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.xyz = vs_TEXCOORD2.xyz + (-_CascadeShadowSplitSpheres2.xyz);
    u_xlat0.z = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.xyz = vs_TEXCOORD2.xyz + (-_CascadeShadowSplitSpheres3.xyz);
    u_xlat0.w = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlatb0 = lessThan(u_xlat0, _CascadeShadowSplitSphereRadii);
    u_xlat16_2.x = (u_xlatb0.x) ? float(-1.0) : float(-0.0);
    u_xlat16_2.y = (u_xlatb0.y) ? float(-1.0) : float(-0.0);
    u_xlat16_2.z = (u_xlatb0.z) ? float(-1.0) : float(-0.0);
    u_xlat16_0.x = (u_xlatb0.x) ? float(1.0) : float(0.0);
    u_xlat16_0.y = (u_xlatb0.y) ? float(1.0) : float(0.0);
    u_xlat16_0.z = (u_xlatb0.z) ? float(1.0) : float(0.0);
    u_xlat16_0.w = (u_xlatb0.w) ? float(1.0) : float(0.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_0.yzw;
    u_xlat16_0.yzw = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.x = dot(u_xlat16_0, vec4(4.0, 3.0, 2.0, 1.0));
    u_xlat16_2.x = (-u_xlat16_2.x) + 4.0;
    u_xlatu1 = uint(u_xlat16_2.x);
    u_xlati1 = int(int(u_xlatu1) << 2);
    u_xlat5.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4_MainLightWorldToShadow[(u_xlati1 + 1)].xyz;
    u_xlat5.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[u_xlati1].xyz * vs_TEXCOORD2.xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[(u_xlati1 + 2)].xyz * vs_TEXCOORD2.zzz + u_xlat5.xyz;
    u_xlat1.xyz = u_xlat5.xyz + hlslcc_mtx4x4_MainLightWorldToShadow[(u_xlati1 + 3)].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(0.0>=u_xlat1.z);
#else
    u_xlatb13 = 0.0>=u_xlat1.z;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlat1.z>=1.0);
#else
    u_xlatb3 = u_xlat1.z>=1.0;
#endif
    vec3 txVec0 = vec3(u_xlat1.xy,u_xlat1.z);
    u_xlat16_1 = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec0, 0.0);
    u_xlatb5 = u_xlatb13 || u_xlatb3;
    u_xlat16_2.x = (-_MainLightShadowParams.x) + 1.0;
    u_xlat16_2.x = u_xlat16_1 * _MainLightShadowParams.x + u_xlat16_2.x;
    u_xlat16_2.x = (u_xlatb5) ? 1.0 : u_xlat16_2.x;
    u_xlat16_6 = (-u_xlat16_2.x) + 1.0;
    u_xlat1.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = u_xlat1.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_10 = u_xlat1.x * u_xlat1.x;
    u_xlat16_2.x = u_xlat16_10 * u_xlat16_6 + u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * unity_LightData.z;
    u_xlat16_2.xyz = u_xlat16_2.xxx * _MainLightColor.xyz;
    u_xlat16_14 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14 = min(max(u_xlat16_14, 0.0), 1.0);
#else
    u_xlat16_14 = clamp(u_xlat16_14, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_14) + vs_TEXCOORD1.xyz;
    u_xlat16_0 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * _BaseColor;
    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_Surface==1.0);
#else
    u_xlatb1 = _Surface==1.0;
#endif
    SV_Target0.w = (u_xlatb1) ? u_xlat16_0.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles " {
Keywords { "_ADDITIONAL_LIGHTS" "_MAIN_LIGHT_SHADOWS" }
Local Keywords { "_GLOSSINESS_FROM_BASE_ALPHA" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _BaseMap_ST;
uniform 	vec4 hlslcc_mtx4x4_MainLightWorldToShadow[20];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlatb22 = unity_OrthoParams.w==0.0;
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat5.xyz = u_xlat4.yyy * hlslcc_mtx4x4_MainLightWorldToShadow[1].xyz;
    u_xlat5.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[0].xyz * u_xlat4.xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[2].xyz * u_xlat4.zzz + u_xlat5.xyz;
    vs_TEXCOORD7.xyz = u_xlat5.xyz + hlslcc_mtx4x4_MainLightWorldToShadow[3].xyz;
    vs_TEXCOORD7.w = 0.0;
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	mediump vec4 _AdditionalLightsCount;
uniform 	vec4 _AdditionalLightsPosition[16];
uniform 	mediump vec4 _AdditionalLightsColor[16];
uniform 	mediump vec4 _AdditionalLightsAttenuation[16];
uniform 	mediump vec4 _AdditionalLightsSpotDir[16];
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 unity_LightData;
uniform 	mediump vec4 unity_LightIndices[2];
uniform 	mediump vec4 _BaseColor;
uniform 	mediump float _Surface;
uniform 	mediump vec4 _MainLightShadowParams;
uniform lowp sampler2D _BaseMap;
uniform highp sampler2D _MainLightShadowmapTexture;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
int u_xlati1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
int u_xlati7;
bool u_xlatb7;
mediump float u_xlat16_8;
float u_xlat13;
int u_xlati13;
bool u_xlatb13;
mediump float u_xlat16_14;
float u_xlat19;
bool u_xlatb19;
mediump float u_xlat16_20;
float u_xlat23;
#define UNITY_DYNAMIC_INDEX_ES2 0






vec4 _AdditionalLightsPositionDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _AdditionalLightsPosition[i];
#else
#define d_ar _AdditionalLightsPosition
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}


mediump vec4 _AdditionalLightsAttenuationDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _AdditionalLightsAttenuation[i];
#else
#define d_ar _AdditionalLightsAttenuation
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}


mediump vec4 _AdditionalLightsSpotDirDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _AdditionalLightsSpotDir[i];
#else
#define d_ar _AdditionalLightsSpotDir
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}


mediump vec4 _AdditionalLightsColorDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _AdditionalLightsColor[i];
#else
#define d_ar _AdditionalLightsColor
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}

void main()
{
    u_xlat10_0 = texture2D(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _BaseColor;
    u_xlat1.x = texture2D(_MainLightShadowmapTexture, vs_TEXCOORD7.xy).x;
    u_xlatb1 = u_xlat1.x<vs_TEXCOORD7.z;
    u_xlat16_2.x = (-_MainLightShadowParams.x) + 1.0;
    u_xlat16_8 = (u_xlatb1) ? 0.0 : _MainLightShadowParams.x;
    u_xlat16_2.x = u_xlat16_8 + u_xlat16_2.x;
    u_xlatb1 = 0.0>=vs_TEXCOORD7.z;
    u_xlatb7 = vs_TEXCOORD7.z>=1.0;
    u_xlatb1 = u_xlatb7 || u_xlatb1;
    u_xlat16_2.x = (u_xlatb1) ? 1.0 : u_xlat16_2.x;
    u_xlat1.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = u_xlat1.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat16_8 = u_xlat1.x * u_xlat1.x;
    u_xlat16_14 = (-u_xlat16_2.x) + 1.0;
    u_xlat16_2.x = u_xlat16_8 * u_xlat16_14 + u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * unity_LightData.z;
    u_xlat16_2.xyz = u_xlat16_2.xxx * _MainLightColor.xyz;
    u_xlat16_20 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
    u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_20) + vs_TEXCOORD1.xyz;
    u_xlat16_20 = min(_AdditionalLightsCount.x, unity_LightData.y);
    u_xlati1 = int(u_xlat16_20);
    u_xlat16_3.xyz = u_xlat16_2.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<u_xlati1 ; u_xlati_loop_1++)
    {
        u_xlat13 = float(u_xlati_loop_1);
        u_xlatb19 = u_xlat13<2.0;
        u_xlat16_4.xy = (bool(u_xlatb19)) ? unity_LightIndices[0].xy : unity_LightIndices[0].zw;
        u_xlat5.x = u_xlat13 + -2.0;
        u_xlat13 = (u_xlatb19) ? u_xlat13 : u_xlat5.x;
        u_xlatb13 = u_xlat13<1.0;
        u_xlat16_20 = (u_xlatb13) ? u_xlat16_4.x : u_xlat16_4.y;
        u_xlati13 = int(u_xlat16_20);
        u_xlat5.xyz = (-vs_TEXCOORD2.xyz) * _AdditionalLightsPositionDynamicIndex(u_xlati13).www + _AdditionalLightsPositionDynamicIndex(u_xlati13).xyz;
        u_xlat19 = dot(u_xlat5.xyz, u_xlat5.xyz);
        u_xlat19 = max(u_xlat19, 6.10351562e-05);
        u_xlat23 = inversesqrt(u_xlat19);
        u_xlat5.xyz = vec3(u_xlat23) * u_xlat5.xyz;
        u_xlat23 = float(1.0) / u_xlat19;
        u_xlat19 = u_xlat19 * _AdditionalLightsAttenuationDynamicIndex(u_xlati13).x + _AdditionalLightsAttenuationDynamicIndex(u_xlati13).y;
        u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
        u_xlat19 = u_xlat19 * u_xlat23;
        u_xlat16_20 = dot(_AdditionalLightsSpotDirDynamicIndex(u_xlati13).xyz, u_xlat5.xyz);
        u_xlat16_20 = u_xlat16_20 * _AdditionalLightsAttenuationDynamicIndex(u_xlati13).z + _AdditionalLightsAttenuationDynamicIndex(u_xlati13).w;
        u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
        u_xlat16_20 = u_xlat16_20 * u_xlat16_20;
        u_xlat19 = u_xlat19 * u_xlat16_20;
        u_xlat16_4.xyz = vec3(u_xlat19) * _AdditionalLightsColorDynamicIndex(u_xlati13).xyz;
        u_xlat16_20 = dot(vs_TEXCOORD3.xyz, u_xlat5.xyz);
        u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
        u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(u_xlat16_20) + u_xlat16_3.xyz;
    }
    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlatb1 = _Surface==1.0;
    SV_Target0.w = (u_xlatb1) ? u_xlat16_0.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_MAIN_LIGHT_SHADOWS" "_MAIN_LIGHT_SHADOWS_CASCADE" }
Local Keywords { "_ALPHAPREMULTIPLY_ON" "_RECEIVE_SHADOWS_OFF" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb22 = unity_OrthoParams.w==0.0;
#endif
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb3;
mediump float u_xlat16_12;
void main()
{
    u_xlat16_0.xyz = _MainLightColor.xyz * unity_LightData.zzz;
    u_xlat16_12 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12 = min(max(u_xlat16_12, 0.0), 1.0);
#else
    u_xlat16_12 = clamp(u_xlat16_12, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(u_xlat16_12) + vs_TEXCOORD1.xyz;
    u_xlat16_1 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat16_1 * _BaseColor;
    u_xlat16_2.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_Surface==1.0);
#else
    u_xlatb3 = _Surface==1.0;
#endif
    SV_Target0.w = (u_xlatb3) ? u_xlat16_1.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles " {
Keywords { "_ADDITIONAL_LIGHTS" "_MAIN_LIGHT_SHADOWS" }
Local Keywords { "_ALPHAPREMULTIPLY_ON" "_RECEIVE_SHADOWS_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _BaseMap_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlatb22 = unity_OrthoParams.w==0.0;
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	mediump vec4 _AdditionalLightsCount;
uniform 	vec4 _AdditionalLightsPosition[16];
uniform 	mediump vec4 _AdditionalLightsColor[16];
uniform 	mediump vec4 _AdditionalLightsAttenuation[16];
uniform 	mediump vec4 _AdditionalLightsSpotDir[16];
uniform 	mediump vec4 unity_LightData;
uniform 	mediump vec4 unity_LightIndices[2];
uniform 	mediump vec4 _BaseColor;
uniform 	mediump float _Surface;
uniform lowp sampler2D _BaseMap;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
int u_xlati3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
int u_xlati10;
float u_xlat17;
int u_xlati17;
bool u_xlatb17;
mediump float u_xlat16_22;
float u_xlat24;
bool u_xlatb24;
float u_xlat27;
#define UNITY_DYNAMIC_INDEX_ES2 0






vec4 _AdditionalLightsPositionDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _AdditionalLightsPosition[i];
#else
#define d_ar _AdditionalLightsPosition
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}


mediump vec4 _AdditionalLightsAttenuationDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _AdditionalLightsAttenuation[i];
#else
#define d_ar _AdditionalLightsAttenuation
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}


mediump vec4 _AdditionalLightsSpotDirDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _AdditionalLightsSpotDir[i];
#else
#define d_ar _AdditionalLightsSpotDir
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}


mediump vec4 _AdditionalLightsColorDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _AdditionalLightsColor[i];
#else
#define d_ar _AdditionalLightsColor
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}

void main()
{
    u_xlat10_0 = texture2D(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _BaseColor;
    u_xlat16_1.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat16_2.xyz = _MainLightColor.xyz * unity_LightData.zzz;
    u_xlat16_22 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
    u_xlat16_22 = clamp(u_xlat16_22, 0.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_22) + vs_TEXCOORD1.xyz;
    u_xlat16_22 = min(_AdditionalLightsCount.x, unity_LightData.y);
    u_xlati3 = int(u_xlat16_22);
    u_xlat16_4.xyz = u_xlat16_2.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<u_xlati3 ; u_xlati_loop_1++)
    {
        u_xlat17 = float(u_xlati_loop_1);
        u_xlatb24 = u_xlat17<2.0;
        u_xlat16_5.xy = (bool(u_xlatb24)) ? unity_LightIndices[0].xy : unity_LightIndices[0].zw;
        u_xlat6.x = u_xlat17 + -2.0;
        u_xlat17 = (u_xlatb24) ? u_xlat17 : u_xlat6.x;
        u_xlatb17 = u_xlat17<1.0;
        u_xlat16_22 = (u_xlatb17) ? u_xlat16_5.x : u_xlat16_5.y;
        u_xlati17 = int(u_xlat16_22);
        u_xlat6.xyz = (-vs_TEXCOORD2.xyz) * _AdditionalLightsPositionDynamicIndex(u_xlati17).www + _AdditionalLightsPositionDynamicIndex(u_xlati17).xyz;
        u_xlat24 = dot(u_xlat6.xyz, u_xlat6.xyz);
        u_xlat24 = max(u_xlat24, 6.10351562e-05);
        u_xlat27 = inversesqrt(u_xlat24);
        u_xlat6.xyz = vec3(u_xlat27) * u_xlat6.xyz;
        u_xlat27 = float(1.0) / u_xlat24;
        u_xlat24 = u_xlat24 * _AdditionalLightsAttenuationDynamicIndex(u_xlati17).x + _AdditionalLightsAttenuationDynamicIndex(u_xlati17).y;
        u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
        u_xlat24 = u_xlat24 * u_xlat27;
        u_xlat16_22 = dot(_AdditionalLightsSpotDirDynamicIndex(u_xlati17).xyz, u_xlat6.xyz);
        u_xlat16_22 = u_xlat16_22 * _AdditionalLightsAttenuationDynamicIndex(u_xlati17).z + _AdditionalLightsAttenuationDynamicIndex(u_xlati17).w;
        u_xlat16_22 = clamp(u_xlat16_22, 0.0, 1.0);
        u_xlat16_22 = u_xlat16_22 * u_xlat16_22;
        u_xlat24 = u_xlat16_22 * u_xlat24;
        u_xlat16_5.xyz = vec3(u_xlat24) * _AdditionalLightsColorDynamicIndex(u_xlati17).xyz;
        u_xlat16_22 = dot(vs_TEXCOORD3.xyz, u_xlat6.xyz);
        u_xlat16_22 = clamp(u_xlat16_22, 0.0, 1.0);
        u_xlat16_4.xyz = u_xlat16_5.xyz * vec3(u_xlat16_22) + u_xlat16_4.xyz;
    }
    SV_Target0.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlatb3 = _Surface==1.0;
    SV_Target0.w = (u_xlatb3) ? u_xlat16_0.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_MAIN_LIGHT_SHADOWS" "_MAIN_LIGHT_SHADOWS_CASCADE" }
Local Keywords { "_ALPHAPREMULTIPLY_ON" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb22 = unity_OrthoParams.w==0.0;
#endif
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4_MainLightWorldToShadow[20];
uniform 	vec4 _CascadeShadowSplitSpheres0;
uniform 	vec4 _CascadeShadowSplitSpheres1;
uniform 	vec4 _CascadeShadowSplitSpheres2;
uniform 	vec4 _CascadeShadowSplitSpheres3;
uniform 	vec4 _CascadeShadowSplitSphereRadii;
uniform 	mediump vec4 _MainLightShadowParams;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainLightShadowmapTexture;
UNITY_LOCATION(2) uniform mediump sampler2DShadow hlslcc_zcmp_MainLightShadowmapTexture;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bvec4 u_xlatb0;
vec3 u_xlat1;
mediump float u_xlat16_1;
int u_xlati1;
uint u_xlatu1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
vec3 u_xlat6;
bool u_xlatb6;
mediump float u_xlat16_7;
mediump float u_xlat16_12;
bool u_xlatb16;
mediump float u_xlat16_17;
void main()
{
    u_xlat0.xyz = vs_TEXCOORD2.xyz + (-_CascadeShadowSplitSpheres0.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat1.xyz = vs_TEXCOORD2.xyz + (-_CascadeShadowSplitSpheres1.xyz);
    u_xlat0.y = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.xyz = vs_TEXCOORD2.xyz + (-_CascadeShadowSplitSpheres2.xyz);
    u_xlat0.z = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.xyz = vs_TEXCOORD2.xyz + (-_CascadeShadowSplitSpheres3.xyz);
    u_xlat0.w = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlatb0 = lessThan(u_xlat0, _CascadeShadowSplitSphereRadii);
    u_xlat16_2.x = (u_xlatb0.x) ? float(-1.0) : float(-0.0);
    u_xlat16_2.y = (u_xlatb0.y) ? float(-1.0) : float(-0.0);
    u_xlat16_2.z = (u_xlatb0.z) ? float(-1.0) : float(-0.0);
    u_xlat16_0.x = (u_xlatb0.x) ? float(1.0) : float(0.0);
    u_xlat16_0.y = (u_xlatb0.y) ? float(1.0) : float(0.0);
    u_xlat16_0.z = (u_xlatb0.z) ? float(1.0) : float(0.0);
    u_xlat16_0.w = (u_xlatb0.w) ? float(1.0) : float(0.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_0.yzw;
    u_xlat16_0.yzw = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.x = dot(u_xlat16_0, vec4(4.0, 3.0, 2.0, 1.0));
    u_xlat16_2.x = (-u_xlat16_2.x) + 4.0;
    u_xlatu1 = uint(u_xlat16_2.x);
    u_xlati1 = int(int(u_xlatu1) << 2);
    u_xlat6.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4_MainLightWorldToShadow[(u_xlati1 + 1)].xyz;
    u_xlat6.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[u_xlati1].xyz * vs_TEXCOORD2.xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[(u_xlati1 + 2)].xyz * vs_TEXCOORD2.zzz + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat6.xyz + hlslcc_mtx4x4_MainLightWorldToShadow[(u_xlati1 + 3)].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(0.0>=u_xlat1.z);
#else
    u_xlatb16 = 0.0>=u_xlat1.z;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlat1.z>=1.0);
#else
    u_xlatb3 = u_xlat1.z>=1.0;
#endif
    vec3 txVec0 = vec3(u_xlat1.xy,u_xlat1.z);
    u_xlat16_1 = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec0, 0.0);
    u_xlatb6 = u_xlatb16 || u_xlatb3;
    u_xlat16_2.x = (-_MainLightShadowParams.x) + 1.0;
    u_xlat16_2.x = u_xlat16_1 * _MainLightShadowParams.x + u_xlat16_2.x;
    u_xlat16_2.x = (u_xlatb6) ? 1.0 : u_xlat16_2.x;
    u_xlat16_7 = (-u_xlat16_2.x) + 1.0;
    u_xlat1.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = u_xlat1.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_12 = u_xlat1.x * u_xlat1.x;
    u_xlat16_2.x = u_xlat16_12 * u_xlat16_7 + u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * unity_LightData.z;
    u_xlat16_2.xyz = u_xlat16_2.xxx * _MainLightColor.xyz;
    u_xlat16_17 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_17 = min(max(u_xlat16_17, 0.0), 1.0);
#else
    u_xlat16_17 = clamp(u_xlat16_17, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_17) + vs_TEXCOORD1.xyz;
    u_xlat16_0 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * _BaseColor;
    u_xlat16_4.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    SV_Target0.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_Surface==1.0);
#else
    u_xlatb1 = _Surface==1.0;
#endif
    SV_Target0.w = (u_xlatb1) ? u_xlat16_0.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles " {
Keywords { "_ADDITIONAL_LIGHTS" "_MAIN_LIGHT_SHADOWS" }
Local Keywords { "_ALPHAPREMULTIPLY_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _BaseMap_ST;
uniform 	vec4 hlslcc_mtx4x4_MainLightWorldToShadow[20];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlatb22 = unity_OrthoParams.w==0.0;
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat5.xyz = u_xlat4.yyy * hlslcc_mtx4x4_MainLightWorldToShadow[1].xyz;
    u_xlat5.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[0].xyz * u_xlat4.xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[2].xyz * u_xlat4.zzz + u_xlat5.xyz;
    vs_TEXCOORD7.xyz = u_xlat5.xyz + hlslcc_mtx4x4_MainLightWorldToShadow[3].xyz;
    vs_TEXCOORD7.w = 0.0;
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	mediump vec4 _AdditionalLightsCount;
uniform 	vec4 _AdditionalLightsPosition[16];
uniform 	mediump vec4 _AdditionalLightsColor[16];
uniform 	mediump vec4 _AdditionalLightsAttenuation[16];
uniform 	mediump vec4 _AdditionalLightsSpotDir[16];
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 unity_LightData;
uniform 	mediump vec4 unity_LightIndices[2];
uniform 	mediump vec4 _BaseColor;
uniform 	mediump float _Surface;
uniform 	mediump vec4 _MainLightShadowParams;
uniform lowp sampler2D _BaseMap;
uniform highp sampler2D _MainLightShadowmapTexture;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
int u_xlati2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
int u_xlati9;
bool u_xlatb9;
mediump float u_xlat16_10;
float u_xlat16;
int u_xlati16;
bool u_xlatb16;
mediump float u_xlat16_22;
float u_xlat23;
bool u_xlatb23;
float u_xlat27;
#define UNITY_DYNAMIC_INDEX_ES2 0






vec4 _AdditionalLightsPositionDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _AdditionalLightsPosition[i];
#else
#define d_ar _AdditionalLightsPosition
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}


mediump vec4 _AdditionalLightsAttenuationDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _AdditionalLightsAttenuation[i];
#else
#define d_ar _AdditionalLightsAttenuation
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}


mediump vec4 _AdditionalLightsSpotDirDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _AdditionalLightsSpotDir[i];
#else
#define d_ar _AdditionalLightsSpotDir
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}


mediump vec4 _AdditionalLightsColorDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _AdditionalLightsColor[i];
#else
#define d_ar _AdditionalLightsColor
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}

void main()
{
    u_xlat10_0 = texture2D(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _BaseColor;
    u_xlat16_1.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat2.x = texture2D(_MainLightShadowmapTexture, vs_TEXCOORD7.xy).x;
    u_xlatb2 = u_xlat2.x<vs_TEXCOORD7.z;
    u_xlat16_22 = (-_MainLightShadowParams.x) + 1.0;
    u_xlat16_3.x = (u_xlatb2) ? 0.0 : _MainLightShadowParams.x;
    u_xlat16_22 = u_xlat16_22 + u_xlat16_3.x;
    u_xlatb2 = 0.0>=vs_TEXCOORD7.z;
    u_xlatb9 = vs_TEXCOORD7.z>=1.0;
    u_xlatb2 = u_xlatb9 || u_xlatb2;
    u_xlat16_22 = (u_xlatb2) ? 1.0 : u_xlat16_22;
    u_xlat2.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.x = u_xlat2.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat16_3.x = u_xlat2.x * u_xlat2.x;
    u_xlat16_10 = (-u_xlat16_22) + 1.0;
    u_xlat16_22 = u_xlat16_3.x * u_xlat16_10 + u_xlat16_22;
    u_xlat16_22 = u_xlat16_22 * unity_LightData.z;
    u_xlat16_3.xyz = vec3(u_xlat16_22) * _MainLightColor.xyz;
    u_xlat16_22 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
    u_xlat16_22 = clamp(u_xlat16_22, 0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(u_xlat16_22) + vs_TEXCOORD1.xyz;
    u_xlat16_22 = min(_AdditionalLightsCount.x, unity_LightData.y);
    u_xlati2 = int(u_xlat16_22);
    u_xlat16_4.xyz = u_xlat16_3.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<u_xlati2 ; u_xlati_loop_1++)
    {
        u_xlat16 = float(u_xlati_loop_1);
        u_xlatb23 = u_xlat16<2.0;
        u_xlat16_5.xy = (bool(u_xlatb23)) ? unity_LightIndices[0].xy : unity_LightIndices[0].zw;
        u_xlat6.x = u_xlat16 + -2.0;
        u_xlat16 = (u_xlatb23) ? u_xlat16 : u_xlat6.x;
        u_xlatb16 = u_xlat16<1.0;
        u_xlat16_22 = (u_xlatb16) ? u_xlat16_5.x : u_xlat16_5.y;
        u_xlati16 = int(u_xlat16_22);
        u_xlat6.xyz = (-vs_TEXCOORD2.xyz) * _AdditionalLightsPositionDynamicIndex(u_xlati16).www + _AdditionalLightsPositionDynamicIndex(u_xlati16).xyz;
        u_xlat23 = dot(u_xlat6.xyz, u_xlat6.xyz);
        u_xlat23 = max(u_xlat23, 6.10351562e-05);
        u_xlat27 = inversesqrt(u_xlat23);
        u_xlat6.xyz = vec3(u_xlat27) * u_xlat6.xyz;
        u_xlat27 = float(1.0) / u_xlat23;
        u_xlat23 = u_xlat23 * _AdditionalLightsAttenuationDynamicIndex(u_xlati16).x + _AdditionalLightsAttenuationDynamicIndex(u_xlati16).y;
        u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
        u_xlat23 = u_xlat23 * u_xlat27;
        u_xlat16_22 = dot(_AdditionalLightsSpotDirDynamicIndex(u_xlati16).xyz, u_xlat6.xyz);
        u_xlat16_22 = u_xlat16_22 * _AdditionalLightsAttenuationDynamicIndex(u_xlati16).z + _AdditionalLightsAttenuationDynamicIndex(u_xlati16).w;
        u_xlat16_22 = clamp(u_xlat16_22, 0.0, 1.0);
        u_xlat16_22 = u_xlat16_22 * u_xlat16_22;
        u_xlat23 = u_xlat16_22 * u_xlat23;
        u_xlat16_5.xyz = vec3(u_xlat23) * _AdditionalLightsColorDynamicIndex(u_xlati16).xyz;
        u_xlat16_22 = dot(vs_TEXCOORD3.xyz, u_xlat6.xyz);
        u_xlat16_22 = clamp(u_xlat16_22, 0.0, 1.0);
        u_xlat16_4.xyz = u_xlat16_5.xyz * vec3(u_xlat16_22) + u_xlat16_4.xyz;
    }
    SV_Target0.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlatb2 = _Surface==1.0;
    SV_Target0.w = (u_xlatb2) ? u_xlat16_0.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_MAIN_LIGHT_SHADOWS" "_MAIN_LIGHT_SHADOWS_CASCADE" }
Local Keywords { "_RECEIVE_SHADOWS_OFF" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb22 = unity_OrthoParams.w==0.0;
#endif
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec4 u_xlat16_1;
bool u_xlatb2;
mediump float u_xlat16_9;
void main()
{
    u_xlat16_0.xyz = _MainLightColor.xyz * unity_LightData.zzz;
    u_xlat16_9 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9 = min(max(u_xlat16_9, 0.0), 1.0);
#else
    u_xlat16_9 = clamp(u_xlat16_9, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(u_xlat16_9) + vs_TEXCOORD1.xyz;
    u_xlat16_1 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat16_1 * _BaseColor;
    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_Surface==1.0);
#else
    u_xlatb2 = _Surface==1.0;
#endif
    SV_Target0.w = (u_xlatb2) ? u_xlat16_1.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles " {
Keywords { "_ADDITIONAL_LIGHTS" "_MAIN_LIGHT_SHADOWS" }
Local Keywords { "_RECEIVE_SHADOWS_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _BaseMap_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlatb22 = unity_OrthoParams.w==0.0;
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	mediump vec4 _AdditionalLightsCount;
uniform 	vec4 _AdditionalLightsPosition[16];
uniform 	mediump vec4 _AdditionalLightsColor[16];
uniform 	mediump vec4 _AdditionalLightsAttenuation[16];
uniform 	mediump vec4 _AdditionalLightsSpotDir[16];
uniform 	mediump vec4 unity_LightData;
uniform 	mediump vec4 unity_LightIndices[2];
uniform 	mediump vec4 _BaseColor;
uniform 	mediump float _Surface;
uniform lowp sampler2D _BaseMap;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
int u_xlati2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
int u_xlati8;
float u_xlat14;
int u_xlati14;
bool u_xlatb14;
mediump float u_xlat16_19;
float u_xlat20;
bool u_xlatb20;
float u_xlat23;
#define UNITY_DYNAMIC_INDEX_ES2 0






vec4 _AdditionalLightsPositionDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _AdditionalLightsPosition[i];
#else
#define d_ar _AdditionalLightsPosition
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}


mediump vec4 _AdditionalLightsAttenuationDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _AdditionalLightsAttenuation[i];
#else
#define d_ar _AdditionalLightsAttenuation
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}


mediump vec4 _AdditionalLightsSpotDirDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _AdditionalLightsSpotDir[i];
#else
#define d_ar _AdditionalLightsSpotDir
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}


mediump vec4 _AdditionalLightsColorDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _AdditionalLightsColor[i];
#else
#define d_ar _AdditionalLightsColor
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}

void main()
{
    u_xlat10_0 = texture2D(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _BaseColor;
    u_xlat16_1.xyz = _MainLightColor.xyz * unity_LightData.zzz;
    u_xlat16_19 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(u_xlat16_19) + vs_TEXCOORD1.xyz;
    u_xlat16_19 = min(_AdditionalLightsCount.x, unity_LightData.y);
    u_xlati2 = int(u_xlat16_19);
    u_xlat16_3.xyz = u_xlat16_1.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<u_xlati2 ; u_xlati_loop_1++)
    {
        u_xlat14 = float(u_xlati_loop_1);
        u_xlatb20 = u_xlat14<2.0;
        u_xlat16_4.xy = (bool(u_xlatb20)) ? unity_LightIndices[0].xy : unity_LightIndices[0].zw;
        u_xlat5.x = u_xlat14 + -2.0;
        u_xlat14 = (u_xlatb20) ? u_xlat14 : u_xlat5.x;
        u_xlatb14 = u_xlat14<1.0;
        u_xlat16_19 = (u_xlatb14) ? u_xlat16_4.x : u_xlat16_4.y;
        u_xlati14 = int(u_xlat16_19);
        u_xlat5.xyz = (-vs_TEXCOORD2.xyz) * _AdditionalLightsPositionDynamicIndex(u_xlati14).www + _AdditionalLightsPositionDynamicIndex(u_xlati14).xyz;
        u_xlat20 = dot(u_xlat5.xyz, u_xlat5.xyz);
        u_xlat20 = max(u_xlat20, 6.10351562e-05);
        u_xlat23 = inversesqrt(u_xlat20);
        u_xlat5.xyz = vec3(u_xlat23) * u_xlat5.xyz;
        u_xlat23 = float(1.0) / u_xlat20;
        u_xlat20 = u_xlat20 * _AdditionalLightsAttenuationDynamicIndex(u_xlati14).x + _AdditionalLightsAttenuationDynamicIndex(u_xlati14).y;
        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
        u_xlat20 = u_xlat20 * u_xlat23;
        u_xlat16_19 = dot(_AdditionalLightsSpotDirDynamicIndex(u_xlati14).xyz, u_xlat5.xyz);
        u_xlat16_19 = u_xlat16_19 * _AdditionalLightsAttenuationDynamicIndex(u_xlati14).z + _AdditionalLightsAttenuationDynamicIndex(u_xlati14).w;
        u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
        u_xlat16_19 = u_xlat16_19 * u_xlat16_19;
        u_xlat20 = u_xlat16_19 * u_xlat20;
        u_xlat16_4.xyz = vec3(u_xlat20) * _AdditionalLightsColorDynamicIndex(u_xlati14).xyz;
        u_xlat16_19 = dot(vs_TEXCOORD3.xyz, u_xlat5.xyz);
        u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
        u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(u_xlat16_19) + u_xlat16_3.xyz;
    }
    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlatb2 = _Surface==1.0;
    SV_Target0.w = (u_xlatb2) ? u_xlat16_0.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_MAIN_LIGHT_SHADOWS" "_MAIN_LIGHT_SHADOWS_CASCADE" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb22 = unity_OrthoParams.w==0.0;
#endif
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4_MainLightWorldToShadow[20];
uniform 	vec4 _CascadeShadowSplitSpheres0;
uniform 	vec4 _CascadeShadowSplitSpheres1;
uniform 	vec4 _CascadeShadowSplitSpheres2;
uniform 	vec4 _CascadeShadowSplitSpheres3;
uniform 	vec4 _CascadeShadowSplitSphereRadii;
uniform 	mediump vec4 _MainLightShadowParams;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainLightShadowmapTexture;
UNITY_LOCATION(2) uniform mediump sampler2DShadow hlslcc_zcmp_MainLightShadowmapTexture;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bvec4 u_xlatb0;
vec3 u_xlat1;
mediump float u_xlat16_1;
int u_xlati1;
uint u_xlatu1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
bool u_xlatb3;
vec3 u_xlat5;
bool u_xlatb5;
mediump float u_xlat16_6;
mediump float u_xlat16_10;
bool u_xlatb13;
mediump float u_xlat16_14;
void main()
{
    u_xlat0.xyz = vs_TEXCOORD2.xyz + (-_CascadeShadowSplitSpheres0.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat1.xyz = vs_TEXCOORD2.xyz + (-_CascadeShadowSplitSpheres1.xyz);
    u_xlat0.y = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.xyz = vs_TEXCOORD2.xyz + (-_CascadeShadowSplitSpheres2.xyz);
    u_xlat0.z = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.xyz = vs_TEXCOORD2.xyz + (-_CascadeShadowSplitSpheres3.xyz);
    u_xlat0.w = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlatb0 = lessThan(u_xlat0, _CascadeShadowSplitSphereRadii);
    u_xlat16_2.x = (u_xlatb0.x) ? float(-1.0) : float(-0.0);
    u_xlat16_2.y = (u_xlatb0.y) ? float(-1.0) : float(-0.0);
    u_xlat16_2.z = (u_xlatb0.z) ? float(-1.0) : float(-0.0);
    u_xlat16_0.x = (u_xlatb0.x) ? float(1.0) : float(0.0);
    u_xlat16_0.y = (u_xlatb0.y) ? float(1.0) : float(0.0);
    u_xlat16_0.z = (u_xlatb0.z) ? float(1.0) : float(0.0);
    u_xlat16_0.w = (u_xlatb0.w) ? float(1.0) : float(0.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_0.yzw;
    u_xlat16_0.yzw = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.x = dot(u_xlat16_0, vec4(4.0, 3.0, 2.0, 1.0));
    u_xlat16_2.x = (-u_xlat16_2.x) + 4.0;
    u_xlatu1 = uint(u_xlat16_2.x);
    u_xlati1 = int(int(u_xlatu1) << 2);
    u_xlat5.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4_MainLightWorldToShadow[(u_xlati1 + 1)].xyz;
    u_xlat5.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[u_xlati1].xyz * vs_TEXCOORD2.xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[(u_xlati1 + 2)].xyz * vs_TEXCOORD2.zzz + u_xlat5.xyz;
    u_xlat1.xyz = u_xlat5.xyz + hlslcc_mtx4x4_MainLightWorldToShadow[(u_xlati1 + 3)].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(0.0>=u_xlat1.z);
#else
    u_xlatb13 = 0.0>=u_xlat1.z;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlat1.z>=1.0);
#else
    u_xlatb3 = u_xlat1.z>=1.0;
#endif
    vec3 txVec0 = vec3(u_xlat1.xy,u_xlat1.z);
    u_xlat16_1 = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec0, 0.0);
    u_xlatb5 = u_xlatb13 || u_xlatb3;
    u_xlat16_2.x = (-_MainLightShadowParams.x) + 1.0;
    u_xlat16_2.x = u_xlat16_1 * _MainLightShadowParams.x + u_xlat16_2.x;
    u_xlat16_2.x = (u_xlatb5) ? 1.0 : u_xlat16_2.x;
    u_xlat16_6 = (-u_xlat16_2.x) + 1.0;
    u_xlat1.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = u_xlat1.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_10 = u_xlat1.x * u_xlat1.x;
    u_xlat16_2.x = u_xlat16_10 * u_xlat16_6 + u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * unity_LightData.z;
    u_xlat16_2.xyz = u_xlat16_2.xxx * _MainLightColor.xyz;
    u_xlat16_14 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14 = min(max(u_xlat16_14, 0.0), 1.0);
#else
    u_xlat16_14 = clamp(u_xlat16_14, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_14) + vs_TEXCOORD1.xyz;
    u_xlat16_0 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * _BaseColor;
    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_Surface==1.0);
#else
    u_xlatb1 = _Surface==1.0;
#endif
    SV_Target0.w = (u_xlatb1) ? u_xlat16_0.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles " {
Keywords { "_ADDITIONAL_LIGHTS" "_MAIN_LIGHT_SHADOWS" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _BaseMap_ST;
uniform 	vec4 hlslcc_mtx4x4_MainLightWorldToShadow[20];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlatb22 = unity_OrthoParams.w==0.0;
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat5.xyz = u_xlat4.yyy * hlslcc_mtx4x4_MainLightWorldToShadow[1].xyz;
    u_xlat5.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[0].xyz * u_xlat4.xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[2].xyz * u_xlat4.zzz + u_xlat5.xyz;
    vs_TEXCOORD7.xyz = u_xlat5.xyz + hlslcc_mtx4x4_MainLightWorldToShadow[3].xyz;
    vs_TEXCOORD7.w = 0.0;
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	mediump vec4 _AdditionalLightsCount;
uniform 	vec4 _AdditionalLightsPosition[16];
uniform 	mediump vec4 _AdditionalLightsColor[16];
uniform 	mediump vec4 _AdditionalLightsAttenuation[16];
uniform 	mediump vec4 _AdditionalLightsSpotDir[16];
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 unity_LightData;
uniform 	mediump vec4 unity_LightIndices[2];
uniform 	mediump vec4 _BaseColor;
uniform 	mediump float _Surface;
uniform 	mediump vec4 _MainLightShadowParams;
uniform lowp sampler2D _BaseMap;
uniform highp sampler2D _MainLightShadowmapTexture;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
int u_xlati1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
int u_xlati7;
bool u_xlatb7;
mediump float u_xlat16_8;
float u_xlat13;
int u_xlati13;
bool u_xlatb13;
mediump float u_xlat16_14;
float u_xlat19;
bool u_xlatb19;
mediump float u_xlat16_20;
float u_xlat23;
#define UNITY_DYNAMIC_INDEX_ES2 0






vec4 _AdditionalLightsPositionDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _AdditionalLightsPosition[i];
#else
#define d_ar _AdditionalLightsPosition
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}


mediump vec4 _AdditionalLightsAttenuationDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _AdditionalLightsAttenuation[i];
#else
#define d_ar _AdditionalLightsAttenuation
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}


mediump vec4 _AdditionalLightsSpotDirDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _AdditionalLightsSpotDir[i];
#else
#define d_ar _AdditionalLightsSpotDir
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}


mediump vec4 _AdditionalLightsColorDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _AdditionalLightsColor[i];
#else
#define d_ar _AdditionalLightsColor
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}

void main()
{
    u_xlat10_0 = texture2D(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _BaseColor;
    u_xlat1.x = texture2D(_MainLightShadowmapTexture, vs_TEXCOORD7.xy).x;
    u_xlatb1 = u_xlat1.x<vs_TEXCOORD7.z;
    u_xlat16_2.x = (-_MainLightShadowParams.x) + 1.0;
    u_xlat16_8 = (u_xlatb1) ? 0.0 : _MainLightShadowParams.x;
    u_xlat16_2.x = u_xlat16_8 + u_xlat16_2.x;
    u_xlatb1 = 0.0>=vs_TEXCOORD7.z;
    u_xlatb7 = vs_TEXCOORD7.z>=1.0;
    u_xlatb1 = u_xlatb7 || u_xlatb1;
    u_xlat16_2.x = (u_xlatb1) ? 1.0 : u_xlat16_2.x;
    u_xlat1.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = u_xlat1.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat16_8 = u_xlat1.x * u_xlat1.x;
    u_xlat16_14 = (-u_xlat16_2.x) + 1.0;
    u_xlat16_2.x = u_xlat16_8 * u_xlat16_14 + u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * unity_LightData.z;
    u_xlat16_2.xyz = u_xlat16_2.xxx * _MainLightColor.xyz;
    u_xlat16_20 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
    u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_20) + vs_TEXCOORD1.xyz;
    u_xlat16_20 = min(_AdditionalLightsCount.x, unity_LightData.y);
    u_xlati1 = int(u_xlat16_20);
    u_xlat16_3.xyz = u_xlat16_2.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<u_xlati1 ; u_xlati_loop_1++)
    {
        u_xlat13 = float(u_xlati_loop_1);
        u_xlatb19 = u_xlat13<2.0;
        u_xlat16_4.xy = (bool(u_xlatb19)) ? unity_LightIndices[0].xy : unity_LightIndices[0].zw;
        u_xlat5.x = u_xlat13 + -2.0;
        u_xlat13 = (u_xlatb19) ? u_xlat13 : u_xlat5.x;
        u_xlatb13 = u_xlat13<1.0;
        u_xlat16_20 = (u_xlatb13) ? u_xlat16_4.x : u_xlat16_4.y;
        u_xlati13 = int(u_xlat16_20);
        u_xlat5.xyz = (-vs_TEXCOORD2.xyz) * _AdditionalLightsPositionDynamicIndex(u_xlati13).www + _AdditionalLightsPositionDynamicIndex(u_xlati13).xyz;
        u_xlat19 = dot(u_xlat5.xyz, u_xlat5.xyz);
        u_xlat19 = max(u_xlat19, 6.10351562e-05);
        u_xlat23 = inversesqrt(u_xlat19);
        u_xlat5.xyz = vec3(u_xlat23) * u_xlat5.xyz;
        u_xlat23 = float(1.0) / u_xlat19;
        u_xlat19 = u_xlat19 * _AdditionalLightsAttenuationDynamicIndex(u_xlati13).x + _AdditionalLightsAttenuationDynamicIndex(u_xlati13).y;
        u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
        u_xlat19 = u_xlat19 * u_xlat23;
        u_xlat16_20 = dot(_AdditionalLightsSpotDirDynamicIndex(u_xlati13).xyz, u_xlat5.xyz);
        u_xlat16_20 = u_xlat16_20 * _AdditionalLightsAttenuationDynamicIndex(u_xlati13).z + _AdditionalLightsAttenuationDynamicIndex(u_xlati13).w;
        u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
        u_xlat16_20 = u_xlat16_20 * u_xlat16_20;
        u_xlat19 = u_xlat19 * u_xlat16_20;
        u_xlat16_4.xyz = vec3(u_xlat19) * _AdditionalLightsColorDynamicIndex(u_xlati13).xyz;
        u_xlat16_20 = dot(vs_TEXCOORD3.xyz, u_xlat5.xyz);
        u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
        u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(u_xlat16_20) + u_xlat16_3.xyz;
    }
    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlatb1 = _Surface==1.0;
    SV_Target0.w = (u_xlatb1) ? u_xlat16_0.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_ADDITIONAL_LIGHTS" "_MAIN_LIGHT_SHADOWS" }
Local Keywords { "_EMISSION" "_GLOSSINESS_FROM_BASE_ALPHA" "_SPECULAR_COLOR" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4_MainLightWorldToShadow[20];
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
out highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb22 = unity_OrthoParams.w==0.0;
#endif
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat5.xyz = u_xlat4.yyy * hlslcc_mtx4x4_MainLightWorldToShadow[1].xyz;
    u_xlat5.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[0].xyz * u_xlat4.xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[2].xyz * u_xlat4.zzz + u_xlat5.xyz;
    vs_TEXCOORD7.xyz = u_xlat5.xyz + hlslcc_mtx4x4_MainLightWorldToShadow[3].xyz;
    vs_TEXCOORD7.w = 0.0;
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
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
vec4 ImmCB_0[4];
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	mediump vec4 _AdditionalLightsCount;
uniform 	vec4 _AdditionalLightsPosition[16];
uniform 	mediump vec4 _AdditionalLightsColor[16];
uniform 	mediump vec4 _AdditionalLightsAttenuation[16];
uniform 	mediump vec4 _AdditionalLightsSpotDir[16];
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _MainLightShadowParams;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
UNITY_LOCATION(1) uniform mediump sampler2D _EmissionMap;
UNITY_LOCATION(2) uniform mediump sampler2D _MainLightShadowmapTexture;
UNITY_LOCATION(3) uniform mediump sampler2DShadow hlslcc_zcmp_MainLightShadowmapTexture;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
uint u_xlatu3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump float u_xlat16_13;
vec3 u_xlat14;
int u_xlati14;
bool u_xlatb14;
mediump float u_xlat16_24;
float u_xlat25;
uint u_xlatu25;
float u_xlat34;
mediump float u_xlat16_34;
uint u_xlatu34;
bool u_xlatb34;
mediump float u_xlat16_35;
float u_xlat36;
void main()
{
ImmCB_0[0] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.0,1.0,0.0,0.0);
ImmCB_0[2] = vec4(0.0,0.0,1.0,0.0);
ImmCB_0[3] = vec4(0.0,0.0,0.0,1.0);
    u_xlat16_0 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * _BaseColor;
    u_xlat16_1.xyz = texture(_EmissionMap, vs_TEXCOORD0.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * _EmissionColor.xyz;
    u_xlat16_2.x = u_xlat16_0.w * 10.0 + 1.0;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat34 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat34 = max(u_xlat34, 1.17549435e-38);
    u_xlat16_13 = inversesqrt(u_xlat34);
    vec3 txVec0 = vec3(vs_TEXCOORD7.xy,vs_TEXCOORD7.z);
    u_xlat16_34 = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec0, 0.0);
    u_xlat16_24 = (-_MainLightShadowParams.x) + 1.0;
    u_xlat16_24 = u_xlat16_34 * _MainLightShadowParams.x + u_xlat16_24;
#ifdef UNITY_ADRENO_ES3
    u_xlatb34 = !!(0.0>=vs_TEXCOORD7.z);
#else
    u_xlatb34 = 0.0>=vs_TEXCOORD7.z;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(vs_TEXCOORD7.z>=1.0);
#else
    u_xlatb3 = vs_TEXCOORD7.z>=1.0;
#endif
    u_xlatb34 = u_xlatb34 || u_xlatb3;
    u_xlat16_24 = (u_xlatb34) ? 1.0 : u_xlat16_24;
    u_xlat3.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat34 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat34 = u_xlat34 * _MainLightShadowParams.z + _MainLightShadowParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat34 = min(max(u_xlat34, 0.0), 1.0);
#else
    u_xlat34 = clamp(u_xlat34, 0.0, 1.0);
#endif
    u_xlat16_35 = u_xlat34 * u_xlat34;
    u_xlat16_4.x = (-u_xlat16_24) + 1.0;
    u_xlat16_24 = u_xlat16_35 * u_xlat16_4.x + u_xlat16_24;
    u_xlat16_24 = u_xlat16_24 * unity_LightData.z;
    u_xlat16_4.xyz = vec3(u_xlat16_24) * _MainLightColor.xyz;
    u_xlat16_24 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_24 = min(max(u_xlat16_24, 0.0), 1.0);
#else
    u_xlat16_24 = clamp(u_xlat16_24, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(u_xlat16_24) + vs_TEXCOORD1.xyz;
    u_xlat3.xyz = vs_TEXCOORD4.xyz * vec3(u_xlat16_13) + _MainLightPosition.xyz;
    u_xlat34 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat34 = max(u_xlat34, 1.17549435e-38);
    u_xlat16_24 = inversesqrt(u_xlat34);
    u_xlat3.xyz = vec3(u_xlat16_24) * u_xlat3.xyz;
    u_xlat34 = dot(vs_TEXCOORD3.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat34 = min(max(u_xlat34, 0.0), 1.0);
#else
    u_xlat34 = clamp(u_xlat34, 0.0, 1.0);
#endif
    u_xlat16_24 = log2(u_xlat34);
    u_xlat16_24 = u_xlat16_24 * u_xlat16_2.x;
    u_xlat16_24 = exp2(u_xlat16_24);
    u_xlat16_6.xyz = vec3(u_xlat16_24) * _SpecColor.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat16_24 = min(_AdditionalLightsCount.x, unity_LightData.y);
    u_xlatu34 =  uint(int(u_xlat16_24));
    u_xlat16_6.xyz = u_xlat16_5.xyz;
    u_xlat16_7.xyz = u_xlat16_4.xyz;
    for(uint u_xlatu_loop_1 = uint(0u) ; u_xlatu_loop_1<u_xlatu34 ; u_xlatu_loop_1++)
    {
        u_xlati14 = int(uint(u_xlatu_loop_1 & 3u));
        u_xlatu25 = uint(u_xlatu_loop_1 >> 2u);
        u_xlat16_24 = dot(unity_LightIndices[int(u_xlatu25)], ImmCB_0[u_xlati14]);
        u_xlati14 = int(u_xlat16_24);
        u_xlat8.xyz = (-vs_TEXCOORD2.xyz) * _AdditionalLightsPosition[u_xlati14].www + _AdditionalLightsPosition[u_xlati14].xyz;
        u_xlat25 = dot(u_xlat8.xyz, u_xlat8.xyz);
        u_xlat25 = max(u_xlat25, 6.10351562e-05);
        u_xlat36 = inversesqrt(u_xlat25);
        u_xlat8.xyz = vec3(u_xlat36) * u_xlat8.xyz;
        u_xlat36 = float(1.0) / float(u_xlat25);
        u_xlat25 = u_xlat25 * _AdditionalLightsAttenuation[u_xlati14].x + _AdditionalLightsAttenuation[u_xlati14].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat25 = min(max(u_xlat25, 0.0), 1.0);
#else
        u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
#endif
        u_xlat25 = u_xlat25 * u_xlat36;
        u_xlat16_24 = dot(_AdditionalLightsSpotDir[u_xlati14].xyz, u_xlat8.xyz);
        u_xlat16_24 = u_xlat16_24 * _AdditionalLightsAttenuation[u_xlati14].z + _AdditionalLightsAttenuation[u_xlati14].w;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_24 = min(max(u_xlat16_24, 0.0), 1.0);
#else
        u_xlat16_24 = clamp(u_xlat16_24, 0.0, 1.0);
#endif
        u_xlat16_24 = u_xlat16_24 * u_xlat16_24;
        u_xlat25 = u_xlat16_24 * u_xlat25;
        u_xlat16_9.xyz = vec3(u_xlat25) * _AdditionalLightsColor[u_xlati14].xyz;
        u_xlat16_24 = dot(vs_TEXCOORD3.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
        u_xlat16_24 = min(max(u_xlat16_24, 0.0), 1.0);
#else
        u_xlat16_24 = clamp(u_xlat16_24, 0.0, 1.0);
#endif
        u_xlat16_6.xyz = u_xlat16_9.xyz * vec3(u_xlat16_24) + u_xlat16_6.xyz;
        u_xlat14.xyz = vs_TEXCOORD4.xyz * vec3(u_xlat16_13) + u_xlat8.xyz;
        u_xlat8.x = dot(u_xlat14.xyz, u_xlat14.xyz);
        u_xlat8.x = max(u_xlat8.x, 1.17549435e-38);
        u_xlat16_24 = inversesqrt(u_xlat8.x);
        u_xlat14.xyz = vec3(u_xlat16_24) * u_xlat14.xyz;
        u_xlat14.x = dot(vs_TEXCOORD3.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
        u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
        u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
        u_xlat16_24 = log2(u_xlat14.x);
        u_xlat16_24 = u_xlat16_24 * u_xlat16_2.x;
        u_xlat16_24 = exp2(u_xlat16_24);
        u_xlat16_10.xyz = vec3(u_xlat16_24) * _SpecColor.xyz;
        u_xlat16_7.xyz = u_xlat16_9.xyz * u_xlat16_10.xyz + u_xlat16_7.xyz;
    }
    u_xlat16_2.xyz = u_xlat16_6.xyz * u_xlat16_0.xyz + u_xlat1.xyz;
    SV_Target0.xyz = u_xlat16_7.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_Surface==1.0);
#else
    u_xlatb1 = _Surface==1.0;
#endif
    SV_Target0.w = (u_xlatb1) ? u_xlat16_0.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles " {
Keywords { "_MAIN_LIGHT_SHADOWS" }
Local Keywords { "_EMISSION" "_GLOSSINESS_FROM_BASE_ALPHA" "_SPECULAR_COLOR" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _BaseMap_ST;
uniform 	vec4 hlslcc_mtx4x4_MainLightWorldToShadow[20];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlatb22 = unity_OrthoParams.w==0.0;
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat5.xyz = u_xlat4.yyy * hlslcc_mtx4x4_MainLightWorldToShadow[1].xyz;
    u_xlat5.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[0].xyz * u_xlat4.xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[2].xyz * u_xlat4.zzz + u_xlat5.xyz;
    vs_TEXCOORD7.xyz = u_xlat5.xyz + hlslcc_mtx4x4_MainLightWorldToShadow[3].xyz;
    vs_TEXCOORD7.w = 0.0;
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 unity_LightData;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _SpecColor;
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump float _Surface;
uniform 	mediump vec4 _MainLightShadowParams;
uniform lowp sampler2D _BaseMap;
uniform lowp sampler2D _EmissionMap;
uniform highp sampler2D _MainLightShadowmapTexture;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec3 u_xlat16_4;
bool u_xlatb5;
mediump float u_xlat16_6;
mediump float u_xlat16_11;
float u_xlat15;
mediump float u_xlat16_16;
mediump float u_xlat16_17;
void main()
{
    u_xlat0.x = texture2D(_MainLightShadowmapTexture, vs_TEXCOORD7.xy).x;
    u_xlatb0 = u_xlat0.x<vs_TEXCOORD7.z;
    u_xlat16_1.x = (u_xlatb0) ? 0.0 : _MainLightShadowParams.x;
    u_xlat16_6 = (-_MainLightShadowParams.x) + 1.0;
    u_xlat16_1.x = u_xlat16_1.x + u_xlat16_6;
    u_xlatb0 = 0.0>=vs_TEXCOORD7.z;
    u_xlatb5 = vs_TEXCOORD7.z>=1.0;
    u_xlatb0 = u_xlatb5 || u_xlatb0;
    u_xlat16_1.x = (u_xlatb0) ? 1.0 : u_xlat16_1.x;
    u_xlat16_6 = (-u_xlat16_1.x) + 1.0;
    u_xlat0.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = u_xlat0.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_11 = u_xlat0.x * u_xlat0.x;
    u_xlat16_1.x = u_xlat16_11 * u_xlat16_6 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * unity_LightData.z;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _MainLightColor.xyz;
    u_xlat16_16 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
    u_xlat16_16 = clamp(u_xlat16_16, 0.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(u_xlat16_16) + vs_TEXCOORD1.xyz;
    u_xlat10_0.xyz = texture2D(_EmissionMap, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _EmissionColor.xyz;
    u_xlat10_3 = texture2D(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_3 = u_xlat10_3 * _BaseColor;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + u_xlat0.xyz;
    u_xlat0.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat16_16 = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = vs_TEXCOORD4.xyz * vec3(u_xlat16_16) + _MainLightPosition.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat16_16 = inversesqrt(u_xlat15);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_16);
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_16 = log2(u_xlat0.x);
    u_xlat16_17 = u_xlat16_3.w * 10.0 + 1.0;
    u_xlat16_17 = exp2(u_xlat16_17);
    u_xlat16_16 = u_xlat16_16 * u_xlat16_17;
    u_xlat16_16 = exp2(u_xlat16_16);
    u_xlat16_4.xyz = vec3(u_xlat16_16) * _SpecColor.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz + u_xlat16_2.xyz;
    u_xlatb0 = _Surface==1.0;
    SV_Target0.w = (u_xlatb0) ? u_xlat16_3.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_ADDITIONAL_LIGHTS" "_MAIN_LIGHT_SHADOWS" }
Local Keywords { "_EMISSION" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4_MainLightWorldToShadow[20];
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
out highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb22 = unity_OrthoParams.w==0.0;
#endif
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat5.xyz = u_xlat4.yyy * hlslcc_mtx4x4_MainLightWorldToShadow[1].xyz;
    u_xlat5.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[0].xyz * u_xlat4.xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[2].xyz * u_xlat4.zzz + u_xlat5.xyz;
    vs_TEXCOORD7.xyz = u_xlat5.xyz + hlslcc_mtx4x4_MainLightWorldToShadow[3].xyz;
    vs_TEXCOORD7.w = 0.0;
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
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
vec4 ImmCB_0[4];
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	mediump vec4 _AdditionalLightsCount;
uniform 	vec4 _AdditionalLightsPosition[16];
uniform 	mediump vec4 _AdditionalLightsColor[16];
uniform 	mediump vec4 _AdditionalLightsAttenuation[16];
uniform 	mediump vec4 _AdditionalLightsSpotDir[16];
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _MainLightShadowParams;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
UNITY_LOCATION(1) uniform mediump sampler2D _EmissionMap;
UNITY_LOCATION(2) uniform mediump sampler2D _MainLightShadowmapTexture;
UNITY_LOCATION(3) uniform mediump sampler2DShadow hlslcc_zcmp_MainLightShadowmapTexture;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
uint u_xlatu3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
mediump float u_xlat16_9;
int u_xlati10;
bool u_xlatb10;
mediump float u_xlat16_16;
float u_xlat17;
uint u_xlatu17;
float u_xlat22;
mediump float u_xlat16_22;
uint u_xlatu22;
bool u_xlatb22;
mediump float u_xlat16_23;
float u_xlat24;
void main()
{
ImmCB_0[0] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.0,1.0,0.0,0.0);
ImmCB_0[2] = vec4(0.0,0.0,1.0,0.0);
ImmCB_0[3] = vec4(0.0,0.0,0.0,1.0);
    u_xlat16_0 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * _BaseColor;
    u_xlat16_1.xyz = texture(_EmissionMap, vs_TEXCOORD0.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * _EmissionColor.xyz;
    vec3 txVec0 = vec3(vs_TEXCOORD7.xy,vs_TEXCOORD7.z);
    u_xlat16_22 = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec0, 0.0);
    u_xlat16_2.x = (-_MainLightShadowParams.x) + 1.0;
    u_xlat16_2.x = u_xlat16_22 * _MainLightShadowParams.x + u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(0.0>=vs_TEXCOORD7.z);
#else
    u_xlatb22 = 0.0>=vs_TEXCOORD7.z;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(vs_TEXCOORD7.z>=1.0);
#else
    u_xlatb3 = vs_TEXCOORD7.z>=1.0;
#endif
    u_xlatb22 = u_xlatb22 || u_xlatb3;
    u_xlat16_2.x = (u_xlatb22) ? 1.0 : u_xlat16_2.x;
    u_xlat3.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat22 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat22 = u_xlat22 * _MainLightShadowParams.z + _MainLightShadowParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat16_9 = u_xlat22 * u_xlat22;
    u_xlat16_16 = (-u_xlat16_2.x) + 1.0;
    u_xlat16_2.x = u_xlat16_9 * u_xlat16_16 + u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * unity_LightData.z;
    u_xlat16_2.xyz = u_xlat16_2.xxx * _MainLightColor.xyz;
    u_xlat16_23 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_23) + vs_TEXCOORD1.xyz;
    u_xlat16_23 = min(_AdditionalLightsCount.x, unity_LightData.y);
    u_xlatu22 =  uint(int(u_xlat16_23));
    u_xlat16_4.xyz = u_xlat16_2.xyz;
    for(uint u_xlatu_loop_1 = uint(0u) ; u_xlatu_loop_1<u_xlatu22 ; u_xlatu_loop_1++)
    {
        u_xlati10 = int(uint(u_xlatu_loop_1 & 3u));
        u_xlatu17 = uint(u_xlatu_loop_1 >> 2u);
        u_xlat16_23 = dot(unity_LightIndices[int(u_xlatu17)], ImmCB_0[u_xlati10]);
        u_xlati10 = int(u_xlat16_23);
        u_xlat5.xyz = (-vs_TEXCOORD2.xyz) * _AdditionalLightsPosition[u_xlati10].www + _AdditionalLightsPosition[u_xlati10].xyz;
        u_xlat17 = dot(u_xlat5.xyz, u_xlat5.xyz);
        u_xlat17 = max(u_xlat17, 6.10351562e-05);
        u_xlat24 = inversesqrt(u_xlat17);
        u_xlat5.xyz = vec3(u_xlat24) * u_xlat5.xyz;
        u_xlat24 = float(1.0) / float(u_xlat17);
        u_xlat17 = u_xlat17 * _AdditionalLightsAttenuation[u_xlati10].x + _AdditionalLightsAttenuation[u_xlati10].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat17 = min(max(u_xlat17, 0.0), 1.0);
#else
        u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
#endif
        u_xlat17 = u_xlat17 * u_xlat24;
        u_xlat16_23 = dot(_AdditionalLightsSpotDir[u_xlati10].xyz, u_xlat5.xyz);
        u_xlat16_23 = u_xlat16_23 * _AdditionalLightsAttenuation[u_xlati10].z + _AdditionalLightsAttenuation[u_xlati10].w;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
        u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
        u_xlat16_23 = u_xlat16_23 * u_xlat16_23;
        u_xlat17 = u_xlat16_23 * u_xlat17;
        u_xlat16_6.xyz = vec3(u_xlat17) * _AdditionalLightsColor[u_xlati10].xyz;
        u_xlat16_23 = dot(vs_TEXCOORD3.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
        u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
        u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
        u_xlat16_4.xyz = u_xlat16_6.xyz * vec3(u_xlat16_23) + u_xlat16_4.xyz;
    }
    SV_Target0.xyz = u_xlat16_4.xyz * u_xlat16_0.xyz + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_Surface==1.0);
#else
    u_xlatb1 = _Surface==1.0;
#endif
    SV_Target0.w = (u_xlatb1) ? u_xlat16_0.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles " {
Keywords { "_MAIN_LIGHT_SHADOWS" }
Local Keywords { "_EMISSION" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _BaseMap_ST;
uniform 	vec4 hlslcc_mtx4x4_MainLightWorldToShadow[20];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlatb22 = unity_OrthoParams.w==0.0;
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat5.xyz = u_xlat4.yyy * hlslcc_mtx4x4_MainLightWorldToShadow[1].xyz;
    u_xlat5.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[0].xyz * u_xlat4.xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[2].xyz * u_xlat4.zzz + u_xlat5.xyz;
    vs_TEXCOORD7.xyz = u_xlat5.xyz + hlslcc_mtx4x4_MainLightWorldToShadow[3].xyz;
    vs_TEXCOORD7.w = 0.0;
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 unity_LightData;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump float _Surface;
uniform 	mediump vec4 _MainLightShadowParams;
uniform lowp sampler2D _BaseMap;
uniform lowp sampler2D _EmissionMap;
uniform highp sampler2D _MainLightShadowmapTexture;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
bool u_xlatb3;
mediump float u_xlat16_4;
mediump float u_xlat16_7;
mediump float u_xlat16_10;
void main()
{
    u_xlat0.x = texture2D(_MainLightShadowmapTexture, vs_TEXCOORD7.xy).x;
    u_xlatb0 = u_xlat0.x<vs_TEXCOORD7.z;
    u_xlat16_1.x = (u_xlatb0) ? 0.0 : _MainLightShadowParams.x;
    u_xlat16_4 = (-_MainLightShadowParams.x) + 1.0;
    u_xlat16_1.x = u_xlat16_1.x + u_xlat16_4;
    u_xlatb0 = 0.0>=vs_TEXCOORD7.z;
    u_xlatb3 = vs_TEXCOORD7.z>=1.0;
    u_xlatb0 = u_xlatb3 || u_xlatb0;
    u_xlat16_1.x = (u_xlatb0) ? 1.0 : u_xlat16_1.x;
    u_xlat16_4 = (-u_xlat16_1.x) + 1.0;
    u_xlat0.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = u_xlat0.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_7 = u_xlat0.x * u_xlat0.x;
    u_xlat16_1.x = u_xlat16_7 * u_xlat16_4 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * unity_LightData.z;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _MainLightColor.xyz;
    u_xlat16_10 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
    u_xlat16_10 = clamp(u_xlat16_10, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(u_xlat16_10) + vs_TEXCOORD1.xyz;
    u_xlat10_0.xyz = texture2D(_EmissionMap, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _EmissionColor.xyz;
    u_xlat10_2 = texture2D(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_2 = u_xlat10_2 * _BaseColor;
    SV_Target0.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + u_xlat0.xyz;
    u_xlatb0 = _Surface==1.0;
    SV_Target0.w = (u_xlatb0) ? u_xlat16_2.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_ADDITIONAL_LIGHTS" "_MAIN_LIGHT_SHADOWS" }
Local Keywords { "_GLOSSINESS_FROM_BASE_ALPHA" "_SPECULAR_COLOR" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4_MainLightWorldToShadow[20];
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
out highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb22 = unity_OrthoParams.w==0.0;
#endif
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat5.xyz = u_xlat4.yyy * hlslcc_mtx4x4_MainLightWorldToShadow[1].xyz;
    u_xlat5.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[0].xyz * u_xlat4.xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[2].xyz * u_xlat4.zzz + u_xlat5.xyz;
    vs_TEXCOORD7.xyz = u_xlat5.xyz + hlslcc_mtx4x4_MainLightWorldToShadow[3].xyz;
    vs_TEXCOORD7.w = 0.0;
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
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
vec4 ImmCB_0[4];
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	mediump vec4 _AdditionalLightsCount;
uniform 	vec4 _AdditionalLightsPosition[16];
uniform 	mediump vec4 _AdditionalLightsColor[16];
uniform 	mediump vec4 _AdditionalLightsAttenuation[16];
uniform 	mediump vec4 _AdditionalLightsSpotDir[16];
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _MainLightShadowParams;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainLightShadowmapTexture;
UNITY_LOCATION(2) uniform mediump sampler2DShadow hlslcc_zcmp_MainLightShadowmapTexture;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump float u_xlat16_1;
vec3 u_xlat2;
mediump float u_xlat16_2;
uint u_xlatu2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump float u_xlat16_11;
uint u_xlatu12;
bool u_xlatb12;
mediump float u_xlat16_21;
float u_xlat22;
int u_xlati22;
bool u_xlatb22;
mediump float u_xlat16_31;
float u_xlat32;
uint u_xlatu32;
float u_xlat37;
void main()
{
ImmCB_0[0] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.0,1.0,0.0,0.0);
ImmCB_0[2] = vec4(0.0,0.0,1.0,0.0);
ImmCB_0[3] = vec4(0.0,0.0,0.0,1.0);
    u_xlat16_0 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * _BaseColor;
    u_xlat16_1 = u_xlat16_0.w * 10.0 + 1.0;
    u_xlat16_1 = exp2(u_xlat16_1);
    u_xlat2.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat2.x = max(u_xlat2.x, 1.17549435e-38);
    u_xlat16_11 = inversesqrt(u_xlat2.x);
    vec3 txVec0 = vec3(vs_TEXCOORD7.xy,vs_TEXCOORD7.z);
    u_xlat16_2 = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec0, 0.0);
    u_xlat16_21 = (-_MainLightShadowParams.x) + 1.0;
    u_xlat16_21 = u_xlat16_2 * _MainLightShadowParams.x + u_xlat16_21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=vs_TEXCOORD7.z);
#else
    u_xlatb2 = 0.0>=vs_TEXCOORD7.z;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(vs_TEXCOORD7.z>=1.0);
#else
    u_xlatb12 = vs_TEXCOORD7.z>=1.0;
#endif
    u_xlatb2 = u_xlatb12 || u_xlatb2;
    u_xlat16_21 = (u_xlatb2) ? 1.0 : u_xlat16_21;
    u_xlat2.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.x = u_xlat2.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_31 = u_xlat2.x * u_xlat2.x;
    u_xlat16_3.x = (-u_xlat16_21) + 1.0;
    u_xlat16_21 = u_xlat16_31 * u_xlat16_3.x + u_xlat16_21;
    u_xlat16_21 = u_xlat16_21 * unity_LightData.z;
    u_xlat16_3.xyz = vec3(u_xlat16_21) * _MainLightColor.xyz;
    u_xlat16_21 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_21 = min(max(u_xlat16_21, 0.0), 1.0);
#else
    u_xlat16_21 = clamp(u_xlat16_21, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(u_xlat16_21) + vs_TEXCOORD1.xyz;
    u_xlat2.xyz = vs_TEXCOORD4.xyz * vec3(u_xlat16_11) + _MainLightPosition.xyz;
    u_xlat32 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat32 = max(u_xlat32, 1.17549435e-38);
    u_xlat16_21 = inversesqrt(u_xlat32);
    u_xlat2.xyz = vec3(u_xlat16_21) * u_xlat2.xyz;
    u_xlat2.x = dot(vs_TEXCOORD3.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_21 = log2(u_xlat2.x);
    u_xlat16_21 = u_xlat16_21 * u_xlat16_1;
    u_xlat16_21 = exp2(u_xlat16_21);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * _SpecColor.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz;
    u_xlat16_21 = min(_AdditionalLightsCount.x, unity_LightData.y);
    u_xlatu2 =  uint(int(u_xlat16_21));
    u_xlat16_5.xyz = u_xlat16_4.xyz;
    u_xlat16_6.xyz = u_xlat16_3.xyz;
    for(uint u_xlatu_loop_1 = uint(0u) ; u_xlatu_loop_1<u_xlatu2 ; u_xlatu_loop_1++)
    {
        u_xlati22 = int(uint(u_xlatu_loop_1 & 3u));
        u_xlatu32 = uint(u_xlatu_loop_1 >> 2u);
        u_xlat16_21 = dot(unity_LightIndices[int(u_xlatu32)], ImmCB_0[u_xlati22]);
        u_xlati22 = int(u_xlat16_21);
        u_xlat7.xyz = (-vs_TEXCOORD2.xyz) * _AdditionalLightsPosition[u_xlati22].www + _AdditionalLightsPosition[u_xlati22].xyz;
        u_xlat32 = dot(u_xlat7.xyz, u_xlat7.xyz);
        u_xlat32 = max(u_xlat32, 6.10351562e-05);
        u_xlat37 = inversesqrt(u_xlat32);
        u_xlat7.xyz = vec3(u_xlat37) * u_xlat7.xyz;
        u_xlat37 = float(1.0) / float(u_xlat32);
        u_xlat32 = u_xlat32 * _AdditionalLightsAttenuation[u_xlati22].x + _AdditionalLightsAttenuation[u_xlati22].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat32 = min(max(u_xlat32, 0.0), 1.0);
#else
        u_xlat32 = clamp(u_xlat32, 0.0, 1.0);
#endif
        u_xlat32 = u_xlat32 * u_xlat37;
        u_xlat16_21 = dot(_AdditionalLightsSpotDir[u_xlati22].xyz, u_xlat7.xyz);
        u_xlat16_21 = u_xlat16_21 * _AdditionalLightsAttenuation[u_xlati22].z + _AdditionalLightsAttenuation[u_xlati22].w;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_21 = min(max(u_xlat16_21, 0.0), 1.0);
#else
        u_xlat16_21 = clamp(u_xlat16_21, 0.0, 1.0);
#endif
        u_xlat16_21 = u_xlat16_21 * u_xlat16_21;
        u_xlat32 = u_xlat16_21 * u_xlat32;
        u_xlat16_8.xyz = vec3(u_xlat32) * _AdditionalLightsColor[u_xlati22].xyz;
        u_xlat16_21 = dot(vs_TEXCOORD3.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
        u_xlat16_21 = min(max(u_xlat16_21, 0.0), 1.0);
#else
        u_xlat16_21 = clamp(u_xlat16_21, 0.0, 1.0);
#endif
        u_xlat16_5.xyz = u_xlat16_8.xyz * vec3(u_xlat16_21) + u_xlat16_5.xyz;
        u_xlat7.xyz = vs_TEXCOORD4.xyz * vec3(u_xlat16_11) + u_xlat7.xyz;
        u_xlat22 = dot(u_xlat7.xyz, u_xlat7.xyz);
        u_xlat22 = max(u_xlat22, 1.17549435e-38);
        u_xlat16_21 = inversesqrt(u_xlat22);
        u_xlat7.xyz = vec3(u_xlat16_21) * u_xlat7.xyz;
        u_xlat22 = dot(vs_TEXCOORD3.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
        u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
        u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
        u_xlat16_21 = log2(u_xlat22);
        u_xlat16_21 = u_xlat16_21 * u_xlat16_1;
        u_xlat16_21 = exp2(u_xlat16_21);
        u_xlat16_9.xyz = vec3(u_xlat16_21) * _SpecColor.xyz;
        u_xlat16_6.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz + u_xlat16_6.xyz;
    }
    SV_Target0.xyz = u_xlat16_5.xyz * u_xlat16_0.xyz + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_Surface==1.0);
#else
    u_xlatb2 = _Surface==1.0;
#endif
    SV_Target0.w = (u_xlatb2) ? u_xlat16_0.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles " {
Keywords { "_MAIN_LIGHT_SHADOWS" }
Local Keywords { "_GLOSSINESS_FROM_BASE_ALPHA" "_SPECULAR_COLOR" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _BaseMap_ST;
uniform 	vec4 hlslcc_mtx4x4_MainLightWorldToShadow[20];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlatb22 = unity_OrthoParams.w==0.0;
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat5.xyz = u_xlat4.yyy * hlslcc_mtx4x4_MainLightWorldToShadow[1].xyz;
    u_xlat5.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[0].xyz * u_xlat4.xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[2].xyz * u_xlat4.zzz + u_xlat5.xyz;
    vs_TEXCOORD7.xyz = u_xlat5.xyz + hlslcc_mtx4x4_MainLightWorldToShadow[3].xyz;
    vs_TEXCOORD7.w = 0.0;
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 unity_LightData;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _SpecColor;
uniform 	mediump float _Surface;
uniform 	mediump vec4 _MainLightShadowParams;
uniform lowp sampler2D _BaseMap;
uniform highp sampler2D _MainLightShadowmapTexture;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
bool u_xlatb4;
bool u_xlatb5;
mediump float u_xlat16_6;
mediump float u_xlat16_11;
float u_xlat15;
mediump float u_xlat16_16;
mediump float u_xlat16_17;
void main()
{
    u_xlat0.x = texture2D(_MainLightShadowmapTexture, vs_TEXCOORD7.xy).x;
    u_xlatb0 = u_xlat0.x<vs_TEXCOORD7.z;
    u_xlat16_1.x = (u_xlatb0) ? 0.0 : _MainLightShadowParams.x;
    u_xlat16_6 = (-_MainLightShadowParams.x) + 1.0;
    u_xlat16_1.x = u_xlat16_1.x + u_xlat16_6;
    u_xlatb0 = 0.0>=vs_TEXCOORD7.z;
    u_xlatb5 = vs_TEXCOORD7.z>=1.0;
    u_xlatb0 = u_xlatb5 || u_xlatb0;
    u_xlat16_1.x = (u_xlatb0) ? 1.0 : u_xlat16_1.x;
    u_xlat16_6 = (-u_xlat16_1.x) + 1.0;
    u_xlat0.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = u_xlat0.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_11 = u_xlat0.x * u_xlat0.x;
    u_xlat16_1.x = u_xlat16_11 * u_xlat16_6 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * unity_LightData.z;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _MainLightColor.xyz;
    u_xlat16_16 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
    u_xlat16_16 = clamp(u_xlat16_16, 0.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(u_xlat16_16) + vs_TEXCOORD1.xyz;
    u_xlat0.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat16_16 = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = vs_TEXCOORD4.xyz * vec3(u_xlat16_16) + _MainLightPosition.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat16_16 = inversesqrt(u_xlat15);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_16);
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_16 = log2(u_xlat0.x);
    u_xlat10_0 = texture2D(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _BaseColor;
    u_xlat16_17 = u_xlat16_0.w * 10.0 + 1.0;
    u_xlat16_17 = exp2(u_xlat16_17);
    u_xlat16_16 = u_xlat16_16 * u_xlat16_17;
    u_xlat16_16 = exp2(u_xlat16_16);
    u_xlat16_3.xyz = vec3(u_xlat16_16) * _SpecColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    SV_Target0.xyz = u_xlat16_2.xyz * u_xlat16_0.xyz + u_xlat16_1.xyz;
    u_xlatb4 = _Surface==1.0;
    SV_Target0.w = (u_xlatb4) ? u_xlat16_0.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_ADDITIONAL_LIGHTS" "_MAIN_LIGHT_SHADOWS" }
Local Keywords { "_GLOSSINESS_FROM_BASE_ALPHA" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4_MainLightWorldToShadow[20];
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
out highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb22 = unity_OrthoParams.w==0.0;
#endif
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat5.xyz = u_xlat4.yyy * hlslcc_mtx4x4_MainLightWorldToShadow[1].xyz;
    u_xlat5.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[0].xyz * u_xlat4.xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[2].xyz * u_xlat4.zzz + u_xlat5.xyz;
    vs_TEXCOORD7.xyz = u_xlat5.xyz + hlslcc_mtx4x4_MainLightWorldToShadow[3].xyz;
    vs_TEXCOORD7.w = 0.0;
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
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
vec4 ImmCB_0[4];
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	mediump vec4 _AdditionalLightsCount;
uniform 	vec4 _AdditionalLightsPosition[16];
uniform 	mediump vec4 _AdditionalLightsColor[16];
uniform 	mediump vec4 _AdditionalLightsAttenuation[16];
uniform 	mediump vec4 _AdditionalLightsSpotDir[16];
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _MainLightShadowParams;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainLightShadowmapTexture;
UNITY_LOCATION(2) uniform mediump sampler2DShadow hlslcc_zcmp_MainLightShadowmapTexture;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump float u_xlat16_1;
uint u_xlatu1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
uint u_xlatu7;
bool u_xlatb7;
mediump float u_xlat16_8;
int u_xlati13;
bool u_xlatb13;
mediump float u_xlat16_14;
float u_xlat19;
uint u_xlatu19;
mediump float u_xlat16_20;
float u_xlat22;
void main()
{
ImmCB_0[0] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.0,1.0,0.0,0.0);
ImmCB_0[2] = vec4(0.0,0.0,1.0,0.0);
ImmCB_0[3] = vec4(0.0,0.0,0.0,1.0);
    u_xlat16_0 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * _BaseColor;
    vec3 txVec0 = vec3(vs_TEXCOORD7.xy,vs_TEXCOORD7.z);
    u_xlat16_1 = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec0, 0.0);
    u_xlat16_2.x = (-_MainLightShadowParams.x) + 1.0;
    u_xlat16_2.x = u_xlat16_1 * _MainLightShadowParams.x + u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=vs_TEXCOORD7.z);
#else
    u_xlatb1 = 0.0>=vs_TEXCOORD7.z;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(vs_TEXCOORD7.z>=1.0);
#else
    u_xlatb7 = vs_TEXCOORD7.z>=1.0;
#endif
    u_xlatb1 = u_xlatb7 || u_xlatb1;
    u_xlat16_2.x = (u_xlatb1) ? 1.0 : u_xlat16_2.x;
    u_xlat1.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = u_xlat1.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_8 = u_xlat1.x * u_xlat1.x;
    u_xlat16_14 = (-u_xlat16_2.x) + 1.0;
    u_xlat16_2.x = u_xlat16_8 * u_xlat16_14 + u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * unity_LightData.z;
    u_xlat16_2.xyz = u_xlat16_2.xxx * _MainLightColor.xyz;
    u_xlat16_20 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_20 = min(max(u_xlat16_20, 0.0), 1.0);
#else
    u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_20) + vs_TEXCOORD1.xyz;
    u_xlat16_20 = min(_AdditionalLightsCount.x, unity_LightData.y);
    u_xlatu1 =  uint(int(u_xlat16_20));
    u_xlat16_3.xyz = u_xlat16_2.xyz;
    for(uint u_xlatu_loop_1 = uint(0u) ; u_xlatu_loop_1<u_xlatu1 ; u_xlatu_loop_1++)
    {
        u_xlati13 = int(uint(u_xlatu_loop_1 & 3u));
        u_xlatu19 = uint(u_xlatu_loop_1 >> 2u);
        u_xlat16_20 = dot(unity_LightIndices[int(u_xlatu19)], ImmCB_0[u_xlati13]);
        u_xlati13 = int(u_xlat16_20);
        u_xlat4.xyz = (-vs_TEXCOORD2.xyz) * _AdditionalLightsPosition[u_xlati13].www + _AdditionalLightsPosition[u_xlati13].xyz;
        u_xlat19 = dot(u_xlat4.xyz, u_xlat4.xyz);
        u_xlat19 = max(u_xlat19, 6.10351562e-05);
        u_xlat22 = inversesqrt(u_xlat19);
        u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz;
        u_xlat22 = float(1.0) / float(u_xlat19);
        u_xlat19 = u_xlat19 * _AdditionalLightsAttenuation[u_xlati13].x + _AdditionalLightsAttenuation[u_xlati13].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat19 = min(max(u_xlat19, 0.0), 1.0);
#else
        u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
#endif
        u_xlat19 = u_xlat19 * u_xlat22;
        u_xlat16_20 = dot(_AdditionalLightsSpotDir[u_xlati13].xyz, u_xlat4.xyz);
        u_xlat16_20 = u_xlat16_20 * _AdditionalLightsAttenuation[u_xlati13].z + _AdditionalLightsAttenuation[u_xlati13].w;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_20 = min(max(u_xlat16_20, 0.0), 1.0);
#else
        u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
#endif
        u_xlat16_20 = u_xlat16_20 * u_xlat16_20;
        u_xlat19 = u_xlat19 * u_xlat16_20;
        u_xlat16_5.xyz = vec3(u_xlat19) * _AdditionalLightsColor[u_xlati13].xyz;
        u_xlat16_20 = dot(vs_TEXCOORD3.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
        u_xlat16_20 = min(max(u_xlat16_20, 0.0), 1.0);
#else
        u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
#endif
        u_xlat16_3.xyz = u_xlat16_5.xyz * vec3(u_xlat16_20) + u_xlat16_3.xyz;
    }
    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_Surface==1.0);
#else
    u_xlatb1 = _Surface==1.0;
#endif
    SV_Target0.w = (u_xlatb1) ? u_xlat16_0.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles " {
Keywords { "_MAIN_LIGHT_SHADOWS" }
Local Keywords { "_GLOSSINESS_FROM_BASE_ALPHA" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _BaseMap_ST;
uniform 	vec4 hlslcc_mtx4x4_MainLightWorldToShadow[20];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlatb22 = unity_OrthoParams.w==0.0;
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat5.xyz = u_xlat4.yyy * hlslcc_mtx4x4_MainLightWorldToShadow[1].xyz;
    u_xlat5.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[0].xyz * u_xlat4.xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[2].xyz * u_xlat4.zzz + u_xlat5.xyz;
    vs_TEXCOORD7.xyz = u_xlat5.xyz + hlslcc_mtx4x4_MainLightWorldToShadow[3].xyz;
    vs_TEXCOORD7.w = 0.0;
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 unity_LightData;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump float _Surface;
uniform 	mediump vec4 _MainLightShadowParams;
uniform lowp sampler2D _BaseMap;
uniform highp sampler2D _MainLightShadowmapTexture;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
bool u_xlatb2;
bool u_xlatb3;
mediump float u_xlat16_4;
mediump float u_xlat16_7;
mediump float u_xlat16_10;
void main()
{
    u_xlat0.x = texture2D(_MainLightShadowmapTexture, vs_TEXCOORD7.xy).x;
    u_xlatb0 = u_xlat0.x<vs_TEXCOORD7.z;
    u_xlat16_1.x = (u_xlatb0) ? 0.0 : _MainLightShadowParams.x;
    u_xlat16_4 = (-_MainLightShadowParams.x) + 1.0;
    u_xlat16_1.x = u_xlat16_1.x + u_xlat16_4;
    u_xlatb0 = 0.0>=vs_TEXCOORD7.z;
    u_xlatb3 = vs_TEXCOORD7.z>=1.0;
    u_xlatb0 = u_xlatb3 || u_xlatb0;
    u_xlat16_1.x = (u_xlatb0) ? 1.0 : u_xlat16_1.x;
    u_xlat16_4 = (-u_xlat16_1.x) + 1.0;
    u_xlat0.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = u_xlat0.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_7 = u_xlat0.x * u_xlat0.x;
    u_xlat16_1.x = u_xlat16_7 * u_xlat16_4 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * unity_LightData.z;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _MainLightColor.xyz;
    u_xlat16_10 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
    u_xlat16_10 = clamp(u_xlat16_10, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(u_xlat16_10) + vs_TEXCOORD1.xyz;
    u_xlat10_0 = texture2D(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _BaseColor;
    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlatb2 = _Surface==1.0;
    SV_Target0.w = (u_xlatb2) ? u_xlat16_0.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_ADDITIONAL_LIGHTS" "_MAIN_LIGHT_SHADOWS" }
Local Keywords { "_ALPHAPREMULTIPLY_ON" "_RECEIVE_SHADOWS_OFF" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb22 = unity_OrthoParams.w==0.0;
#endif
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
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
vec4 ImmCB_0[4];
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	mediump vec4 _AdditionalLightsCount;
uniform 	vec4 _AdditionalLightsPosition[16];
uniform 	mediump vec4 _AdditionalLightsColor[16];
uniform 	mediump vec4 _AdditionalLightsAttenuation[16];
uniform 	mediump vec4 _AdditionalLightsSpotDir[16];
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
uint u_xlatu3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
uint u_xlatu10;
int u_xlati17;
bool u_xlatb17;
mediump float u_xlat16_22;
float u_xlat24;
uint u_xlatu24;
float u_xlat26;
void main()
{
ImmCB_0[0] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.0,1.0,0.0,0.0);
ImmCB_0[2] = vec4(0.0,0.0,1.0,0.0);
ImmCB_0[3] = vec4(0.0,0.0,0.0,1.0);
    u_xlat16_0 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * _BaseColor;
    u_xlat16_1.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat16_2.xyz = _MainLightColor.xyz * unity_LightData.zzz;
    u_xlat16_22 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_22 = min(max(u_xlat16_22, 0.0), 1.0);
#else
    u_xlat16_22 = clamp(u_xlat16_22, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_22) + vs_TEXCOORD1.xyz;
    u_xlat16_22 = min(_AdditionalLightsCount.x, unity_LightData.y);
    u_xlatu3 =  uint(int(u_xlat16_22));
    u_xlat16_4.xyz = u_xlat16_2.xyz;
    for(uint u_xlatu_loop_1 = uint(0u) ; u_xlatu_loop_1<u_xlatu3 ; u_xlatu_loop_1++)
    {
        u_xlati17 = int(uint(u_xlatu_loop_1 & 3u));
        u_xlatu24 = uint(u_xlatu_loop_1 >> 2u);
        u_xlat16_22 = dot(unity_LightIndices[int(u_xlatu24)], ImmCB_0[u_xlati17]);
        u_xlati17 = int(u_xlat16_22);
        u_xlat5.xyz = (-vs_TEXCOORD2.xyz) * _AdditionalLightsPosition[u_xlati17].www + _AdditionalLightsPosition[u_xlati17].xyz;
        u_xlat24 = dot(u_xlat5.xyz, u_xlat5.xyz);
        u_xlat24 = max(u_xlat24, 6.10351562e-05);
        u_xlat26 = inversesqrt(u_xlat24);
        u_xlat5.xyz = vec3(u_xlat26) * u_xlat5.xyz;
        u_xlat26 = float(1.0) / float(u_xlat24);
        u_xlat24 = u_xlat24 * _AdditionalLightsAttenuation[u_xlati17].x + _AdditionalLightsAttenuation[u_xlati17].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
        u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
        u_xlat24 = u_xlat24 * u_xlat26;
        u_xlat16_22 = dot(_AdditionalLightsSpotDir[u_xlati17].xyz, u_xlat5.xyz);
        u_xlat16_22 = u_xlat16_22 * _AdditionalLightsAttenuation[u_xlati17].z + _AdditionalLightsAttenuation[u_xlati17].w;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_22 = min(max(u_xlat16_22, 0.0), 1.0);
#else
        u_xlat16_22 = clamp(u_xlat16_22, 0.0, 1.0);
#endif
        u_xlat16_22 = u_xlat16_22 * u_xlat16_22;
        u_xlat24 = u_xlat16_22 * u_xlat24;
        u_xlat16_6.xyz = vec3(u_xlat24) * _AdditionalLightsColor[u_xlati17].xyz;
        u_xlat16_22 = dot(vs_TEXCOORD3.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
        u_xlat16_22 = min(max(u_xlat16_22, 0.0), 1.0);
#else
        u_xlat16_22 = clamp(u_xlat16_22, 0.0, 1.0);
#endif
        u_xlat16_4.xyz = u_xlat16_6.xyz * vec3(u_xlat16_22) + u_xlat16_4.xyz;
    }
    SV_Target0.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_Surface==1.0);
#else
    u_xlatb3 = _Surface==1.0;
#endif
    SV_Target0.w = (u_xlatb3) ? u_xlat16_0.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles " {
Keywords { "_MAIN_LIGHT_SHADOWS" }
Local Keywords { "_ALPHAPREMULTIPLY_ON" "_RECEIVE_SHADOWS_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _BaseMap_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlatb22 = unity_OrthoParams.w==0.0;
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	mediump vec4 unity_LightData;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump float _Surface;
uniform lowp sampler2D _BaseMap;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
bool u_xlatb3;
mediump float u_xlat16_12;
void main()
{
    u_xlat16_0.xyz = _MainLightColor.xyz * unity_LightData.zzz;
    u_xlat16_12 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
    u_xlat16_12 = clamp(u_xlat16_12, 0.0, 1.0);
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(u_xlat16_12) + vs_TEXCOORD1.xyz;
    u_xlat10_1 = texture2D(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat10_1 * _BaseColor;
    u_xlat16_2.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
    u_xlatb3 = _Surface==1.0;
    SV_Target0.w = (u_xlatb3) ? u_xlat16_1.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_ADDITIONAL_LIGHTS" "_MAIN_LIGHT_SHADOWS" }
Local Keywords { "_ALPHAPREMULTIPLY_ON" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4_MainLightWorldToShadow[20];
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
out highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb22 = unity_OrthoParams.w==0.0;
#endif
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat5.xyz = u_xlat4.yyy * hlslcc_mtx4x4_MainLightWorldToShadow[1].xyz;
    u_xlat5.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[0].xyz * u_xlat4.xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[2].xyz * u_xlat4.zzz + u_xlat5.xyz;
    vs_TEXCOORD7.xyz = u_xlat5.xyz + hlslcc_mtx4x4_MainLightWorldToShadow[3].xyz;
    vs_TEXCOORD7.w = 0.0;
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
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
vec4 ImmCB_0[4];
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	mediump vec4 _AdditionalLightsCount;
uniform 	vec4 _AdditionalLightsPosition[16];
uniform 	mediump vec4 _AdditionalLightsColor[16];
uniform 	mediump vec4 _AdditionalLightsAttenuation[16];
uniform 	mediump vec4 _AdditionalLightsSpotDir[16];
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _MainLightShadowParams;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainLightShadowmapTexture;
UNITY_LOCATION(2) uniform mediump sampler2DShadow hlslcc_zcmp_MainLightShadowmapTexture;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump float u_xlat16_2;
uint u_xlatu2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
uint u_xlatu9;
bool u_xlatb9;
mediump float u_xlat16_10;
int u_xlati16;
bool u_xlatb16;
mediump float u_xlat16_22;
float u_xlat23;
uint u_xlatu23;
float u_xlat26;
void main()
{
ImmCB_0[0] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.0,1.0,0.0,0.0);
ImmCB_0[2] = vec4(0.0,0.0,1.0,0.0);
ImmCB_0[3] = vec4(0.0,0.0,0.0,1.0);
    u_xlat16_0 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * _BaseColor;
    u_xlat16_1.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    vec3 txVec0 = vec3(vs_TEXCOORD7.xy,vs_TEXCOORD7.z);
    u_xlat16_2 = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec0, 0.0);
    u_xlat16_22 = (-_MainLightShadowParams.x) + 1.0;
    u_xlat16_22 = u_xlat16_2 * _MainLightShadowParams.x + u_xlat16_22;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=vs_TEXCOORD7.z);
#else
    u_xlatb2 = 0.0>=vs_TEXCOORD7.z;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(vs_TEXCOORD7.z>=1.0);
#else
    u_xlatb9 = vs_TEXCOORD7.z>=1.0;
#endif
    u_xlatb2 = u_xlatb9 || u_xlatb2;
    u_xlat16_22 = (u_xlatb2) ? 1.0 : u_xlat16_22;
    u_xlat2.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.x = u_xlat2.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat2.x * u_xlat2.x;
    u_xlat16_10 = (-u_xlat16_22) + 1.0;
    u_xlat16_22 = u_xlat16_3.x * u_xlat16_10 + u_xlat16_22;
    u_xlat16_22 = u_xlat16_22 * unity_LightData.z;
    u_xlat16_3.xyz = vec3(u_xlat16_22) * _MainLightColor.xyz;
    u_xlat16_22 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_22 = min(max(u_xlat16_22, 0.0), 1.0);
#else
    u_xlat16_22 = clamp(u_xlat16_22, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(u_xlat16_22) + vs_TEXCOORD1.xyz;
    u_xlat16_22 = min(_AdditionalLightsCount.x, unity_LightData.y);
    u_xlatu2 =  uint(int(u_xlat16_22));
    u_xlat16_4.xyz = u_xlat16_3.xyz;
    for(uint u_xlatu_loop_1 = uint(0u) ; u_xlatu_loop_1<u_xlatu2 ; u_xlatu_loop_1++)
    {
        u_xlati16 = int(uint(u_xlatu_loop_1 & 3u));
        u_xlatu23 = uint(u_xlatu_loop_1 >> 2u);
        u_xlat16_22 = dot(unity_LightIndices[int(u_xlatu23)], ImmCB_0[u_xlati16]);
        u_xlati16 = int(u_xlat16_22);
        u_xlat5.xyz = (-vs_TEXCOORD2.xyz) * _AdditionalLightsPosition[u_xlati16].www + _AdditionalLightsPosition[u_xlati16].xyz;
        u_xlat23 = dot(u_xlat5.xyz, u_xlat5.xyz);
        u_xlat23 = max(u_xlat23, 6.10351562e-05);
        u_xlat26 = inversesqrt(u_xlat23);
        u_xlat5.xyz = vec3(u_xlat26) * u_xlat5.xyz;
        u_xlat26 = float(1.0) / float(u_xlat23);
        u_xlat23 = u_xlat23 * _AdditionalLightsAttenuation[u_xlati16].x + _AdditionalLightsAttenuation[u_xlati16].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat23 = min(max(u_xlat23, 0.0), 1.0);
#else
        u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
#endif
        u_xlat23 = u_xlat23 * u_xlat26;
        u_xlat16_22 = dot(_AdditionalLightsSpotDir[u_xlati16].xyz, u_xlat5.xyz);
        u_xlat16_22 = u_xlat16_22 * _AdditionalLightsAttenuation[u_xlati16].z + _AdditionalLightsAttenuation[u_xlati16].w;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_22 = min(max(u_xlat16_22, 0.0), 1.0);
#else
        u_xlat16_22 = clamp(u_xlat16_22, 0.0, 1.0);
#endif
        u_xlat16_22 = u_xlat16_22 * u_xlat16_22;
        u_xlat23 = u_xlat16_22 * u_xlat23;
        u_xlat16_6.xyz = vec3(u_xlat23) * _AdditionalLightsColor[u_xlati16].xyz;
        u_xlat16_22 = dot(vs_TEXCOORD3.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
        u_xlat16_22 = min(max(u_xlat16_22, 0.0), 1.0);
#else
        u_xlat16_22 = clamp(u_xlat16_22, 0.0, 1.0);
#endif
        u_xlat16_4.xyz = u_xlat16_6.xyz * vec3(u_xlat16_22) + u_xlat16_4.xyz;
    }
    SV_Target0.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_Surface==1.0);
#else
    u_xlatb2 = _Surface==1.0;
#endif
    SV_Target0.w = (u_xlatb2) ? u_xlat16_0.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles " {
Keywords { "_MAIN_LIGHT_SHADOWS" }
Local Keywords { "_ALPHAPREMULTIPLY_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _BaseMap_ST;
uniform 	vec4 hlslcc_mtx4x4_MainLightWorldToShadow[20];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlatb22 = unity_OrthoParams.w==0.0;
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat5.xyz = u_xlat4.yyy * hlslcc_mtx4x4_MainLightWorldToShadow[1].xyz;
    u_xlat5.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[0].xyz * u_xlat4.xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[2].xyz * u_xlat4.zzz + u_xlat5.xyz;
    vs_TEXCOORD7.xyz = u_xlat5.xyz + hlslcc_mtx4x4_MainLightWorldToShadow[3].xyz;
    vs_TEXCOORD7.w = 0.0;
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 unity_LightData;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump float _Surface;
uniform 	mediump vec4 _MainLightShadowParams;
uniform lowp sampler2D _BaseMap;
uniform highp sampler2D _MainLightShadowmapTexture;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb3;
bool u_xlatb4;
mediump float u_xlat16_5;
mediump float u_xlat16_9;
mediump float u_xlat16_13;
void main()
{
    u_xlat0.x = texture2D(_MainLightShadowmapTexture, vs_TEXCOORD7.xy).x;
    u_xlatb0 = u_xlat0.x<vs_TEXCOORD7.z;
    u_xlat16_1.x = (u_xlatb0) ? 0.0 : _MainLightShadowParams.x;
    u_xlat16_5 = (-_MainLightShadowParams.x) + 1.0;
    u_xlat16_1.x = u_xlat16_1.x + u_xlat16_5;
    u_xlatb0 = 0.0>=vs_TEXCOORD7.z;
    u_xlatb4 = vs_TEXCOORD7.z>=1.0;
    u_xlatb0 = u_xlatb4 || u_xlatb0;
    u_xlat16_1.x = (u_xlatb0) ? 1.0 : u_xlat16_1.x;
    u_xlat16_5 = (-u_xlat16_1.x) + 1.0;
    u_xlat0.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = u_xlat0.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_9 = u_xlat0.x * u_xlat0.x;
    u_xlat16_1.x = u_xlat16_9 * u_xlat16_5 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * unity_LightData.z;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _MainLightColor.xyz;
    u_xlat16_13 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
    u_xlat16_13 = clamp(u_xlat16_13, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(u_xlat16_13) + vs_TEXCOORD1.xyz;
    u_xlat10_0 = texture2D(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _BaseColor;
    u_xlat16_2.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlatb3 = _Surface==1.0;
    SV_Target0.w = (u_xlatb3) ? u_xlat16_0.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_ADDITIONAL_LIGHTS" "_MAIN_LIGHT_SHADOWS" }
Local Keywords { "_RECEIVE_SHADOWS_OFF" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb22 = unity_OrthoParams.w==0.0;
#endif
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
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
vec4 ImmCB_0[4];
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	mediump vec4 _AdditionalLightsCount;
uniform 	vec4 _AdditionalLightsPosition[16];
uniform 	mediump vec4 _AdditionalLightsColor[16];
uniform 	mediump vec4 _AdditionalLightsAttenuation[16];
uniform 	mediump vec4 _AdditionalLightsSpotDir[16];
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
uint u_xlatu2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
uint u_xlatu8;
int u_xlati14;
bool u_xlatb14;
mediump float u_xlat16_19;
float u_xlat20;
uint u_xlatu20;
float u_xlat22;
void main()
{
ImmCB_0[0] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.0,1.0,0.0,0.0);
ImmCB_0[2] = vec4(0.0,0.0,1.0,0.0);
ImmCB_0[3] = vec4(0.0,0.0,0.0,1.0);
    u_xlat16_0 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * _BaseColor;
    u_xlat16_1.xyz = _MainLightColor.xyz * unity_LightData.zzz;
    u_xlat16_19 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19 = min(max(u_xlat16_19, 0.0), 1.0);
#else
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(u_xlat16_19) + vs_TEXCOORD1.xyz;
    u_xlat16_19 = min(_AdditionalLightsCount.x, unity_LightData.y);
    u_xlatu2 =  uint(int(u_xlat16_19));
    u_xlat16_3.xyz = u_xlat16_1.xyz;
    for(uint u_xlatu_loop_1 = uint(0u) ; u_xlatu_loop_1<u_xlatu2 ; u_xlatu_loop_1++)
    {
        u_xlati14 = int(uint(u_xlatu_loop_1 & 3u));
        u_xlatu20 = uint(u_xlatu_loop_1 >> 2u);
        u_xlat16_19 = dot(unity_LightIndices[int(u_xlatu20)], ImmCB_0[u_xlati14]);
        u_xlati14 = int(u_xlat16_19);
        u_xlat4.xyz = (-vs_TEXCOORD2.xyz) * _AdditionalLightsPosition[u_xlati14].www + _AdditionalLightsPosition[u_xlati14].xyz;
        u_xlat20 = dot(u_xlat4.xyz, u_xlat4.xyz);
        u_xlat20 = max(u_xlat20, 6.10351562e-05);
        u_xlat22 = inversesqrt(u_xlat20);
        u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz;
        u_xlat22 = float(1.0) / float(u_xlat20);
        u_xlat20 = u_xlat20 * _AdditionalLightsAttenuation[u_xlati14].x + _AdditionalLightsAttenuation[u_xlati14].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
        u_xlat20 = u_xlat20 * u_xlat22;
        u_xlat16_19 = dot(_AdditionalLightsSpotDir[u_xlati14].xyz, u_xlat4.xyz);
        u_xlat16_19 = u_xlat16_19 * _AdditionalLightsAttenuation[u_xlati14].z + _AdditionalLightsAttenuation[u_xlati14].w;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_19 = min(max(u_xlat16_19, 0.0), 1.0);
#else
        u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
#endif
        u_xlat16_19 = u_xlat16_19 * u_xlat16_19;
        u_xlat20 = u_xlat16_19 * u_xlat20;
        u_xlat16_5.xyz = vec3(u_xlat20) * _AdditionalLightsColor[u_xlati14].xyz;
        u_xlat16_19 = dot(vs_TEXCOORD3.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
        u_xlat16_19 = min(max(u_xlat16_19, 0.0), 1.0);
#else
        u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
#endif
        u_xlat16_3.xyz = u_xlat16_5.xyz * vec3(u_xlat16_19) + u_xlat16_3.xyz;
    }
    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_Surface==1.0);
#else
    u_xlatb2 = _Surface==1.0;
#endif
    SV_Target0.w = (u_xlatb2) ? u_xlat16_0.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles " {
Keywords { "_MAIN_LIGHT_SHADOWS" }
Local Keywords { "_RECEIVE_SHADOWS_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _BaseMap_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlatb22 = unity_OrthoParams.w==0.0;
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	mediump vec4 unity_LightData;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump float _Surface;
uniform lowp sampler2D _BaseMap;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
bool u_xlatb2;
mediump float u_xlat16_9;
void main()
{
    u_xlat16_0.xyz = _MainLightColor.xyz * unity_LightData.zzz;
    u_xlat16_9 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
    u_xlat16_9 = clamp(u_xlat16_9, 0.0, 1.0);
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(u_xlat16_9) + vs_TEXCOORD1.xyz;
    u_xlat10_1 = texture2D(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat10_1 * _BaseColor;
    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlatb2 = _Surface==1.0;
    SV_Target0.w = (u_xlatb2) ? u_xlat16_1.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_ADDITIONAL_LIGHTS" "_MAIN_LIGHT_SHADOWS" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4_MainLightWorldToShadow[20];
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
out highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb22 = unity_OrthoParams.w==0.0;
#endif
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat5.xyz = u_xlat4.yyy * hlslcc_mtx4x4_MainLightWorldToShadow[1].xyz;
    u_xlat5.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[0].xyz * u_xlat4.xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[2].xyz * u_xlat4.zzz + u_xlat5.xyz;
    vs_TEXCOORD7.xyz = u_xlat5.xyz + hlslcc_mtx4x4_MainLightWorldToShadow[3].xyz;
    vs_TEXCOORD7.w = 0.0;
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
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
vec4 ImmCB_0[4];
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	mediump vec4 _AdditionalLightsCount;
uniform 	vec4 _AdditionalLightsPosition[16];
uniform 	mediump vec4 _AdditionalLightsColor[16];
uniform 	mediump vec4 _AdditionalLightsAttenuation[16];
uniform 	mediump vec4 _AdditionalLightsSpotDir[16];
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _MainLightShadowParams;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainLightShadowmapTexture;
UNITY_LOCATION(2) uniform mediump sampler2DShadow hlslcc_zcmp_MainLightShadowmapTexture;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump float u_xlat16_1;
uint u_xlatu1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
uint u_xlatu7;
bool u_xlatb7;
mediump float u_xlat16_8;
int u_xlati13;
bool u_xlatb13;
mediump float u_xlat16_14;
float u_xlat19;
uint u_xlatu19;
mediump float u_xlat16_20;
float u_xlat22;
void main()
{
ImmCB_0[0] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.0,1.0,0.0,0.0);
ImmCB_0[2] = vec4(0.0,0.0,1.0,0.0);
ImmCB_0[3] = vec4(0.0,0.0,0.0,1.0);
    u_xlat16_0 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * _BaseColor;
    vec3 txVec0 = vec3(vs_TEXCOORD7.xy,vs_TEXCOORD7.z);
    u_xlat16_1 = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec0, 0.0);
    u_xlat16_2.x = (-_MainLightShadowParams.x) + 1.0;
    u_xlat16_2.x = u_xlat16_1 * _MainLightShadowParams.x + u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=vs_TEXCOORD7.z);
#else
    u_xlatb1 = 0.0>=vs_TEXCOORD7.z;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(vs_TEXCOORD7.z>=1.0);
#else
    u_xlatb7 = vs_TEXCOORD7.z>=1.0;
#endif
    u_xlatb1 = u_xlatb7 || u_xlatb1;
    u_xlat16_2.x = (u_xlatb1) ? 1.0 : u_xlat16_2.x;
    u_xlat1.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = u_xlat1.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_8 = u_xlat1.x * u_xlat1.x;
    u_xlat16_14 = (-u_xlat16_2.x) + 1.0;
    u_xlat16_2.x = u_xlat16_8 * u_xlat16_14 + u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * unity_LightData.z;
    u_xlat16_2.xyz = u_xlat16_2.xxx * _MainLightColor.xyz;
    u_xlat16_20 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_20 = min(max(u_xlat16_20, 0.0), 1.0);
#else
    u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_20) + vs_TEXCOORD1.xyz;
    u_xlat16_20 = min(_AdditionalLightsCount.x, unity_LightData.y);
    u_xlatu1 =  uint(int(u_xlat16_20));
    u_xlat16_3.xyz = u_xlat16_2.xyz;
    for(uint u_xlatu_loop_1 = uint(0u) ; u_xlatu_loop_1<u_xlatu1 ; u_xlatu_loop_1++)
    {
        u_xlati13 = int(uint(u_xlatu_loop_1 & 3u));
        u_xlatu19 = uint(u_xlatu_loop_1 >> 2u);
        u_xlat16_20 = dot(unity_LightIndices[int(u_xlatu19)], ImmCB_0[u_xlati13]);
        u_xlati13 = int(u_xlat16_20);
        u_xlat4.xyz = (-vs_TEXCOORD2.xyz) * _AdditionalLightsPosition[u_xlati13].www + _AdditionalLightsPosition[u_xlati13].xyz;
        u_xlat19 = dot(u_xlat4.xyz, u_xlat4.xyz);
        u_xlat19 = max(u_xlat19, 6.10351562e-05);
        u_xlat22 = inversesqrt(u_xlat19);
        u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz;
        u_xlat22 = float(1.0) / float(u_xlat19);
        u_xlat19 = u_xlat19 * _AdditionalLightsAttenuation[u_xlati13].x + _AdditionalLightsAttenuation[u_xlati13].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat19 = min(max(u_xlat19, 0.0), 1.0);
#else
        u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
#endif
        u_xlat19 = u_xlat19 * u_xlat22;
        u_xlat16_20 = dot(_AdditionalLightsSpotDir[u_xlati13].xyz, u_xlat4.xyz);
        u_xlat16_20 = u_xlat16_20 * _AdditionalLightsAttenuation[u_xlati13].z + _AdditionalLightsAttenuation[u_xlati13].w;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_20 = min(max(u_xlat16_20, 0.0), 1.0);
#else
        u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
#endif
        u_xlat16_20 = u_xlat16_20 * u_xlat16_20;
        u_xlat19 = u_xlat19 * u_xlat16_20;
        u_xlat16_5.xyz = vec3(u_xlat19) * _AdditionalLightsColor[u_xlati13].xyz;
        u_xlat16_20 = dot(vs_TEXCOORD3.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
        u_xlat16_20 = min(max(u_xlat16_20, 0.0), 1.0);
#else
        u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
#endif
        u_xlat16_3.xyz = u_xlat16_5.xyz * vec3(u_xlat16_20) + u_xlat16_3.xyz;
    }
    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_Surface==1.0);
#else
    u_xlatb1 = _Surface==1.0;
#endif
    SV_Target0.w = (u_xlatb1) ? u_xlat16_0.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles " {
Keywords { "_MAIN_LIGHT_SHADOWS" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _BaseMap_ST;
uniform 	vec4 hlslcc_mtx4x4_MainLightWorldToShadow[20];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlatb22 = unity_OrthoParams.w==0.0;
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat5.xyz = u_xlat4.yyy * hlslcc_mtx4x4_MainLightWorldToShadow[1].xyz;
    u_xlat5.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[0].xyz * u_xlat4.xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[2].xyz * u_xlat4.zzz + u_xlat5.xyz;
    vs_TEXCOORD7.xyz = u_xlat5.xyz + hlslcc_mtx4x4_MainLightWorldToShadow[3].xyz;
    vs_TEXCOORD7.w = 0.0;
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 unity_LightData;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump float _Surface;
uniform 	mediump vec4 _MainLightShadowParams;
uniform lowp sampler2D _BaseMap;
uniform highp sampler2D _MainLightShadowmapTexture;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
bool u_xlatb2;
bool u_xlatb3;
mediump float u_xlat16_4;
mediump float u_xlat16_7;
mediump float u_xlat16_10;
void main()
{
    u_xlat0.x = texture2D(_MainLightShadowmapTexture, vs_TEXCOORD7.xy).x;
    u_xlatb0 = u_xlat0.x<vs_TEXCOORD7.z;
    u_xlat16_1.x = (u_xlatb0) ? 0.0 : _MainLightShadowParams.x;
    u_xlat16_4 = (-_MainLightShadowParams.x) + 1.0;
    u_xlat16_1.x = u_xlat16_1.x + u_xlat16_4;
    u_xlatb0 = 0.0>=vs_TEXCOORD7.z;
    u_xlatb3 = vs_TEXCOORD7.z>=1.0;
    u_xlatb0 = u_xlatb3 || u_xlatb0;
    u_xlat16_1.x = (u_xlatb0) ? 1.0 : u_xlat16_1.x;
    u_xlat16_4 = (-u_xlat16_1.x) + 1.0;
    u_xlat0.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = u_xlat0.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_7 = u_xlat0.x * u_xlat0.x;
    u_xlat16_1.x = u_xlat16_7 * u_xlat16_4 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * unity_LightData.z;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _MainLightColor.xyz;
    u_xlat16_10 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
    u_xlat16_10 = clamp(u_xlat16_10, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(u_xlat16_10) + vs_TEXCOORD1.xyz;
    u_xlat10_0 = texture2D(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _BaseColor;
    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlatb2 = _Surface==1.0;
    SV_Target0.w = (u_xlatb2) ? u_xlat16_0.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_MAIN_LIGHT_SHADOWS" }
Local Keywords { "_EMISSION" "_GLOSSINESS_FROM_BASE_ALPHA" "_SPECULAR_COLOR" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4_MainLightWorldToShadow[20];
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
out highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb22 = unity_OrthoParams.w==0.0;
#endif
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat5.xyz = u_xlat4.yyy * hlslcc_mtx4x4_MainLightWorldToShadow[1].xyz;
    u_xlat5.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[0].xyz * u_xlat4.xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[2].xyz * u_xlat4.zzz + u_xlat5.xyz;
    vs_TEXCOORD7.xyz = u_xlat5.xyz + hlslcc_mtx4x4_MainLightWorldToShadow[3].xyz;
    vs_TEXCOORD7.w = 0.0;
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _MainLightShadowParams;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
UNITY_LOCATION(1) uniform mediump sampler2D _EmissionMap;
UNITY_LOCATION(2) uniform mediump sampler2D _MainLightShadowmapTexture;
UNITY_LOCATION(3) uniform mediump sampler2DShadow hlslcc_zcmp_MainLightShadowmapTexture;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
bool u_xlatb4;
bool u_xlatb5;
mediump float u_xlat16_6;
mediump float u_xlat16_11;
float u_xlat15;
mediump float u_xlat16_16;
void main()
{
    u_xlat0.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = u_xlat0.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x;
    vec3 txVec0 = vec3(vs_TEXCOORD7.xy,vs_TEXCOORD7.z);
    u_xlat16_0.x = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec0, 0.0);
    u_xlat16_6 = (-_MainLightShadowParams.x) + 1.0;
    u_xlat16_6 = u_xlat16_0.x * _MainLightShadowParams.x + u_xlat16_6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=vs_TEXCOORD7.z);
#else
    u_xlatb0 = 0.0>=vs_TEXCOORD7.z;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(vs_TEXCOORD7.z>=1.0);
#else
    u_xlatb5 = vs_TEXCOORD7.z>=1.0;
#endif
    u_xlatb0 = u_xlatb5 || u_xlatb0;
    u_xlat16_6 = (u_xlatb0) ? 1.0 : u_xlat16_6;
    u_xlat16_11 = (-u_xlat16_6) + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_11 + u_xlat16_6;
    u_xlat16_1.x = u_xlat16_1.x * unity_LightData.z;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _MainLightColor.xyz;
    u_xlat0.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat16_16 = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = vs_TEXCOORD4.xyz * vec3(u_xlat16_16) + _MainLightPosition.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat16_16 = inversesqrt(u_xlat15);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_16);
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_16 = log2(u_xlat0.x);
    u_xlat16_0 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * _BaseColor;
    u_xlat16_2.x = u_xlat16_0.w * 10.0 + 1.0;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_16 = u_xlat16_16 * u_xlat16_2.x;
    u_xlat16_16 = exp2(u_xlat16_16);
    u_xlat16_2.xyz = vec3(u_xlat16_16) * _SpecColor.xyz;
    u_xlat16_16 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_16 = min(max(u_xlat16_16, 0.0), 1.0);
#else
    u_xlat16_16 = clamp(u_xlat16_16, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(u_xlat16_16) + vs_TEXCOORD1.xyz;
    u_xlat16_4.xyz = texture(_EmissionMap, vs_TEXCOORD0.xy).xyz;
    u_xlat4.xyz = u_xlat16_4.xyz * _EmissionColor.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_0.xyz + u_xlat4.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(_Surface==1.0);
#else
    u_xlatb4 = _Surface==1.0;
#endif
    SV_Target0.w = (u_xlatb4) ? u_xlat16_0.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles " {
Keywords { "_ADDITIONAL_LIGHTS" }
Local Keywords { "_EMISSION" "_GLOSSINESS_FROM_BASE_ALPHA" "_SPECULAR_COLOR" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _BaseMap_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlatb22 = unity_OrthoParams.w==0.0;
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	mediump vec4 _AdditionalLightsCount;
uniform 	vec4 _AdditionalLightsPosition[16];
uniform 	mediump vec4 _AdditionalLightsColor[16];
uniform 	mediump vec4 _AdditionalLightsAttenuation[16];
uniform 	mediump vec4 _AdditionalLightsSpotDir[16];
uniform 	mediump vec4 unity_LightData;
uniform 	mediump vec4 unity_LightIndices[2];
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _SpecColor;
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump float _Surface;
uniform lowp sampler2D _BaseMap;
uniform lowp sampler2D _EmissionMap;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
int u_xlati5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump float u_xlat16_13;
vec3 u_xlat16;
int u_xlati16;
bool u_xlatb16;
mediump vec2 u_xlat16_24;
float u_xlat27;
bool u_xlatb27;
float u_xlat34;
int u_xlati34;
float u_xlat38;
#define UNITY_DYNAMIC_INDEX_ES2 0






vec4 _AdditionalLightsPositionDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _AdditionalLightsPosition[i];
#else
#define d_ar _AdditionalLightsPosition
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}


mediump vec4 _AdditionalLightsAttenuationDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _AdditionalLightsAttenuation[i];
#else
#define d_ar _AdditionalLightsAttenuation
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}


mediump vec4 _AdditionalLightsSpotDirDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _AdditionalLightsSpotDir[i];
#else
#define d_ar _AdditionalLightsSpotDir
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}


mediump vec4 _AdditionalLightsColorDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _AdditionalLightsColor[i];
#else
#define d_ar _AdditionalLightsColor
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}

void main()
{
    u_xlat10_0 = texture2D(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _BaseColor;
    u_xlat10_1.xyz = texture2D(_EmissionMap, vs_TEXCOORD0.xy).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * _EmissionColor.xyz;
    u_xlat16_2.x = u_xlat16_0.w * 10.0 + 1.0;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat34 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat34 = max(u_xlat34, 1.17549435e-38);
    u_xlat16_13 = inversesqrt(u_xlat34);
    u_xlat16_3.xyz = _MainLightColor.xyz * unity_LightData.zzz;
    u_xlat16_24.x = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
    u_xlat16_24.x = clamp(u_xlat16_24.x, 0.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_3.xyz * u_xlat16_24.xxx + vs_TEXCOORD1.xyz;
    u_xlat5.xyz = vs_TEXCOORD4.xyz * vec3(u_xlat16_13) + _MainLightPosition.xyz;
    u_xlat34 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat34 = max(u_xlat34, 1.17549435e-38);
    u_xlat16_24.x = inversesqrt(u_xlat34);
    u_xlat5.xyz = u_xlat16_24.xxx * u_xlat5.xyz;
    u_xlat34 = dot(vs_TEXCOORD3.xyz, u_xlat5.xyz);
    u_xlat34 = clamp(u_xlat34, 0.0, 1.0);
    u_xlat16_24.x = log2(u_xlat34);
    u_xlat16_24.x = u_xlat16_24.x * u_xlat16_2.x;
    u_xlat16_24.x = exp2(u_xlat16_24.x);
    u_xlat16_6.xyz = u_xlat16_24.xxx * _SpecColor.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_6.xyz;
    u_xlat16_24.x = min(_AdditionalLightsCount.x, unity_LightData.y);
    u_xlati34 = int(u_xlat16_24.x);
    u_xlat16_6.xyz = u_xlat16_4.xyz;
    u_xlat16_7.xyz = u_xlat16_3.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<u_xlati34 ; u_xlati_loop_1++)
    {
        u_xlat16.x = float(u_xlati_loop_1);
        u_xlatb27 = u_xlat16.x<2.0;
        u_xlat16_24.xy = (bool(u_xlatb27)) ? unity_LightIndices[0].xy : unity_LightIndices[0].zw;
        u_xlat38 = u_xlat16.x + -2.0;
        u_xlat16.x = (u_xlatb27) ? u_xlat16.x : u_xlat38;
        u_xlatb16 = u_xlat16.x<1.0;
        u_xlat16_24.x = (u_xlatb16) ? u_xlat16_24.x : u_xlat16_24.y;
        u_xlati16 = int(u_xlat16_24.x);
        u_xlat8.xyz = (-vs_TEXCOORD2.xyz) * _AdditionalLightsPositionDynamicIndex(u_xlati16).www + _AdditionalLightsPositionDynamicIndex(u_xlati16).xyz;
        u_xlat27 = dot(u_xlat8.xyz, u_xlat8.xyz);
        u_xlat27 = max(u_xlat27, 6.10351562e-05);
        u_xlat38 = inversesqrt(u_xlat27);
        u_xlat8.xyz = vec3(u_xlat38) * u_xlat8.xyz;
        u_xlat38 = float(1.0) / u_xlat27;
        u_xlat27 = u_xlat27 * _AdditionalLightsAttenuationDynamicIndex(u_xlati16).x + _AdditionalLightsAttenuationDynamicIndex(u_xlati16).y;
        u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
        u_xlat27 = u_xlat27 * u_xlat38;
        u_xlat16_24.x = dot(_AdditionalLightsSpotDirDynamicIndex(u_xlati16).xyz, u_xlat8.xyz);
        u_xlat16_24.x = u_xlat16_24.x * _AdditionalLightsAttenuationDynamicIndex(u_xlati16).z + _AdditionalLightsAttenuationDynamicIndex(u_xlati16).w;
        u_xlat16_24.x = clamp(u_xlat16_24.x, 0.0, 1.0);
        u_xlat16_24.x = u_xlat16_24.x * u_xlat16_24.x;
        u_xlat27 = u_xlat16_24.x * u_xlat27;
        u_xlat16_9.xyz = vec3(u_xlat27) * _AdditionalLightsColorDynamicIndex(u_xlati16).xyz;
        u_xlat16_24.x = dot(vs_TEXCOORD3.xyz, u_xlat8.xyz);
        u_xlat16_24.x = clamp(u_xlat16_24.x, 0.0, 1.0);
        u_xlat16_6.xyz = u_xlat16_9.xyz * u_xlat16_24.xxx + u_xlat16_6.xyz;
        u_xlat16.xyz = vs_TEXCOORD4.xyz * vec3(u_xlat16_13) + u_xlat8.xyz;
        u_xlat8.x = dot(u_xlat16.xyz, u_xlat16.xyz);
        u_xlat8.x = max(u_xlat8.x, 1.17549435e-38);
        u_xlat16_24.x = inversesqrt(u_xlat8.x);
        u_xlat16.xyz = u_xlat16_24.xxx * u_xlat16.xyz;
        u_xlat16.x = dot(vs_TEXCOORD3.xyz, u_xlat16.xyz);
        u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
        u_xlat16_24.x = log2(u_xlat16.x);
        u_xlat16_24.x = u_xlat16_24.x * u_xlat16_2.x;
        u_xlat16_24.x = exp2(u_xlat16_24.x);
        u_xlat16_10.xyz = u_xlat16_24.xxx * _SpecColor.xyz;
        u_xlat16_7.xyz = u_xlat16_9.xyz * u_xlat16_10.xyz + u_xlat16_7.xyz;
    }
    u_xlat16_2.xyz = u_xlat16_6.xyz * u_xlat16_0.xyz + u_xlat1.xyz;
    SV_Target0.xyz = u_xlat16_7.xyz + u_xlat16_2.xyz;
    u_xlatb1 = _Surface==1.0;
    SV_Target0.w = (u_xlatb1) ? u_xlat16_0.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_MAIN_LIGHT_SHADOWS" }
Local Keywords { "_EMISSION" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4_MainLightWorldToShadow[20];
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
out highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb22 = unity_OrthoParams.w==0.0;
#endif
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat5.xyz = u_xlat4.yyy * hlslcc_mtx4x4_MainLightWorldToShadow[1].xyz;
    u_xlat5.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[0].xyz * u_xlat4.xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[2].xyz * u_xlat4.zzz + u_xlat5.xyz;
    vs_TEXCOORD7.xyz = u_xlat5.xyz + hlslcc_mtx4x4_MainLightWorldToShadow[3].xyz;
    vs_TEXCOORD7.w = 0.0;
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _MainLightShadowParams;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
UNITY_LOCATION(1) uniform mediump sampler2D _EmissionMap;
UNITY_LOCATION(2) uniform mediump sampler2D _MainLightShadowmapTexture;
UNITY_LOCATION(3) uniform mediump sampler2DShadow hlslcc_zcmp_MainLightShadowmapTexture;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
bool u_xlatb3;
mediump float u_xlat16_4;
mediump float u_xlat16_7;
mediump float u_xlat16_10;
void main()
{
    u_xlat0.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = u_xlat0.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x;
    vec3 txVec0 = vec3(vs_TEXCOORD7.xy,vs_TEXCOORD7.z);
    u_xlat16_0.x = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec0, 0.0);
    u_xlat16_4 = (-_MainLightShadowParams.x) + 1.0;
    u_xlat16_4 = u_xlat16_0.x * _MainLightShadowParams.x + u_xlat16_4;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=vs_TEXCOORD7.z);
#else
    u_xlatb0 = 0.0>=vs_TEXCOORD7.z;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(vs_TEXCOORD7.z>=1.0);
#else
    u_xlatb3 = vs_TEXCOORD7.z>=1.0;
#endif
    u_xlatb0 = u_xlatb3 || u_xlatb0;
    u_xlat16_4 = (u_xlatb0) ? 1.0 : u_xlat16_4;
    u_xlat16_7 = (-u_xlat16_4) + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_7 + u_xlat16_4;
    u_xlat16_1.x = u_xlat16_1.x * unity_LightData.z;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _MainLightColor.xyz;
    u_xlat16_10 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10 = min(max(u_xlat16_10, 0.0), 1.0);
#else
    u_xlat16_10 = clamp(u_xlat16_10, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(u_xlat16_10) + vs_TEXCOORD1.xyz;
    u_xlat16_0.xyz = texture(_EmissionMap, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _EmissionColor.xyz;
    u_xlat16_2 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_2 = u_xlat16_2 * _BaseColor;
    SV_Target0.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_Surface==1.0);
#else
    u_xlatb0 = _Surface==1.0;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_2.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles " {
Keywords { "_ADDITIONAL_LIGHTS" }
Local Keywords { "_EMISSION" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _BaseMap_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlatb22 = unity_OrthoParams.w==0.0;
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	mediump vec4 _AdditionalLightsCount;
uniform 	vec4 _AdditionalLightsPosition[16];
uniform 	mediump vec4 _AdditionalLightsColor[16];
uniform 	mediump vec4 _AdditionalLightsAttenuation[16];
uniform 	mediump vec4 _AdditionalLightsSpotDir[16];
uniform 	mediump vec4 unity_LightData;
uniform 	mediump vec4 unity_LightIndices[2];
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump float _Surface;
uniform lowp sampler2D _BaseMap;
uniform lowp sampler2D _EmissionMap;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
int u_xlati4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
float u_xlat11;
int u_xlati11;
bool u_xlatb11;
float u_xlat18;
bool u_xlatb18;
int u_xlati22;
mediump float u_xlat16_23;
float u_xlat25;
#define UNITY_DYNAMIC_INDEX_ES2 0






vec4 _AdditionalLightsPositionDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _AdditionalLightsPosition[i];
#else
#define d_ar _AdditionalLightsPosition
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}


mediump vec4 _AdditionalLightsAttenuationDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _AdditionalLightsAttenuation[i];
#else
#define d_ar _AdditionalLightsAttenuation
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}


mediump vec4 _AdditionalLightsSpotDirDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _AdditionalLightsSpotDir[i];
#else
#define d_ar _AdditionalLightsSpotDir
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}


mediump vec4 _AdditionalLightsColorDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _AdditionalLightsColor[i];
#else
#define d_ar _AdditionalLightsColor
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}

void main()
{
    u_xlat10_0 = texture2D(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _BaseColor;
    u_xlat10_1.xyz = texture2D(_EmissionMap, vs_TEXCOORD0.xy).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * _EmissionColor.xyz;
    u_xlat16_2.xyz = _MainLightColor.xyz * unity_LightData.zzz;
    u_xlat16_23 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_23) + vs_TEXCOORD1.xyz;
    u_xlat16_23 = min(_AdditionalLightsCount.x, unity_LightData.y);
    u_xlati22 = int(u_xlat16_23);
    u_xlat16_3.xyz = u_xlat16_2.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<u_xlati22 ; u_xlati_loop_1++)
    {
        u_xlat11 = float(u_xlati_loop_1);
        u_xlatb18 = u_xlat11<2.0;
        u_xlat16_5.xy = (bool(u_xlatb18)) ? unity_LightIndices[0].xy : unity_LightIndices[0].zw;
        u_xlat25 = u_xlat11 + -2.0;
        u_xlat11 = (u_xlatb18) ? u_xlat11 : u_xlat25;
        u_xlatb11 = u_xlat11<1.0;
        u_xlat16_23 = (u_xlatb11) ? u_xlat16_5.x : u_xlat16_5.y;
        u_xlati11 = int(u_xlat16_23);
        u_xlat6.xyz = (-vs_TEXCOORD2.xyz) * _AdditionalLightsPositionDynamicIndex(u_xlati11).www + _AdditionalLightsPositionDynamicIndex(u_xlati11).xyz;
        u_xlat18 = dot(u_xlat6.xyz, u_xlat6.xyz);
        u_xlat18 = max(u_xlat18, 6.10351562e-05);
        u_xlat25 = inversesqrt(u_xlat18);
        u_xlat6.xyz = vec3(u_xlat25) * u_xlat6.xyz;
        u_xlat25 = float(1.0) / u_xlat18;
        u_xlat18 = u_xlat18 * _AdditionalLightsAttenuationDynamicIndex(u_xlati11).x + _AdditionalLightsAttenuationDynamicIndex(u_xlati11).y;
        u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
        u_xlat18 = u_xlat18 * u_xlat25;
        u_xlat16_23 = dot(_AdditionalLightsSpotDirDynamicIndex(u_xlati11).xyz, u_xlat6.xyz);
        u_xlat16_23 = u_xlat16_23 * _AdditionalLightsAttenuationDynamicIndex(u_xlati11).z + _AdditionalLightsAttenuationDynamicIndex(u_xlati11).w;
        u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
        u_xlat16_23 = u_xlat16_23 * u_xlat16_23;
        u_xlat18 = u_xlat16_23 * u_xlat18;
        u_xlat16_5.xyz = vec3(u_xlat18) * _AdditionalLightsColorDynamicIndex(u_xlati11).xyz;
        u_xlat16_23 = dot(vs_TEXCOORD3.xyz, u_xlat6.xyz);
        u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
        u_xlat16_3.xyz = u_xlat16_5.xyz * vec3(u_xlat16_23) + u_xlat16_3.xyz;
    }
    SV_Target0.xyz = u_xlat16_3.xyz * u_xlat16_0.xyz + u_xlat1.xyz;
    u_xlatb1 = _Surface==1.0;
    SV_Target0.w = (u_xlatb1) ? u_xlat16_0.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_MAIN_LIGHT_SHADOWS" }
Local Keywords { "_GLOSSINESS_FROM_BASE_ALPHA" "_SPECULAR_COLOR" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4_MainLightWorldToShadow[20];
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
out highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb22 = unity_OrthoParams.w==0.0;
#endif
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat5.xyz = u_xlat4.yyy * hlslcc_mtx4x4_MainLightWorldToShadow[1].xyz;
    u_xlat5.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[0].xyz * u_xlat4.xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[2].xyz * u_xlat4.zzz + u_xlat5.xyz;
    vs_TEXCOORD7.xyz = u_xlat5.xyz + hlslcc_mtx4x4_MainLightWorldToShadow[3].xyz;
    vs_TEXCOORD7.w = 0.0;
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _MainLightShadowParams;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainLightShadowmapTexture;
UNITY_LOCATION(2) uniform mediump sampler2DShadow hlslcc_zcmp_MainLightShadowmapTexture;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
bool u_xlatb4;
bool u_xlatb5;
mediump float u_xlat16_6;
mediump float u_xlat16_11;
float u_xlat15;
mediump float u_xlat16_16;
mediump float u_xlat16_17;
void main()
{
    u_xlat0.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = u_xlat0.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x;
    vec3 txVec0 = vec3(vs_TEXCOORD7.xy,vs_TEXCOORD7.z);
    u_xlat16_0.x = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec0, 0.0);
    u_xlat16_6 = (-_MainLightShadowParams.x) + 1.0;
    u_xlat16_6 = u_xlat16_0.x * _MainLightShadowParams.x + u_xlat16_6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=vs_TEXCOORD7.z);
#else
    u_xlatb0 = 0.0>=vs_TEXCOORD7.z;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(vs_TEXCOORD7.z>=1.0);
#else
    u_xlatb5 = vs_TEXCOORD7.z>=1.0;
#endif
    u_xlatb0 = u_xlatb5 || u_xlatb0;
    u_xlat16_6 = (u_xlatb0) ? 1.0 : u_xlat16_6;
    u_xlat16_11 = (-u_xlat16_6) + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_11 + u_xlat16_6;
    u_xlat16_1.x = u_xlat16_1.x * unity_LightData.z;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _MainLightColor.xyz;
    u_xlat16_16 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_16 = min(max(u_xlat16_16, 0.0), 1.0);
#else
    u_xlat16_16 = clamp(u_xlat16_16, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(u_xlat16_16) + vs_TEXCOORD1.xyz;
    u_xlat0.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat16_16 = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = vs_TEXCOORD4.xyz * vec3(u_xlat16_16) + _MainLightPosition.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat16_16 = inversesqrt(u_xlat15);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_16);
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_16 = log2(u_xlat0.x);
    u_xlat16_0 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * _BaseColor;
    u_xlat16_17 = u_xlat16_0.w * 10.0 + 1.0;
    u_xlat16_17 = exp2(u_xlat16_17);
    u_xlat16_16 = u_xlat16_16 * u_xlat16_17;
    u_xlat16_16 = exp2(u_xlat16_16);
    u_xlat16_3.xyz = vec3(u_xlat16_16) * _SpecColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    SV_Target0.xyz = u_xlat16_2.xyz * u_xlat16_0.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(_Surface==1.0);
#else
    u_xlatb4 = _Surface==1.0;
#endif
    SV_Target0.w = (u_xlatb4) ? u_xlat16_0.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles " {
Keywords { "_ADDITIONAL_LIGHTS" }
Local Keywords { "_GLOSSINESS_FROM_BASE_ALPHA" "_SPECULAR_COLOR" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _BaseMap_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlatb22 = unity_OrthoParams.w==0.0;
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	mediump vec4 _AdditionalLightsCount;
uniform 	vec4 _AdditionalLightsPosition[16];
uniform 	mediump vec4 _AdditionalLightsColor[16];
uniform 	mediump vec4 _AdditionalLightsAttenuation[16];
uniform 	mediump vec4 _AdditionalLightsSpotDir[16];
uniform 	mediump vec4 unity_LightData;
uniform 	mediump vec4 unity_LightIndices[2];
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _SpecColor;
uniform 	mediump float _Surface;
uniform lowp sampler2D _BaseMap;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump float u_xlat16_1;
vec3 u_xlat2;
int u_xlati2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump float u_xlat16_11;
int u_xlati12;
mediump vec2 u_xlat16_21;
float u_xlat22;
int u_xlati22;
bool u_xlatb22;
float u_xlat32;
bool u_xlatb32;
float u_xlat37;
#define UNITY_DYNAMIC_INDEX_ES2 0






vec4 _AdditionalLightsPositionDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _AdditionalLightsPosition[i];
#else
#define d_ar _AdditionalLightsPosition
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}


mediump vec4 _AdditionalLightsAttenuationDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _AdditionalLightsAttenuation[i];
#else
#define d_ar _AdditionalLightsAttenuation
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}


mediump vec4 _AdditionalLightsSpotDirDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _AdditionalLightsSpotDir[i];
#else
#define d_ar _AdditionalLightsSpotDir
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}


mediump vec4 _AdditionalLightsColorDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _AdditionalLightsColor[i];
#else
#define d_ar _AdditionalLightsColor
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}

void main()
{
    u_xlat10_0 = texture2D(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _BaseColor;
    u_xlat16_1 = u_xlat16_0.w * 10.0 + 1.0;
    u_xlat16_1 = exp2(u_xlat16_1);
    u_xlat2.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat2.x = max(u_xlat2.x, 1.17549435e-38);
    u_xlat16_11 = inversesqrt(u_xlat2.x);
    u_xlat16_3.xyz = _MainLightColor.xyz * unity_LightData.zzz;
    u_xlat16_21.x = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
    u_xlat16_21.x = clamp(u_xlat16_21.x, 0.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_3.xyz * u_xlat16_21.xxx + vs_TEXCOORD1.xyz;
    u_xlat2.xyz = vs_TEXCOORD4.xyz * vec3(u_xlat16_11) + _MainLightPosition.xyz;
    u_xlat32 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat32 = max(u_xlat32, 1.17549435e-38);
    u_xlat16_21.x = inversesqrt(u_xlat32);
    u_xlat2.xyz = u_xlat16_21.xxx * u_xlat2.xyz;
    u_xlat2.x = dot(vs_TEXCOORD3.xyz, u_xlat2.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat16_21.x = log2(u_xlat2.x);
    u_xlat16_21.x = u_xlat16_21.x * u_xlat16_1;
    u_xlat16_21.x = exp2(u_xlat16_21.x);
    u_xlat16_5.xyz = u_xlat16_21.xxx * _SpecColor.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz;
    u_xlat16_21.x = min(_AdditionalLightsCount.x, unity_LightData.y);
    u_xlati2 = int(u_xlat16_21.x);
    u_xlat16_5.xyz = u_xlat16_4.xyz;
    u_xlat16_6.xyz = u_xlat16_3.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<u_xlati2 ; u_xlati_loop_1++)
    {
        u_xlat22 = float(u_xlati_loop_1);
        u_xlatb32 = u_xlat22<2.0;
        u_xlat16_21.xy = (bool(u_xlatb32)) ? unity_LightIndices[0].xy : unity_LightIndices[0].zw;
        u_xlat7.x = u_xlat22 + -2.0;
        u_xlat22 = (u_xlatb32) ? u_xlat22 : u_xlat7.x;
        u_xlatb22 = u_xlat22<1.0;
        u_xlat16_21.x = (u_xlatb22) ? u_xlat16_21.x : u_xlat16_21.y;
        u_xlati22 = int(u_xlat16_21.x);
        u_xlat7.xyz = (-vs_TEXCOORD2.xyz) * _AdditionalLightsPositionDynamicIndex(u_xlati22).www + _AdditionalLightsPositionDynamicIndex(u_xlati22).xyz;
        u_xlat32 = dot(u_xlat7.xyz, u_xlat7.xyz);
        u_xlat32 = max(u_xlat32, 6.10351562e-05);
        u_xlat37 = inversesqrt(u_xlat32);
        u_xlat7.xyz = vec3(u_xlat37) * u_xlat7.xyz;
        u_xlat37 = float(1.0) / u_xlat32;
        u_xlat32 = u_xlat32 * _AdditionalLightsAttenuationDynamicIndex(u_xlati22).x + _AdditionalLightsAttenuationDynamicIndex(u_xlati22).y;
        u_xlat32 = clamp(u_xlat32, 0.0, 1.0);
        u_xlat32 = u_xlat32 * u_xlat37;
        u_xlat16_21.x = dot(_AdditionalLightsSpotDirDynamicIndex(u_xlati22).xyz, u_xlat7.xyz);
        u_xlat16_21.x = u_xlat16_21.x * _AdditionalLightsAttenuationDynamicIndex(u_xlati22).z + _AdditionalLightsAttenuationDynamicIndex(u_xlati22).w;
        u_xlat16_21.x = clamp(u_xlat16_21.x, 0.0, 1.0);
        u_xlat16_21.x = u_xlat16_21.x * u_xlat16_21.x;
        u_xlat32 = u_xlat16_21.x * u_xlat32;
        u_xlat16_8.xyz = vec3(u_xlat32) * _AdditionalLightsColorDynamicIndex(u_xlati22).xyz;
        u_xlat16_21.x = dot(vs_TEXCOORD3.xyz, u_xlat7.xyz);
        u_xlat16_21.x = clamp(u_xlat16_21.x, 0.0, 1.0);
        u_xlat16_5.xyz = u_xlat16_8.xyz * u_xlat16_21.xxx + u_xlat16_5.xyz;
        u_xlat7.xyz = vs_TEXCOORD4.xyz * vec3(u_xlat16_11) + u_xlat7.xyz;
        u_xlat22 = dot(u_xlat7.xyz, u_xlat7.xyz);
        u_xlat22 = max(u_xlat22, 1.17549435e-38);
        u_xlat16_21.x = inversesqrt(u_xlat22);
        u_xlat7.xyz = u_xlat16_21.xxx * u_xlat7.xyz;
        u_xlat22 = dot(vs_TEXCOORD3.xyz, u_xlat7.xyz);
        u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
        u_xlat16_21.x = log2(u_xlat22);
        u_xlat16_21.x = u_xlat16_21.x * u_xlat16_1;
        u_xlat16_21.x = exp2(u_xlat16_21.x);
        u_xlat16_9.xyz = u_xlat16_21.xxx * _SpecColor.xyz;
        u_xlat16_6.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz + u_xlat16_6.xyz;
    }
    SV_Target0.xyz = u_xlat16_5.xyz * u_xlat16_0.xyz + u_xlat16_6.xyz;
    u_xlatb2 = _Surface==1.0;
    SV_Target0.w = (u_xlatb2) ? u_xlat16_0.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_MAIN_LIGHT_SHADOWS" }
Local Keywords { "_GLOSSINESS_FROM_BASE_ALPHA" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4_MainLightWorldToShadow[20];
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
out highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb22 = unity_OrthoParams.w==0.0;
#endif
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat5.xyz = u_xlat4.yyy * hlslcc_mtx4x4_MainLightWorldToShadow[1].xyz;
    u_xlat5.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[0].xyz * u_xlat4.xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[2].xyz * u_xlat4.zzz + u_xlat5.xyz;
    vs_TEXCOORD7.xyz = u_xlat5.xyz + hlslcc_mtx4x4_MainLightWorldToShadow[3].xyz;
    vs_TEXCOORD7.w = 0.0;
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _MainLightShadowParams;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainLightShadowmapTexture;
UNITY_LOCATION(2) uniform mediump sampler2DShadow hlslcc_zcmp_MainLightShadowmapTexture;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
bool u_xlatb2;
bool u_xlatb3;
mediump float u_xlat16_4;
mediump float u_xlat16_7;
mediump float u_xlat16_10;
void main()
{
    u_xlat0.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = u_xlat0.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x;
    vec3 txVec0 = vec3(vs_TEXCOORD7.xy,vs_TEXCOORD7.z);
    u_xlat16_0.x = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec0, 0.0);
    u_xlat16_4 = (-_MainLightShadowParams.x) + 1.0;
    u_xlat16_4 = u_xlat16_0.x * _MainLightShadowParams.x + u_xlat16_4;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=vs_TEXCOORD7.z);
#else
    u_xlatb0 = 0.0>=vs_TEXCOORD7.z;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(vs_TEXCOORD7.z>=1.0);
#else
    u_xlatb3 = vs_TEXCOORD7.z>=1.0;
#endif
    u_xlatb0 = u_xlatb3 || u_xlatb0;
    u_xlat16_4 = (u_xlatb0) ? 1.0 : u_xlat16_4;
    u_xlat16_7 = (-u_xlat16_4) + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_7 + u_xlat16_4;
    u_xlat16_1.x = u_xlat16_1.x * unity_LightData.z;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _MainLightColor.xyz;
    u_xlat16_10 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10 = min(max(u_xlat16_10, 0.0), 1.0);
#else
    u_xlat16_10 = clamp(u_xlat16_10, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(u_xlat16_10) + vs_TEXCOORD1.xyz;
    u_xlat16_0 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * _BaseColor;
    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_Surface==1.0);
#else
    u_xlatb2 = _Surface==1.0;
#endif
    SV_Target0.w = (u_xlatb2) ? u_xlat16_0.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles " {
Keywords { "_ADDITIONAL_LIGHTS" }
Local Keywords { "_GLOSSINESS_FROM_BASE_ALPHA" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _BaseMap_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlatb22 = unity_OrthoParams.w==0.0;
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	mediump vec4 _AdditionalLightsCount;
uniform 	vec4 _AdditionalLightsPosition[16];
uniform 	mediump vec4 _AdditionalLightsColor[16];
uniform 	mediump vec4 _AdditionalLightsAttenuation[16];
uniform 	mediump vec4 _AdditionalLightsSpotDir[16];
uniform 	mediump vec4 unity_LightData;
uniform 	mediump vec4 unity_LightIndices[2];
uniform 	mediump vec4 _BaseColor;
uniform 	mediump float _Surface;
uniform lowp sampler2D _BaseMap;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
int u_xlati2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
int u_xlati8;
float u_xlat14;
int u_xlati14;
bool u_xlatb14;
mediump float u_xlat16_19;
float u_xlat20;
bool u_xlatb20;
float u_xlat23;
#define UNITY_DYNAMIC_INDEX_ES2 0






vec4 _AdditionalLightsPositionDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _AdditionalLightsPosition[i];
#else
#define d_ar _AdditionalLightsPosition
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}


mediump vec4 _AdditionalLightsAttenuationDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _AdditionalLightsAttenuation[i];
#else
#define d_ar _AdditionalLightsAttenuation
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}


mediump vec4 _AdditionalLightsSpotDirDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _AdditionalLightsSpotDir[i];
#else
#define d_ar _AdditionalLightsSpotDir
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}


mediump vec4 _AdditionalLightsColorDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _AdditionalLightsColor[i];
#else
#define d_ar _AdditionalLightsColor
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}

void main()
{
    u_xlat10_0 = texture2D(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _BaseColor;
    u_xlat16_1.xyz = _MainLightColor.xyz * unity_LightData.zzz;
    u_xlat16_19 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(u_xlat16_19) + vs_TEXCOORD1.xyz;
    u_xlat16_19 = min(_AdditionalLightsCount.x, unity_LightData.y);
    u_xlati2 = int(u_xlat16_19);
    u_xlat16_3.xyz = u_xlat16_1.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<u_xlati2 ; u_xlati_loop_1++)
    {
        u_xlat14 = float(u_xlati_loop_1);
        u_xlatb20 = u_xlat14<2.0;
        u_xlat16_4.xy = (bool(u_xlatb20)) ? unity_LightIndices[0].xy : unity_LightIndices[0].zw;
        u_xlat5.x = u_xlat14 + -2.0;
        u_xlat14 = (u_xlatb20) ? u_xlat14 : u_xlat5.x;
        u_xlatb14 = u_xlat14<1.0;
        u_xlat16_19 = (u_xlatb14) ? u_xlat16_4.x : u_xlat16_4.y;
        u_xlati14 = int(u_xlat16_19);
        u_xlat5.xyz = (-vs_TEXCOORD2.xyz) * _AdditionalLightsPositionDynamicIndex(u_xlati14).www + _AdditionalLightsPositionDynamicIndex(u_xlati14).xyz;
        u_xlat20 = dot(u_xlat5.xyz, u_xlat5.xyz);
        u_xlat20 = max(u_xlat20, 6.10351562e-05);
        u_xlat23 = inversesqrt(u_xlat20);
        u_xlat5.xyz = vec3(u_xlat23) * u_xlat5.xyz;
        u_xlat23 = float(1.0) / u_xlat20;
        u_xlat20 = u_xlat20 * _AdditionalLightsAttenuationDynamicIndex(u_xlati14).x + _AdditionalLightsAttenuationDynamicIndex(u_xlati14).y;
        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
        u_xlat20 = u_xlat20 * u_xlat23;
        u_xlat16_19 = dot(_AdditionalLightsSpotDirDynamicIndex(u_xlati14).xyz, u_xlat5.xyz);
        u_xlat16_19 = u_xlat16_19 * _AdditionalLightsAttenuationDynamicIndex(u_xlati14).z + _AdditionalLightsAttenuationDynamicIndex(u_xlati14).w;
        u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
        u_xlat16_19 = u_xlat16_19 * u_xlat16_19;
        u_xlat20 = u_xlat16_19 * u_xlat20;
        u_xlat16_4.xyz = vec3(u_xlat20) * _AdditionalLightsColorDynamicIndex(u_xlati14).xyz;
        u_xlat16_19 = dot(vs_TEXCOORD3.xyz, u_xlat5.xyz);
        u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
        u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(u_xlat16_19) + u_xlat16_3.xyz;
    }
    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlatb2 = _Surface==1.0;
    SV_Target0.w = (u_xlatb2) ? u_xlat16_0.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_MAIN_LIGHT_SHADOWS" }
Local Keywords { "_ALPHAPREMULTIPLY_ON" "_RECEIVE_SHADOWS_OFF" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb22 = unity_OrthoParams.w==0.0;
#endif
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb3;
mediump float u_xlat16_12;
void main()
{
    u_xlat16_0.xyz = _MainLightColor.xyz * unity_LightData.zzz;
    u_xlat16_12 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12 = min(max(u_xlat16_12, 0.0), 1.0);
#else
    u_xlat16_12 = clamp(u_xlat16_12, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(u_xlat16_12) + vs_TEXCOORD1.xyz;
    u_xlat16_1 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat16_1 * _BaseColor;
    u_xlat16_2.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_Surface==1.0);
#else
    u_xlatb3 = _Surface==1.0;
#endif
    SV_Target0.w = (u_xlatb3) ? u_xlat16_1.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles " {
Keywords { "_ADDITIONAL_LIGHTS" }
Local Keywords { "_ALPHAPREMULTIPLY_ON" "_RECEIVE_SHADOWS_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _BaseMap_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlatb22 = unity_OrthoParams.w==0.0;
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	mediump vec4 _AdditionalLightsCount;
uniform 	vec4 _AdditionalLightsPosition[16];
uniform 	mediump vec4 _AdditionalLightsColor[16];
uniform 	mediump vec4 _AdditionalLightsAttenuation[16];
uniform 	mediump vec4 _AdditionalLightsSpotDir[16];
uniform 	mediump vec4 unity_LightData;
uniform 	mediump vec4 unity_LightIndices[2];
uniform 	mediump vec4 _BaseColor;
uniform 	mediump float _Surface;
uniform lowp sampler2D _BaseMap;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
int u_xlati3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
int u_xlati10;
float u_xlat17;
int u_xlati17;
bool u_xlatb17;
mediump float u_xlat16_22;
float u_xlat24;
bool u_xlatb24;
float u_xlat27;
#define UNITY_DYNAMIC_INDEX_ES2 0






vec4 _AdditionalLightsPositionDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _AdditionalLightsPosition[i];
#else
#define d_ar _AdditionalLightsPosition
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}


mediump vec4 _AdditionalLightsAttenuationDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _AdditionalLightsAttenuation[i];
#else
#define d_ar _AdditionalLightsAttenuation
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}


mediump vec4 _AdditionalLightsSpotDirDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _AdditionalLightsSpotDir[i];
#else
#define d_ar _AdditionalLightsSpotDir
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}


mediump vec4 _AdditionalLightsColorDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _AdditionalLightsColor[i];
#else
#define d_ar _AdditionalLightsColor
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}

void main()
{
    u_xlat10_0 = texture2D(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _BaseColor;
    u_xlat16_1.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat16_2.xyz = _MainLightColor.xyz * unity_LightData.zzz;
    u_xlat16_22 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
    u_xlat16_22 = clamp(u_xlat16_22, 0.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_22) + vs_TEXCOORD1.xyz;
    u_xlat16_22 = min(_AdditionalLightsCount.x, unity_LightData.y);
    u_xlati3 = int(u_xlat16_22);
    u_xlat16_4.xyz = u_xlat16_2.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<u_xlati3 ; u_xlati_loop_1++)
    {
        u_xlat17 = float(u_xlati_loop_1);
        u_xlatb24 = u_xlat17<2.0;
        u_xlat16_5.xy = (bool(u_xlatb24)) ? unity_LightIndices[0].xy : unity_LightIndices[0].zw;
        u_xlat6.x = u_xlat17 + -2.0;
        u_xlat17 = (u_xlatb24) ? u_xlat17 : u_xlat6.x;
        u_xlatb17 = u_xlat17<1.0;
        u_xlat16_22 = (u_xlatb17) ? u_xlat16_5.x : u_xlat16_5.y;
        u_xlati17 = int(u_xlat16_22);
        u_xlat6.xyz = (-vs_TEXCOORD2.xyz) * _AdditionalLightsPositionDynamicIndex(u_xlati17).www + _AdditionalLightsPositionDynamicIndex(u_xlati17).xyz;
        u_xlat24 = dot(u_xlat6.xyz, u_xlat6.xyz);
        u_xlat24 = max(u_xlat24, 6.10351562e-05);
        u_xlat27 = inversesqrt(u_xlat24);
        u_xlat6.xyz = vec3(u_xlat27) * u_xlat6.xyz;
        u_xlat27 = float(1.0) / u_xlat24;
        u_xlat24 = u_xlat24 * _AdditionalLightsAttenuationDynamicIndex(u_xlati17).x + _AdditionalLightsAttenuationDynamicIndex(u_xlati17).y;
        u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
        u_xlat24 = u_xlat24 * u_xlat27;
        u_xlat16_22 = dot(_AdditionalLightsSpotDirDynamicIndex(u_xlati17).xyz, u_xlat6.xyz);
        u_xlat16_22 = u_xlat16_22 * _AdditionalLightsAttenuationDynamicIndex(u_xlati17).z + _AdditionalLightsAttenuationDynamicIndex(u_xlati17).w;
        u_xlat16_22 = clamp(u_xlat16_22, 0.0, 1.0);
        u_xlat16_22 = u_xlat16_22 * u_xlat16_22;
        u_xlat24 = u_xlat16_22 * u_xlat24;
        u_xlat16_5.xyz = vec3(u_xlat24) * _AdditionalLightsColorDynamicIndex(u_xlati17).xyz;
        u_xlat16_22 = dot(vs_TEXCOORD3.xyz, u_xlat6.xyz);
        u_xlat16_22 = clamp(u_xlat16_22, 0.0, 1.0);
        u_xlat16_4.xyz = u_xlat16_5.xyz * vec3(u_xlat16_22) + u_xlat16_4.xyz;
    }
    SV_Target0.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlatb3 = _Surface==1.0;
    SV_Target0.w = (u_xlatb3) ? u_xlat16_0.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_MAIN_LIGHT_SHADOWS" }
Local Keywords { "_ALPHAPREMULTIPLY_ON" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4_MainLightWorldToShadow[20];
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
out highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb22 = unity_OrthoParams.w==0.0;
#endif
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat5.xyz = u_xlat4.yyy * hlslcc_mtx4x4_MainLightWorldToShadow[1].xyz;
    u_xlat5.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[0].xyz * u_xlat4.xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[2].xyz * u_xlat4.zzz + u_xlat5.xyz;
    vs_TEXCOORD7.xyz = u_xlat5.xyz + hlslcc_mtx4x4_MainLightWorldToShadow[3].xyz;
    vs_TEXCOORD7.w = 0.0;
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _MainLightShadowParams;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainLightShadowmapTexture;
UNITY_LOCATION(2) uniform mediump sampler2DShadow hlslcc_zcmp_MainLightShadowmapTexture;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb3;
bool u_xlatb4;
mediump float u_xlat16_5;
mediump float u_xlat16_9;
mediump float u_xlat16_13;
void main()
{
    u_xlat0.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = u_xlat0.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x;
    vec3 txVec0 = vec3(vs_TEXCOORD7.xy,vs_TEXCOORD7.z);
    u_xlat16_0.x = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec0, 0.0);
    u_xlat16_5 = (-_MainLightShadowParams.x) + 1.0;
    u_xlat16_5 = u_xlat16_0.x * _MainLightShadowParams.x + u_xlat16_5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=vs_TEXCOORD7.z);
#else
    u_xlatb0 = 0.0>=vs_TEXCOORD7.z;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(vs_TEXCOORD7.z>=1.0);
#else
    u_xlatb4 = vs_TEXCOORD7.z>=1.0;
#endif
    u_xlatb0 = u_xlatb4 || u_xlatb0;
    u_xlat16_5 = (u_xlatb0) ? 1.0 : u_xlat16_5;
    u_xlat16_9 = (-u_xlat16_5) + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_9 + u_xlat16_5;
    u_xlat16_1.x = u_xlat16_1.x * unity_LightData.z;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _MainLightColor.xyz;
    u_xlat16_13 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13 = min(max(u_xlat16_13, 0.0), 1.0);
#else
    u_xlat16_13 = clamp(u_xlat16_13, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(u_xlat16_13) + vs_TEXCOORD1.xyz;
    u_xlat16_0 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * _BaseColor;
    u_xlat16_2.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_Surface==1.0);
#else
    u_xlatb3 = _Surface==1.0;
#endif
    SV_Target0.w = (u_xlatb3) ? u_xlat16_0.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles " {
Keywords { "_ADDITIONAL_LIGHTS" }
Local Keywords { "_ALPHAPREMULTIPLY_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _BaseMap_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlatb22 = unity_OrthoParams.w==0.0;
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	mediump vec4 _AdditionalLightsCount;
uniform 	vec4 _AdditionalLightsPosition[16];
uniform 	mediump vec4 _AdditionalLightsColor[16];
uniform 	mediump vec4 _AdditionalLightsAttenuation[16];
uniform 	mediump vec4 _AdditionalLightsSpotDir[16];
uniform 	mediump vec4 unity_LightData;
uniform 	mediump vec4 unity_LightIndices[2];
uniform 	mediump vec4 _BaseColor;
uniform 	mediump float _Surface;
uniform lowp sampler2D _BaseMap;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
int u_xlati3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
int u_xlati10;
float u_xlat17;
int u_xlati17;
bool u_xlatb17;
mediump float u_xlat16_22;
float u_xlat24;
bool u_xlatb24;
float u_xlat27;
#define UNITY_DYNAMIC_INDEX_ES2 0






vec4 _AdditionalLightsPositionDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _AdditionalLightsPosition[i];
#else
#define d_ar _AdditionalLightsPosition
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}


mediump vec4 _AdditionalLightsAttenuationDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _AdditionalLightsAttenuation[i];
#else
#define d_ar _AdditionalLightsAttenuation
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}


mediump vec4 _AdditionalLightsSpotDirDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _AdditionalLightsSpotDir[i];
#else
#define d_ar _AdditionalLightsSpotDir
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}


mediump vec4 _AdditionalLightsColorDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _AdditionalLightsColor[i];
#else
#define d_ar _AdditionalLightsColor
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}

void main()
{
    u_xlat10_0 = texture2D(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _BaseColor;
    u_xlat16_1.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat16_2.xyz = _MainLightColor.xyz * unity_LightData.zzz;
    u_xlat16_22 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
    u_xlat16_22 = clamp(u_xlat16_22, 0.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_22) + vs_TEXCOORD1.xyz;
    u_xlat16_22 = min(_AdditionalLightsCount.x, unity_LightData.y);
    u_xlati3 = int(u_xlat16_22);
    u_xlat16_4.xyz = u_xlat16_2.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<u_xlati3 ; u_xlati_loop_1++)
    {
        u_xlat17 = float(u_xlati_loop_1);
        u_xlatb24 = u_xlat17<2.0;
        u_xlat16_5.xy = (bool(u_xlatb24)) ? unity_LightIndices[0].xy : unity_LightIndices[0].zw;
        u_xlat6.x = u_xlat17 + -2.0;
        u_xlat17 = (u_xlatb24) ? u_xlat17 : u_xlat6.x;
        u_xlatb17 = u_xlat17<1.0;
        u_xlat16_22 = (u_xlatb17) ? u_xlat16_5.x : u_xlat16_5.y;
        u_xlati17 = int(u_xlat16_22);
        u_xlat6.xyz = (-vs_TEXCOORD2.xyz) * _AdditionalLightsPositionDynamicIndex(u_xlati17).www + _AdditionalLightsPositionDynamicIndex(u_xlati17).xyz;
        u_xlat24 = dot(u_xlat6.xyz, u_xlat6.xyz);
        u_xlat24 = max(u_xlat24, 6.10351562e-05);
        u_xlat27 = inversesqrt(u_xlat24);
        u_xlat6.xyz = vec3(u_xlat27) * u_xlat6.xyz;
        u_xlat27 = float(1.0) / u_xlat24;
        u_xlat24 = u_xlat24 * _AdditionalLightsAttenuationDynamicIndex(u_xlati17).x + _AdditionalLightsAttenuationDynamicIndex(u_xlati17).y;
        u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
        u_xlat24 = u_xlat24 * u_xlat27;
        u_xlat16_22 = dot(_AdditionalLightsSpotDirDynamicIndex(u_xlati17).xyz, u_xlat6.xyz);
        u_xlat16_22 = u_xlat16_22 * _AdditionalLightsAttenuationDynamicIndex(u_xlati17).z + _AdditionalLightsAttenuationDynamicIndex(u_xlati17).w;
        u_xlat16_22 = clamp(u_xlat16_22, 0.0, 1.0);
        u_xlat16_22 = u_xlat16_22 * u_xlat16_22;
        u_xlat24 = u_xlat16_22 * u_xlat24;
        u_xlat16_5.xyz = vec3(u_xlat24) * _AdditionalLightsColorDynamicIndex(u_xlati17).xyz;
        u_xlat16_22 = dot(vs_TEXCOORD3.xyz, u_xlat6.xyz);
        u_xlat16_22 = clamp(u_xlat16_22, 0.0, 1.0);
        u_xlat16_4.xyz = u_xlat16_5.xyz * vec3(u_xlat16_22) + u_xlat16_4.xyz;
    }
    SV_Target0.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlatb3 = _Surface==1.0;
    SV_Target0.w = (u_xlatb3) ? u_xlat16_0.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_MAIN_LIGHT_SHADOWS" }
Local Keywords { "_RECEIVE_SHADOWS_OFF" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb22 = unity_OrthoParams.w==0.0;
#endif
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec4 u_xlat16_1;
bool u_xlatb2;
mediump float u_xlat16_9;
void main()
{
    u_xlat16_0.xyz = _MainLightColor.xyz * unity_LightData.zzz;
    u_xlat16_9 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9 = min(max(u_xlat16_9, 0.0), 1.0);
#else
    u_xlat16_9 = clamp(u_xlat16_9, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(u_xlat16_9) + vs_TEXCOORD1.xyz;
    u_xlat16_1 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat16_1 * _BaseColor;
    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_Surface==1.0);
#else
    u_xlatb2 = _Surface==1.0;
#endif
    SV_Target0.w = (u_xlatb2) ? u_xlat16_1.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles " {
Keywords { "_ADDITIONAL_LIGHTS" }
Local Keywords { "_RECEIVE_SHADOWS_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _BaseMap_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlatb22 = unity_OrthoParams.w==0.0;
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	mediump vec4 _AdditionalLightsCount;
uniform 	vec4 _AdditionalLightsPosition[16];
uniform 	mediump vec4 _AdditionalLightsColor[16];
uniform 	mediump vec4 _AdditionalLightsAttenuation[16];
uniform 	mediump vec4 _AdditionalLightsSpotDir[16];
uniform 	mediump vec4 unity_LightData;
uniform 	mediump vec4 unity_LightIndices[2];
uniform 	mediump vec4 _BaseColor;
uniform 	mediump float _Surface;
uniform lowp sampler2D _BaseMap;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
int u_xlati2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
int u_xlati8;
float u_xlat14;
int u_xlati14;
bool u_xlatb14;
mediump float u_xlat16_19;
float u_xlat20;
bool u_xlatb20;
float u_xlat23;
#define UNITY_DYNAMIC_INDEX_ES2 0






vec4 _AdditionalLightsPositionDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _AdditionalLightsPosition[i];
#else
#define d_ar _AdditionalLightsPosition
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}


mediump vec4 _AdditionalLightsAttenuationDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _AdditionalLightsAttenuation[i];
#else
#define d_ar _AdditionalLightsAttenuation
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}


mediump vec4 _AdditionalLightsSpotDirDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _AdditionalLightsSpotDir[i];
#else
#define d_ar _AdditionalLightsSpotDir
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}


mediump vec4 _AdditionalLightsColorDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _AdditionalLightsColor[i];
#else
#define d_ar _AdditionalLightsColor
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}

void main()
{
    u_xlat10_0 = texture2D(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _BaseColor;
    u_xlat16_1.xyz = _MainLightColor.xyz * unity_LightData.zzz;
    u_xlat16_19 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(u_xlat16_19) + vs_TEXCOORD1.xyz;
    u_xlat16_19 = min(_AdditionalLightsCount.x, unity_LightData.y);
    u_xlati2 = int(u_xlat16_19);
    u_xlat16_3.xyz = u_xlat16_1.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<u_xlati2 ; u_xlati_loop_1++)
    {
        u_xlat14 = float(u_xlati_loop_1);
        u_xlatb20 = u_xlat14<2.0;
        u_xlat16_4.xy = (bool(u_xlatb20)) ? unity_LightIndices[0].xy : unity_LightIndices[0].zw;
        u_xlat5.x = u_xlat14 + -2.0;
        u_xlat14 = (u_xlatb20) ? u_xlat14 : u_xlat5.x;
        u_xlatb14 = u_xlat14<1.0;
        u_xlat16_19 = (u_xlatb14) ? u_xlat16_4.x : u_xlat16_4.y;
        u_xlati14 = int(u_xlat16_19);
        u_xlat5.xyz = (-vs_TEXCOORD2.xyz) * _AdditionalLightsPositionDynamicIndex(u_xlati14).www + _AdditionalLightsPositionDynamicIndex(u_xlati14).xyz;
        u_xlat20 = dot(u_xlat5.xyz, u_xlat5.xyz);
        u_xlat20 = max(u_xlat20, 6.10351562e-05);
        u_xlat23 = inversesqrt(u_xlat20);
        u_xlat5.xyz = vec3(u_xlat23) * u_xlat5.xyz;
        u_xlat23 = float(1.0) / u_xlat20;
        u_xlat20 = u_xlat20 * _AdditionalLightsAttenuationDynamicIndex(u_xlati14).x + _AdditionalLightsAttenuationDynamicIndex(u_xlati14).y;
        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
        u_xlat20 = u_xlat20 * u_xlat23;
        u_xlat16_19 = dot(_AdditionalLightsSpotDirDynamicIndex(u_xlati14).xyz, u_xlat5.xyz);
        u_xlat16_19 = u_xlat16_19 * _AdditionalLightsAttenuationDynamicIndex(u_xlati14).z + _AdditionalLightsAttenuationDynamicIndex(u_xlati14).w;
        u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
        u_xlat16_19 = u_xlat16_19 * u_xlat16_19;
        u_xlat20 = u_xlat16_19 * u_xlat20;
        u_xlat16_4.xyz = vec3(u_xlat20) * _AdditionalLightsColorDynamicIndex(u_xlati14).xyz;
        u_xlat16_19 = dot(vs_TEXCOORD3.xyz, u_xlat5.xyz);
        u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
        u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(u_xlat16_19) + u_xlat16_3.xyz;
    }
    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlatb2 = _Surface==1.0;
    SV_Target0.w = (u_xlatb2) ? u_xlat16_0.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_MAIN_LIGHT_SHADOWS" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4_MainLightWorldToShadow[20];
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
out highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb22 = unity_OrthoParams.w==0.0;
#endif
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat5.xyz = u_xlat4.yyy * hlslcc_mtx4x4_MainLightWorldToShadow[1].xyz;
    u_xlat5.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[0].xyz * u_xlat4.xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[2].xyz * u_xlat4.zzz + u_xlat5.xyz;
    vs_TEXCOORD7.xyz = u_xlat5.xyz + hlslcc_mtx4x4_MainLightWorldToShadow[3].xyz;
    vs_TEXCOORD7.w = 0.0;
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _MainLightShadowParams;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainLightShadowmapTexture;
UNITY_LOCATION(2) uniform mediump sampler2DShadow hlslcc_zcmp_MainLightShadowmapTexture;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
bool u_xlatb2;
bool u_xlatb3;
mediump float u_xlat16_4;
mediump float u_xlat16_7;
mediump float u_xlat16_10;
void main()
{
    u_xlat0.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = u_xlat0.x * _MainLightShadowParams.z + _MainLightShadowParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x;
    vec3 txVec0 = vec3(vs_TEXCOORD7.xy,vs_TEXCOORD7.z);
    u_xlat16_0.x = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec0, 0.0);
    u_xlat16_4 = (-_MainLightShadowParams.x) + 1.0;
    u_xlat16_4 = u_xlat16_0.x * _MainLightShadowParams.x + u_xlat16_4;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=vs_TEXCOORD7.z);
#else
    u_xlatb0 = 0.0>=vs_TEXCOORD7.z;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(vs_TEXCOORD7.z>=1.0);
#else
    u_xlatb3 = vs_TEXCOORD7.z>=1.0;
#endif
    u_xlatb0 = u_xlatb3 || u_xlatb0;
    u_xlat16_4 = (u_xlatb0) ? 1.0 : u_xlat16_4;
    u_xlat16_7 = (-u_xlat16_4) + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_7 + u_xlat16_4;
    u_xlat16_1.x = u_xlat16_1.x * unity_LightData.z;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _MainLightColor.xyz;
    u_xlat16_10 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10 = min(max(u_xlat16_10, 0.0), 1.0);
#else
    u_xlat16_10 = clamp(u_xlat16_10, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(u_xlat16_10) + vs_TEXCOORD1.xyz;
    u_xlat16_0 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * _BaseColor;
    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_Surface==1.0);
#else
    u_xlatb2 = _Surface==1.0;
#endif
    SV_Target0.w = (u_xlatb2) ? u_xlat16_0.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles " {
Keywords { "_ADDITIONAL_LIGHTS" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _BaseMap_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlatb22 = unity_OrthoParams.w==0.0;
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	mediump vec4 _AdditionalLightsCount;
uniform 	vec4 _AdditionalLightsPosition[16];
uniform 	mediump vec4 _AdditionalLightsColor[16];
uniform 	mediump vec4 _AdditionalLightsAttenuation[16];
uniform 	mediump vec4 _AdditionalLightsSpotDir[16];
uniform 	mediump vec4 unity_LightData;
uniform 	mediump vec4 unity_LightIndices[2];
uniform 	mediump vec4 _BaseColor;
uniform 	mediump float _Surface;
uniform lowp sampler2D _BaseMap;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
int u_xlati2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
int u_xlati8;
float u_xlat14;
int u_xlati14;
bool u_xlatb14;
mediump float u_xlat16_19;
float u_xlat20;
bool u_xlatb20;
float u_xlat23;
#define UNITY_DYNAMIC_INDEX_ES2 0






vec4 _AdditionalLightsPositionDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _AdditionalLightsPosition[i];
#else
#define d_ar _AdditionalLightsPosition
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}


mediump vec4 _AdditionalLightsAttenuationDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _AdditionalLightsAttenuation[i];
#else
#define d_ar _AdditionalLightsAttenuation
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}


mediump vec4 _AdditionalLightsSpotDirDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _AdditionalLightsSpotDir[i];
#else
#define d_ar _AdditionalLightsSpotDir
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}


mediump vec4 _AdditionalLightsColorDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _AdditionalLightsColor[i];
#else
#define d_ar _AdditionalLightsColor
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15];
    return d_ar[0];
#undef d_ar
#endif
}

void main()
{
    u_xlat10_0 = texture2D(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _BaseColor;
    u_xlat16_1.xyz = _MainLightColor.xyz * unity_LightData.zzz;
    u_xlat16_19 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(u_xlat16_19) + vs_TEXCOORD1.xyz;
    u_xlat16_19 = min(_AdditionalLightsCount.x, unity_LightData.y);
    u_xlati2 = int(u_xlat16_19);
    u_xlat16_3.xyz = u_xlat16_1.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<u_xlati2 ; u_xlati_loop_1++)
    {
        u_xlat14 = float(u_xlati_loop_1);
        u_xlatb20 = u_xlat14<2.0;
        u_xlat16_4.xy = (bool(u_xlatb20)) ? unity_LightIndices[0].xy : unity_LightIndices[0].zw;
        u_xlat5.x = u_xlat14 + -2.0;
        u_xlat14 = (u_xlatb20) ? u_xlat14 : u_xlat5.x;
        u_xlatb14 = u_xlat14<1.0;
        u_xlat16_19 = (u_xlatb14) ? u_xlat16_4.x : u_xlat16_4.y;
        u_xlati14 = int(u_xlat16_19);
        u_xlat5.xyz = (-vs_TEXCOORD2.xyz) * _AdditionalLightsPositionDynamicIndex(u_xlati14).www + _AdditionalLightsPositionDynamicIndex(u_xlati14).xyz;
        u_xlat20 = dot(u_xlat5.xyz, u_xlat5.xyz);
        u_xlat20 = max(u_xlat20, 6.10351562e-05);
        u_xlat23 = inversesqrt(u_xlat20);
        u_xlat5.xyz = vec3(u_xlat23) * u_xlat5.xyz;
        u_xlat23 = float(1.0) / u_xlat20;
        u_xlat20 = u_xlat20 * _AdditionalLightsAttenuationDynamicIndex(u_xlati14).x + _AdditionalLightsAttenuationDynamicIndex(u_xlati14).y;
        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
        u_xlat20 = u_xlat20 * u_xlat23;
        u_xlat16_19 = dot(_AdditionalLightsSpotDirDynamicIndex(u_xlati14).xyz, u_xlat5.xyz);
        u_xlat16_19 = u_xlat16_19 * _AdditionalLightsAttenuationDynamicIndex(u_xlati14).z + _AdditionalLightsAttenuationDynamicIndex(u_xlati14).w;
        u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
        u_xlat16_19 = u_xlat16_19 * u_xlat16_19;
        u_xlat20 = u_xlat16_19 * u_xlat20;
        u_xlat16_4.xyz = vec3(u_xlat20) * _AdditionalLightsColorDynamicIndex(u_xlati14).xyz;
        u_xlat16_19 = dot(vs_TEXCOORD3.xyz, u_xlat5.xyz);
        u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
        u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(u_xlat16_19) + u_xlat16_3.xyz;
    }
    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlatb2 = _Surface==1.0;
    SV_Target0.w = (u_xlatb2) ? u_xlat16_0.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_ADDITIONAL_LIGHTS" }
Local Keywords { "_EMISSION" "_GLOSSINESS_FROM_BASE_ALPHA" "_SPECULAR_COLOR" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb22 = unity_OrthoParams.w==0.0;
#endif
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
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
vec4 ImmCB_0[4];
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	mediump vec4 _AdditionalLightsCount;
uniform 	vec4 _AdditionalLightsPosition[16];
uniform 	mediump vec4 _AdditionalLightsColor[16];
uniform 	mediump vec4 _AdditionalLightsAttenuation[16];
uniform 	mediump vec4 _AdditionalLightsSpotDir[16];
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
UNITY_LOCATION(1) uniform mediump sampler2D _EmissionMap;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
uint u_xlatu5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump float u_xlat16_13;
vec3 u_xlat16;
int u_xlati16;
bool u_xlatb16;
mediump float u_xlat16_24;
float u_xlat27;
uint u_xlatu27;
float u_xlat34;
uint u_xlatu34;
float u_xlat38;
void main()
{
ImmCB_0[0] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.0,1.0,0.0,0.0);
ImmCB_0[2] = vec4(0.0,0.0,1.0,0.0);
ImmCB_0[3] = vec4(0.0,0.0,0.0,1.0);
    u_xlat16_0 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * _BaseColor;
    u_xlat16_1.xyz = texture(_EmissionMap, vs_TEXCOORD0.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * _EmissionColor.xyz;
    u_xlat16_2.x = u_xlat16_0.w * 10.0 + 1.0;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat34 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat34 = max(u_xlat34, 1.17549435e-38);
    u_xlat16_13 = inversesqrt(u_xlat34);
    u_xlat16_3.xyz = _MainLightColor.xyz * unity_LightData.zzz;
    u_xlat16_24 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_24 = min(max(u_xlat16_24, 0.0), 1.0);
#else
    u_xlat16_24 = clamp(u_xlat16_24, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(u_xlat16_24) + vs_TEXCOORD1.xyz;
    u_xlat5.xyz = vs_TEXCOORD4.xyz * vec3(u_xlat16_13) + _MainLightPosition.xyz;
    u_xlat34 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat34 = max(u_xlat34, 1.17549435e-38);
    u_xlat16_24 = inversesqrt(u_xlat34);
    u_xlat5.xyz = vec3(u_xlat16_24) * u_xlat5.xyz;
    u_xlat34 = dot(vs_TEXCOORD3.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat34 = min(max(u_xlat34, 0.0), 1.0);
#else
    u_xlat34 = clamp(u_xlat34, 0.0, 1.0);
#endif
    u_xlat16_24 = log2(u_xlat34);
    u_xlat16_24 = u_xlat16_24 * u_xlat16_2.x;
    u_xlat16_24 = exp2(u_xlat16_24);
    u_xlat16_6.xyz = vec3(u_xlat16_24) * _SpecColor.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_6.xyz;
    u_xlat16_24 = min(_AdditionalLightsCount.x, unity_LightData.y);
    u_xlatu34 =  uint(int(u_xlat16_24));
    u_xlat16_6.xyz = u_xlat16_4.xyz;
    u_xlat16_7.xyz = u_xlat16_3.xyz;
    for(uint u_xlatu_loop_1 = uint(0u) ; u_xlatu_loop_1<u_xlatu34 ; u_xlatu_loop_1++)
    {
        u_xlati16 = int(uint(u_xlatu_loop_1 & 3u));
        u_xlatu27 = uint(u_xlatu_loop_1 >> 2u);
        u_xlat16_24 = dot(unity_LightIndices[int(u_xlatu27)], ImmCB_0[u_xlati16]);
        u_xlati16 = int(u_xlat16_24);
        u_xlat8.xyz = (-vs_TEXCOORD2.xyz) * _AdditionalLightsPosition[u_xlati16].www + _AdditionalLightsPosition[u_xlati16].xyz;
        u_xlat27 = dot(u_xlat8.xyz, u_xlat8.xyz);
        u_xlat27 = max(u_xlat27, 6.10351562e-05);
        u_xlat38 = inversesqrt(u_xlat27);
        u_xlat8.xyz = vec3(u_xlat38) * u_xlat8.xyz;
        u_xlat38 = float(1.0) / float(u_xlat27);
        u_xlat27 = u_xlat27 * _AdditionalLightsAttenuation[u_xlati16].x + _AdditionalLightsAttenuation[u_xlati16].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
#else
        u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
#endif
        u_xlat27 = u_xlat27 * u_xlat38;
        u_xlat16_24 = dot(_AdditionalLightsSpotDir[u_xlati16].xyz, u_xlat8.xyz);
        u_xlat16_24 = u_xlat16_24 * _AdditionalLightsAttenuation[u_xlati16].z + _AdditionalLightsAttenuation[u_xlati16].w;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_24 = min(max(u_xlat16_24, 0.0), 1.0);
#else
        u_xlat16_24 = clamp(u_xlat16_24, 0.0, 1.0);
#endif
        u_xlat16_24 = u_xlat16_24 * u_xlat16_24;
        u_xlat27 = u_xlat16_24 * u_xlat27;
        u_xlat16_9.xyz = vec3(u_xlat27) * _AdditionalLightsColor[u_xlati16].xyz;
        u_xlat16_24 = dot(vs_TEXCOORD3.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
        u_xlat16_24 = min(max(u_xlat16_24, 0.0), 1.0);
#else
        u_xlat16_24 = clamp(u_xlat16_24, 0.0, 1.0);
#endif
        u_xlat16_6.xyz = u_xlat16_9.xyz * vec3(u_xlat16_24) + u_xlat16_6.xyz;
        u_xlat16.xyz = vs_TEXCOORD4.xyz * vec3(u_xlat16_13) + u_xlat8.xyz;
        u_xlat8.x = dot(u_xlat16.xyz, u_xlat16.xyz);
        u_xlat8.x = max(u_xlat8.x, 1.17549435e-38);
        u_xlat16_24 = inversesqrt(u_xlat8.x);
        u_xlat16.xyz = vec3(u_xlat16_24) * u_xlat16.xyz;
        u_xlat16.x = dot(vs_TEXCOORD3.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
        u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
        u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
        u_xlat16_24 = log2(u_xlat16.x);
        u_xlat16_24 = u_xlat16_24 * u_xlat16_2.x;
        u_xlat16_24 = exp2(u_xlat16_24);
        u_xlat16_10.xyz = vec3(u_xlat16_24) * _SpecColor.xyz;
        u_xlat16_7.xyz = u_xlat16_9.xyz * u_xlat16_10.xyz + u_xlat16_7.xyz;
    }
    u_xlat16_2.xyz = u_xlat16_6.xyz * u_xlat16_0.xyz + u_xlat1.xyz;
    SV_Target0.xyz = u_xlat16_7.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_Surface==1.0);
#else
    u_xlatb1 = _Surface==1.0;
#endif
    SV_Target0.w = (u_xlatb1) ? u_xlat16_0.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_ADDITIONAL_LIGHTS" }
Local Keywords { "_EMISSION" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb22 = unity_OrthoParams.w==0.0;
#endif
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
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
vec4 ImmCB_0[4];
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	mediump vec4 _AdditionalLightsCount;
uniform 	vec4 _AdditionalLightsPosition[16];
uniform 	mediump vec4 _AdditionalLightsColor[16];
uniform 	mediump vec4 _AdditionalLightsAttenuation[16];
uniform 	mediump vec4 _AdditionalLightsSpotDir[16];
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
UNITY_LOCATION(1) uniform mediump sampler2D _EmissionMap;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
uint u_xlatu4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
int u_xlati11;
bool u_xlatb11;
float u_xlat18;
uint u_xlatu18;
uint u_xlatu22;
mediump float u_xlat16_23;
float u_xlat25;
void main()
{
ImmCB_0[0] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.0,1.0,0.0,0.0);
ImmCB_0[2] = vec4(0.0,0.0,1.0,0.0);
ImmCB_0[3] = vec4(0.0,0.0,0.0,1.0);
    u_xlat16_0 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * _BaseColor;
    u_xlat16_1.xyz = texture(_EmissionMap, vs_TEXCOORD0.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * _EmissionColor.xyz;
    u_xlat16_2.xyz = _MainLightColor.xyz * unity_LightData.zzz;
    u_xlat16_23 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_23) + vs_TEXCOORD1.xyz;
    u_xlat16_23 = min(_AdditionalLightsCount.x, unity_LightData.y);
    u_xlatu22 =  uint(int(u_xlat16_23));
    u_xlat16_3.xyz = u_xlat16_2.xyz;
    for(uint u_xlatu_loop_1 = uint(0u) ; u_xlatu_loop_1<u_xlatu22 ; u_xlatu_loop_1++)
    {
        u_xlati11 = int(uint(u_xlatu_loop_1 & 3u));
        u_xlatu18 = uint(u_xlatu_loop_1 >> 2u);
        u_xlat16_23 = dot(unity_LightIndices[int(u_xlatu18)], ImmCB_0[u_xlati11]);
        u_xlati11 = int(u_xlat16_23);
        u_xlat5.xyz = (-vs_TEXCOORD2.xyz) * _AdditionalLightsPosition[u_xlati11].www + _AdditionalLightsPosition[u_xlati11].xyz;
        u_xlat18 = dot(u_xlat5.xyz, u_xlat5.xyz);
        u_xlat18 = max(u_xlat18, 6.10351562e-05);
        u_xlat25 = inversesqrt(u_xlat18);
        u_xlat5.xyz = vec3(u_xlat25) * u_xlat5.xyz;
        u_xlat25 = float(1.0) / float(u_xlat18);
        u_xlat18 = u_xlat18 * _AdditionalLightsAttenuation[u_xlati11].x + _AdditionalLightsAttenuation[u_xlati11].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
        u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
        u_xlat18 = u_xlat18 * u_xlat25;
        u_xlat16_23 = dot(_AdditionalLightsSpotDir[u_xlati11].xyz, u_xlat5.xyz);
        u_xlat16_23 = u_xlat16_23 * _AdditionalLightsAttenuation[u_xlati11].z + _AdditionalLightsAttenuation[u_xlati11].w;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
        u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
        u_xlat16_23 = u_xlat16_23 * u_xlat16_23;
        u_xlat18 = u_xlat16_23 * u_xlat18;
        u_xlat16_6.xyz = vec3(u_xlat18) * _AdditionalLightsColor[u_xlati11].xyz;
        u_xlat16_23 = dot(vs_TEXCOORD3.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
        u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
        u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
        u_xlat16_3.xyz = u_xlat16_6.xyz * vec3(u_xlat16_23) + u_xlat16_3.xyz;
    }
    SV_Target0.xyz = u_xlat16_3.xyz * u_xlat16_0.xyz + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_Surface==1.0);
#else
    u_xlatb1 = _Surface==1.0;
#endif
    SV_Target0.w = (u_xlatb1) ? u_xlat16_0.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_ADDITIONAL_LIGHTS" }
Local Keywords { "_GLOSSINESS_FROM_BASE_ALPHA" "_SPECULAR_COLOR" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb22 = unity_OrthoParams.w==0.0;
#endif
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
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
vec4 ImmCB_0[4];
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	mediump vec4 _AdditionalLightsCount;
uniform 	vec4 _AdditionalLightsPosition[16];
uniform 	mediump vec4 _AdditionalLightsColor[16];
uniform 	mediump vec4 _AdditionalLightsAttenuation[16];
uniform 	mediump vec4 _AdditionalLightsSpotDir[16];
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump float u_xlat16_1;
vec3 u_xlat2;
uint u_xlatu2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump float u_xlat16_11;
uint u_xlatu12;
mediump float u_xlat16_21;
float u_xlat22;
int u_xlati22;
bool u_xlatb22;
float u_xlat32;
uint u_xlatu32;
float u_xlat37;
void main()
{
ImmCB_0[0] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.0,1.0,0.0,0.0);
ImmCB_0[2] = vec4(0.0,0.0,1.0,0.0);
ImmCB_0[3] = vec4(0.0,0.0,0.0,1.0);
    u_xlat16_0 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * _BaseColor;
    u_xlat16_1 = u_xlat16_0.w * 10.0 + 1.0;
    u_xlat16_1 = exp2(u_xlat16_1);
    u_xlat2.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat2.x = max(u_xlat2.x, 1.17549435e-38);
    u_xlat16_11 = inversesqrt(u_xlat2.x);
    u_xlat16_3.xyz = _MainLightColor.xyz * unity_LightData.zzz;
    u_xlat16_21 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_21 = min(max(u_xlat16_21, 0.0), 1.0);
#else
    u_xlat16_21 = clamp(u_xlat16_21, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(u_xlat16_21) + vs_TEXCOORD1.xyz;
    u_xlat2.xyz = vs_TEXCOORD4.xyz * vec3(u_xlat16_11) + _MainLightPosition.xyz;
    u_xlat32 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat32 = max(u_xlat32, 1.17549435e-38);
    u_xlat16_21 = inversesqrt(u_xlat32);
    u_xlat2.xyz = vec3(u_xlat16_21) * u_xlat2.xyz;
    u_xlat2.x = dot(vs_TEXCOORD3.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_21 = log2(u_xlat2.x);
    u_xlat16_21 = u_xlat16_21 * u_xlat16_1;
    u_xlat16_21 = exp2(u_xlat16_21);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * _SpecColor.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz;
    u_xlat16_21 = min(_AdditionalLightsCount.x, unity_LightData.y);
    u_xlatu2 =  uint(int(u_xlat16_21));
    u_xlat16_5.xyz = u_xlat16_4.xyz;
    u_xlat16_6.xyz = u_xlat16_3.xyz;
    for(uint u_xlatu_loop_1 = uint(0u) ; u_xlatu_loop_1<u_xlatu2 ; u_xlatu_loop_1++)
    {
        u_xlati22 = int(uint(u_xlatu_loop_1 & 3u));
        u_xlatu32 = uint(u_xlatu_loop_1 >> 2u);
        u_xlat16_21 = dot(unity_LightIndices[int(u_xlatu32)], ImmCB_0[u_xlati22]);
        u_xlati22 = int(u_xlat16_21);
        u_xlat7.xyz = (-vs_TEXCOORD2.xyz) * _AdditionalLightsPosition[u_xlati22].www + _AdditionalLightsPosition[u_xlati22].xyz;
        u_xlat32 = dot(u_xlat7.xyz, u_xlat7.xyz);
        u_xlat32 = max(u_xlat32, 6.10351562e-05);
        u_xlat37 = inversesqrt(u_xlat32);
        u_xlat7.xyz = vec3(u_xlat37) * u_xlat7.xyz;
        u_xlat37 = float(1.0) / float(u_xlat32);
        u_xlat32 = u_xlat32 * _AdditionalLightsAttenuation[u_xlati22].x + _AdditionalLightsAttenuation[u_xlati22].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat32 = min(max(u_xlat32, 0.0), 1.0);
#else
        u_xlat32 = clamp(u_xlat32, 0.0, 1.0);
#endif
        u_xlat32 = u_xlat32 * u_xlat37;
        u_xlat16_21 = dot(_AdditionalLightsSpotDir[u_xlati22].xyz, u_xlat7.xyz);
        u_xlat16_21 = u_xlat16_21 * _AdditionalLightsAttenuation[u_xlati22].z + _AdditionalLightsAttenuation[u_xlati22].w;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_21 = min(max(u_xlat16_21, 0.0), 1.0);
#else
        u_xlat16_21 = clamp(u_xlat16_21, 0.0, 1.0);
#endif
        u_xlat16_21 = u_xlat16_21 * u_xlat16_21;
        u_xlat32 = u_xlat16_21 * u_xlat32;
        u_xlat16_8.xyz = vec3(u_xlat32) * _AdditionalLightsColor[u_xlati22].xyz;
        u_xlat16_21 = dot(vs_TEXCOORD3.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
        u_xlat16_21 = min(max(u_xlat16_21, 0.0), 1.0);
#else
        u_xlat16_21 = clamp(u_xlat16_21, 0.0, 1.0);
#endif
        u_xlat16_5.xyz = u_xlat16_8.xyz * vec3(u_xlat16_21) + u_xlat16_5.xyz;
        u_xlat7.xyz = vs_TEXCOORD4.xyz * vec3(u_xlat16_11) + u_xlat7.xyz;
        u_xlat22 = dot(u_xlat7.xyz, u_xlat7.xyz);
        u_xlat22 = max(u_xlat22, 1.17549435e-38);
        u_xlat16_21 = inversesqrt(u_xlat22);
        u_xlat7.xyz = vec3(u_xlat16_21) * u_xlat7.xyz;
        u_xlat22 = dot(vs_TEXCOORD3.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
        u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
        u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
        u_xlat16_21 = log2(u_xlat22);
        u_xlat16_21 = u_xlat16_21 * u_xlat16_1;
        u_xlat16_21 = exp2(u_xlat16_21);
        u_xlat16_9.xyz = vec3(u_xlat16_21) * _SpecColor.xyz;
        u_xlat16_6.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz + u_xlat16_6.xyz;
    }
    SV_Target0.xyz = u_xlat16_5.xyz * u_xlat16_0.xyz + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_Surface==1.0);
#else
    u_xlatb2 = _Surface==1.0;
#endif
    SV_Target0.w = (u_xlatb2) ? u_xlat16_0.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_ADDITIONAL_LIGHTS" }
Local Keywords { "_GLOSSINESS_FROM_BASE_ALPHA" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb22 = unity_OrthoParams.w==0.0;
#endif
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
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
vec4 ImmCB_0[4];
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	mediump vec4 _AdditionalLightsCount;
uniform 	vec4 _AdditionalLightsPosition[16];
uniform 	mediump vec4 _AdditionalLightsColor[16];
uniform 	mediump vec4 _AdditionalLightsAttenuation[16];
uniform 	mediump vec4 _AdditionalLightsSpotDir[16];
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
uint u_xlatu2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
uint u_xlatu8;
int u_xlati14;
bool u_xlatb14;
mediump float u_xlat16_19;
float u_xlat20;
uint u_xlatu20;
float u_xlat22;
void main()
{
ImmCB_0[0] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.0,1.0,0.0,0.0);
ImmCB_0[2] = vec4(0.0,0.0,1.0,0.0);
ImmCB_0[3] = vec4(0.0,0.0,0.0,1.0);
    u_xlat16_0 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * _BaseColor;
    u_xlat16_1.xyz = _MainLightColor.xyz * unity_LightData.zzz;
    u_xlat16_19 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19 = min(max(u_xlat16_19, 0.0), 1.0);
#else
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(u_xlat16_19) + vs_TEXCOORD1.xyz;
    u_xlat16_19 = min(_AdditionalLightsCount.x, unity_LightData.y);
    u_xlatu2 =  uint(int(u_xlat16_19));
    u_xlat16_3.xyz = u_xlat16_1.xyz;
    for(uint u_xlatu_loop_1 = uint(0u) ; u_xlatu_loop_1<u_xlatu2 ; u_xlatu_loop_1++)
    {
        u_xlati14 = int(uint(u_xlatu_loop_1 & 3u));
        u_xlatu20 = uint(u_xlatu_loop_1 >> 2u);
        u_xlat16_19 = dot(unity_LightIndices[int(u_xlatu20)], ImmCB_0[u_xlati14]);
        u_xlati14 = int(u_xlat16_19);
        u_xlat4.xyz = (-vs_TEXCOORD2.xyz) * _AdditionalLightsPosition[u_xlati14].www + _AdditionalLightsPosition[u_xlati14].xyz;
        u_xlat20 = dot(u_xlat4.xyz, u_xlat4.xyz);
        u_xlat20 = max(u_xlat20, 6.10351562e-05);
        u_xlat22 = inversesqrt(u_xlat20);
        u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz;
        u_xlat22 = float(1.0) / float(u_xlat20);
        u_xlat20 = u_xlat20 * _AdditionalLightsAttenuation[u_xlati14].x + _AdditionalLightsAttenuation[u_xlati14].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
        u_xlat20 = u_xlat20 * u_xlat22;
        u_xlat16_19 = dot(_AdditionalLightsSpotDir[u_xlati14].xyz, u_xlat4.xyz);
        u_xlat16_19 = u_xlat16_19 * _AdditionalLightsAttenuation[u_xlati14].z + _AdditionalLightsAttenuation[u_xlati14].w;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_19 = min(max(u_xlat16_19, 0.0), 1.0);
#else
        u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
#endif
        u_xlat16_19 = u_xlat16_19 * u_xlat16_19;
        u_xlat20 = u_xlat16_19 * u_xlat20;
        u_xlat16_5.xyz = vec3(u_xlat20) * _AdditionalLightsColor[u_xlati14].xyz;
        u_xlat16_19 = dot(vs_TEXCOORD3.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
        u_xlat16_19 = min(max(u_xlat16_19, 0.0), 1.0);
#else
        u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
#endif
        u_xlat16_3.xyz = u_xlat16_5.xyz * vec3(u_xlat16_19) + u_xlat16_3.xyz;
    }
    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_Surface==1.0);
#else
    u_xlatb2 = _Surface==1.0;
#endif
    SV_Target0.w = (u_xlatb2) ? u_xlat16_0.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_ADDITIONAL_LIGHTS" }
Local Keywords { "_ALPHAPREMULTIPLY_ON" "_RECEIVE_SHADOWS_OFF" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb22 = unity_OrthoParams.w==0.0;
#endif
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
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
vec4 ImmCB_0[4];
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	mediump vec4 _AdditionalLightsCount;
uniform 	vec4 _AdditionalLightsPosition[16];
uniform 	mediump vec4 _AdditionalLightsColor[16];
uniform 	mediump vec4 _AdditionalLightsAttenuation[16];
uniform 	mediump vec4 _AdditionalLightsSpotDir[16];
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
uint u_xlatu3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
uint u_xlatu10;
int u_xlati17;
bool u_xlatb17;
mediump float u_xlat16_22;
float u_xlat24;
uint u_xlatu24;
float u_xlat26;
void main()
{
ImmCB_0[0] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.0,1.0,0.0,0.0);
ImmCB_0[2] = vec4(0.0,0.0,1.0,0.0);
ImmCB_0[3] = vec4(0.0,0.0,0.0,1.0);
    u_xlat16_0 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * _BaseColor;
    u_xlat16_1.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat16_2.xyz = _MainLightColor.xyz * unity_LightData.zzz;
    u_xlat16_22 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_22 = min(max(u_xlat16_22, 0.0), 1.0);
#else
    u_xlat16_22 = clamp(u_xlat16_22, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_22) + vs_TEXCOORD1.xyz;
    u_xlat16_22 = min(_AdditionalLightsCount.x, unity_LightData.y);
    u_xlatu3 =  uint(int(u_xlat16_22));
    u_xlat16_4.xyz = u_xlat16_2.xyz;
    for(uint u_xlatu_loop_1 = uint(0u) ; u_xlatu_loop_1<u_xlatu3 ; u_xlatu_loop_1++)
    {
        u_xlati17 = int(uint(u_xlatu_loop_1 & 3u));
        u_xlatu24 = uint(u_xlatu_loop_1 >> 2u);
        u_xlat16_22 = dot(unity_LightIndices[int(u_xlatu24)], ImmCB_0[u_xlati17]);
        u_xlati17 = int(u_xlat16_22);
        u_xlat5.xyz = (-vs_TEXCOORD2.xyz) * _AdditionalLightsPosition[u_xlati17].www + _AdditionalLightsPosition[u_xlati17].xyz;
        u_xlat24 = dot(u_xlat5.xyz, u_xlat5.xyz);
        u_xlat24 = max(u_xlat24, 6.10351562e-05);
        u_xlat26 = inversesqrt(u_xlat24);
        u_xlat5.xyz = vec3(u_xlat26) * u_xlat5.xyz;
        u_xlat26 = float(1.0) / float(u_xlat24);
        u_xlat24 = u_xlat24 * _AdditionalLightsAttenuation[u_xlati17].x + _AdditionalLightsAttenuation[u_xlati17].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
        u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
        u_xlat24 = u_xlat24 * u_xlat26;
        u_xlat16_22 = dot(_AdditionalLightsSpotDir[u_xlati17].xyz, u_xlat5.xyz);
        u_xlat16_22 = u_xlat16_22 * _AdditionalLightsAttenuation[u_xlati17].z + _AdditionalLightsAttenuation[u_xlati17].w;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_22 = min(max(u_xlat16_22, 0.0), 1.0);
#else
        u_xlat16_22 = clamp(u_xlat16_22, 0.0, 1.0);
#endif
        u_xlat16_22 = u_xlat16_22 * u_xlat16_22;
        u_xlat24 = u_xlat16_22 * u_xlat24;
        u_xlat16_6.xyz = vec3(u_xlat24) * _AdditionalLightsColor[u_xlati17].xyz;
        u_xlat16_22 = dot(vs_TEXCOORD3.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
        u_xlat16_22 = min(max(u_xlat16_22, 0.0), 1.0);
#else
        u_xlat16_22 = clamp(u_xlat16_22, 0.0, 1.0);
#endif
        u_xlat16_4.xyz = u_xlat16_6.xyz * vec3(u_xlat16_22) + u_xlat16_4.xyz;
    }
    SV_Target0.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_Surface==1.0);
#else
    u_xlatb3 = _Surface==1.0;
#endif
    SV_Target0.w = (u_xlatb3) ? u_xlat16_0.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_ADDITIONAL_LIGHTS" }
Local Keywords { "_ALPHAPREMULTIPLY_ON" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb22 = unity_OrthoParams.w==0.0;
#endif
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
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
vec4 ImmCB_0[4];
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	mediump vec4 _AdditionalLightsCount;
uniform 	vec4 _AdditionalLightsPosition[16];
uniform 	mediump vec4 _AdditionalLightsColor[16];
uniform 	mediump vec4 _AdditionalLightsAttenuation[16];
uniform 	mediump vec4 _AdditionalLightsSpotDir[16];
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
uint u_xlatu3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
uint u_xlatu10;
int u_xlati17;
bool u_xlatb17;
mediump float u_xlat16_22;
float u_xlat24;
uint u_xlatu24;
float u_xlat26;
void main()
{
ImmCB_0[0] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.0,1.0,0.0,0.0);
ImmCB_0[2] = vec4(0.0,0.0,1.0,0.0);
ImmCB_0[3] = vec4(0.0,0.0,0.0,1.0);
    u_xlat16_0 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * _BaseColor;
    u_xlat16_1.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat16_2.xyz = _MainLightColor.xyz * unity_LightData.zzz;
    u_xlat16_22 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_22 = min(max(u_xlat16_22, 0.0), 1.0);
#else
    u_xlat16_22 = clamp(u_xlat16_22, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_22) + vs_TEXCOORD1.xyz;
    u_xlat16_22 = min(_AdditionalLightsCount.x, unity_LightData.y);
    u_xlatu3 =  uint(int(u_xlat16_22));
    u_xlat16_4.xyz = u_xlat16_2.xyz;
    for(uint u_xlatu_loop_1 = uint(0u) ; u_xlatu_loop_1<u_xlatu3 ; u_xlatu_loop_1++)
    {
        u_xlati17 = int(uint(u_xlatu_loop_1 & 3u));
        u_xlatu24 = uint(u_xlatu_loop_1 >> 2u);
        u_xlat16_22 = dot(unity_LightIndices[int(u_xlatu24)], ImmCB_0[u_xlati17]);
        u_xlati17 = int(u_xlat16_22);
        u_xlat5.xyz = (-vs_TEXCOORD2.xyz) * _AdditionalLightsPosition[u_xlati17].www + _AdditionalLightsPosition[u_xlati17].xyz;
        u_xlat24 = dot(u_xlat5.xyz, u_xlat5.xyz);
        u_xlat24 = max(u_xlat24, 6.10351562e-05);
        u_xlat26 = inversesqrt(u_xlat24);
        u_xlat5.xyz = vec3(u_xlat26) * u_xlat5.xyz;
        u_xlat26 = float(1.0) / float(u_xlat24);
        u_xlat24 = u_xlat24 * _AdditionalLightsAttenuation[u_xlati17].x + _AdditionalLightsAttenuation[u_xlati17].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
        u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
        u_xlat24 = u_xlat24 * u_xlat26;
        u_xlat16_22 = dot(_AdditionalLightsSpotDir[u_xlati17].xyz, u_xlat5.xyz);
        u_xlat16_22 = u_xlat16_22 * _AdditionalLightsAttenuation[u_xlati17].z + _AdditionalLightsAttenuation[u_xlati17].w;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_22 = min(max(u_xlat16_22, 0.0), 1.0);
#else
        u_xlat16_22 = clamp(u_xlat16_22, 0.0, 1.0);
#endif
        u_xlat16_22 = u_xlat16_22 * u_xlat16_22;
        u_xlat24 = u_xlat16_22 * u_xlat24;
        u_xlat16_6.xyz = vec3(u_xlat24) * _AdditionalLightsColor[u_xlati17].xyz;
        u_xlat16_22 = dot(vs_TEXCOORD3.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
        u_xlat16_22 = min(max(u_xlat16_22, 0.0), 1.0);
#else
        u_xlat16_22 = clamp(u_xlat16_22, 0.0, 1.0);
#endif
        u_xlat16_4.xyz = u_xlat16_6.xyz * vec3(u_xlat16_22) + u_xlat16_4.xyz;
    }
    SV_Target0.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_Surface==1.0);
#else
    u_xlatb3 = _Surface==1.0;
#endif
    SV_Target0.w = (u_xlatb3) ? u_xlat16_0.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_ADDITIONAL_LIGHTS" }
Local Keywords { "_RECEIVE_SHADOWS_OFF" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb22 = unity_OrthoParams.w==0.0;
#endif
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
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
vec4 ImmCB_0[4];
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	mediump vec4 _AdditionalLightsCount;
uniform 	vec4 _AdditionalLightsPosition[16];
uniform 	mediump vec4 _AdditionalLightsColor[16];
uniform 	mediump vec4 _AdditionalLightsAttenuation[16];
uniform 	mediump vec4 _AdditionalLightsSpotDir[16];
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
uint u_xlatu2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
uint u_xlatu8;
int u_xlati14;
bool u_xlatb14;
mediump float u_xlat16_19;
float u_xlat20;
uint u_xlatu20;
float u_xlat22;
void main()
{
ImmCB_0[0] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.0,1.0,0.0,0.0);
ImmCB_0[2] = vec4(0.0,0.0,1.0,0.0);
ImmCB_0[3] = vec4(0.0,0.0,0.0,1.0);
    u_xlat16_0 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * _BaseColor;
    u_xlat16_1.xyz = _MainLightColor.xyz * unity_LightData.zzz;
    u_xlat16_19 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19 = min(max(u_xlat16_19, 0.0), 1.0);
#else
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(u_xlat16_19) + vs_TEXCOORD1.xyz;
    u_xlat16_19 = min(_AdditionalLightsCount.x, unity_LightData.y);
    u_xlatu2 =  uint(int(u_xlat16_19));
    u_xlat16_3.xyz = u_xlat16_1.xyz;
    for(uint u_xlatu_loop_1 = uint(0u) ; u_xlatu_loop_1<u_xlatu2 ; u_xlatu_loop_1++)
    {
        u_xlati14 = int(uint(u_xlatu_loop_1 & 3u));
        u_xlatu20 = uint(u_xlatu_loop_1 >> 2u);
        u_xlat16_19 = dot(unity_LightIndices[int(u_xlatu20)], ImmCB_0[u_xlati14]);
        u_xlati14 = int(u_xlat16_19);
        u_xlat4.xyz = (-vs_TEXCOORD2.xyz) * _AdditionalLightsPosition[u_xlati14].www + _AdditionalLightsPosition[u_xlati14].xyz;
        u_xlat20 = dot(u_xlat4.xyz, u_xlat4.xyz);
        u_xlat20 = max(u_xlat20, 6.10351562e-05);
        u_xlat22 = inversesqrt(u_xlat20);
        u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz;
        u_xlat22 = float(1.0) / float(u_xlat20);
        u_xlat20 = u_xlat20 * _AdditionalLightsAttenuation[u_xlati14].x + _AdditionalLightsAttenuation[u_xlati14].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
        u_xlat20 = u_xlat20 * u_xlat22;
        u_xlat16_19 = dot(_AdditionalLightsSpotDir[u_xlati14].xyz, u_xlat4.xyz);
        u_xlat16_19 = u_xlat16_19 * _AdditionalLightsAttenuation[u_xlati14].z + _AdditionalLightsAttenuation[u_xlati14].w;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_19 = min(max(u_xlat16_19, 0.0), 1.0);
#else
        u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
#endif
        u_xlat16_19 = u_xlat16_19 * u_xlat16_19;
        u_xlat20 = u_xlat16_19 * u_xlat20;
        u_xlat16_5.xyz = vec3(u_xlat20) * _AdditionalLightsColor[u_xlati14].xyz;
        u_xlat16_19 = dot(vs_TEXCOORD3.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
        u_xlat16_19 = min(max(u_xlat16_19, 0.0), 1.0);
#else
        u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
#endif
        u_xlat16_3.xyz = u_xlat16_5.xyz * vec3(u_xlat16_19) + u_xlat16_3.xyz;
    }
    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_Surface==1.0);
#else
    u_xlatb2 = _Surface==1.0;
#endif
    SV_Target0.w = (u_xlatb2) ? u_xlat16_0.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "_ADDITIONAL_LIGHTS" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb22 = unity_OrthoParams.w==0.0;
#endif
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
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
vec4 ImmCB_0[4];
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
uniform 	mediump vec4 _AdditionalLightsCount;
uniform 	vec4 _AdditionalLightsPosition[16];
uniform 	mediump vec4 _AdditionalLightsColor[16];
uniform 	mediump vec4 _AdditionalLightsAttenuation[16];
uniform 	mediump vec4 _AdditionalLightsSpotDir[16];
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
uint u_xlatu2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
uint u_xlatu8;
int u_xlati14;
bool u_xlatb14;
mediump float u_xlat16_19;
float u_xlat20;
uint u_xlatu20;
float u_xlat22;
void main()
{
ImmCB_0[0] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.0,1.0,0.0,0.0);
ImmCB_0[2] = vec4(0.0,0.0,1.0,0.0);
ImmCB_0[3] = vec4(0.0,0.0,0.0,1.0);
    u_xlat16_0 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * _BaseColor;
    u_xlat16_1.xyz = _MainLightColor.xyz * unity_LightData.zzz;
    u_xlat16_19 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19 = min(max(u_xlat16_19, 0.0), 1.0);
#else
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(u_xlat16_19) + vs_TEXCOORD1.xyz;
    u_xlat16_19 = min(_AdditionalLightsCount.x, unity_LightData.y);
    u_xlatu2 =  uint(int(u_xlat16_19));
    u_xlat16_3.xyz = u_xlat16_1.xyz;
    for(uint u_xlatu_loop_1 = uint(0u) ; u_xlatu_loop_1<u_xlatu2 ; u_xlatu_loop_1++)
    {
        u_xlati14 = int(uint(u_xlatu_loop_1 & 3u));
        u_xlatu20 = uint(u_xlatu_loop_1 >> 2u);
        u_xlat16_19 = dot(unity_LightIndices[int(u_xlatu20)], ImmCB_0[u_xlati14]);
        u_xlati14 = int(u_xlat16_19);
        u_xlat4.xyz = (-vs_TEXCOORD2.xyz) * _AdditionalLightsPosition[u_xlati14].www + _AdditionalLightsPosition[u_xlati14].xyz;
        u_xlat20 = dot(u_xlat4.xyz, u_xlat4.xyz);
        u_xlat20 = max(u_xlat20, 6.10351562e-05);
        u_xlat22 = inversesqrt(u_xlat20);
        u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz;
        u_xlat22 = float(1.0) / float(u_xlat20);
        u_xlat20 = u_xlat20 * _AdditionalLightsAttenuation[u_xlati14].x + _AdditionalLightsAttenuation[u_xlati14].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
        u_xlat20 = u_xlat20 * u_xlat22;
        u_xlat16_19 = dot(_AdditionalLightsSpotDir[u_xlati14].xyz, u_xlat4.xyz);
        u_xlat16_19 = u_xlat16_19 * _AdditionalLightsAttenuation[u_xlati14].z + _AdditionalLightsAttenuation[u_xlati14].w;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_19 = min(max(u_xlat16_19, 0.0), 1.0);
#else
        u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
#endif
        u_xlat16_19 = u_xlat16_19 * u_xlat16_19;
        u_xlat20 = u_xlat16_19 * u_xlat20;
        u_xlat16_5.xyz = vec3(u_xlat20) * _AdditionalLightsColor[u_xlati14].xyz;
        u_xlat16_19 = dot(vs_TEXCOORD3.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
        u_xlat16_19 = min(max(u_xlat16_19, 0.0), 1.0);
#else
        u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
#endif
        u_xlat16_3.xyz = u_xlat16_5.xyz * vec3(u_xlat16_19) + u_xlat16_3.xyz;
    }
    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_Surface==1.0);
#else
    u_xlatb2 = _Surface==1.0;
#endif
    SV_Target0.w = (u_xlatb2) ? u_xlat16_0.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Local Keywords { "_EMISSION" "_GLOSSINESS_FROM_BASE_ALPHA" "_SPECULAR_COLOR" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb22 = unity_OrthoParams.w==0.0;
#endif
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
UNITY_LOCATION(1) uniform mediump sampler2D _EmissionMap;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_6;
float u_xlat15;
mediump float u_xlat16_16;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = vs_TEXCOORD4.xyz * u_xlat16_1.xxx + _MainLightPosition.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat15);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = log2(u_xlat0.x);
    u_xlat16_0 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * _BaseColor;
    u_xlat16_6 = u_xlat16_0.w * 10.0 + 1.0;
    u_xlat16_6 = exp2(u_xlat16_6);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_6;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * _SpecColor.xyz;
    u_xlat16_2.xyz = texture(_EmissionMap, vs_TEXCOORD0.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * _EmissionColor.xyz;
    u_xlat16_16 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_16 = min(max(u_xlat16_16, 0.0), 1.0);
#else
    u_xlat16_16 = clamp(u_xlat16_16, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = _MainLightColor.xyz * unity_LightData.zzz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(u_xlat16_16) + vs_TEXCOORD1.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_0.xyz + u_xlat2.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * u_xlat16_1.xyz + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_Surface==1.0);
#else
    u_xlatb2 = _Surface==1.0;
#endif
    SV_Target0.w = (u_xlatb2) ? u_xlat16_0.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Local Keywords { "_EMISSION" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb22 = unity_OrthoParams.w==0.0;
#endif
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
UNITY_LOCATION(1) uniform mediump sampler2D _EmissionMap;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
mediump float u_xlat16_9;
void main()
{
    u_xlat16_0.xyz = _MainLightColor.xyz * unity_LightData.zzz;
    u_xlat16_9 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9 = min(max(u_xlat16_9, 0.0), 1.0);
#else
    u_xlat16_9 = clamp(u_xlat16_9, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(u_xlat16_9) + vs_TEXCOORD1.xyz;
    u_xlat16_1.xyz = texture(_EmissionMap, vs_TEXCOORD0.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * _EmissionColor.xyz;
    u_xlat16_2 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_2 = u_xlat16_2 * _BaseColor;
    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_Surface==1.0);
#else
    u_xlatb1 = _Surface==1.0;
#endif
    SV_Target0.w = (u_xlatb1) ? u_xlat16_2.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Local Keywords { "_GLOSSINESS_FROM_BASE_ALPHA" "_SPECULAR_COLOR" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb22 = unity_OrthoParams.w==0.0;
#endif
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb3;
mediump float u_xlat16_5;
float u_xlat12;
mediump float u_xlat16_13;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = vs_TEXCOORD4.xyz * u_xlat16_1.xxx + _MainLightPosition.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat12);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = log2(u_xlat0.x);
    u_xlat16_0 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * _BaseColor;
    u_xlat16_5 = u_xlat16_0.w * 10.0 + 1.0;
    u_xlat16_5 = exp2(u_xlat16_5);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_5;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * _SpecColor.xyz;
    u_xlat16_2.xyz = _MainLightColor.xyz * unity_LightData.zzz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_13 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13 = min(max(u_xlat16_13, 0.0), 1.0);
#else
    u_xlat16_13 = clamp(u_xlat16_13, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_13) + vs_TEXCOORD1.xyz;
    SV_Target0.xyz = u_xlat16_2.xyz * u_xlat16_0.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_Surface==1.0);
#else
    u_xlatb3 = _Surface==1.0;
#endif
    SV_Target0.w = (u_xlatb3) ? u_xlat16_0.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Local Keywords { "_GLOSSINESS_FROM_BASE_ALPHA" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb22 = unity_OrthoParams.w==0.0;
#endif
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec4 u_xlat16_1;
bool u_xlatb2;
mediump float u_xlat16_9;
void main()
{
    u_xlat16_0.xyz = _MainLightColor.xyz * unity_LightData.zzz;
    u_xlat16_9 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9 = min(max(u_xlat16_9, 0.0), 1.0);
#else
    u_xlat16_9 = clamp(u_xlat16_9, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(u_xlat16_9) + vs_TEXCOORD1.xyz;
    u_xlat16_1 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat16_1 * _BaseColor;
    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_Surface==1.0);
#else
    u_xlatb2 = _Surface==1.0;
#endif
    SV_Target0.w = (u_xlatb2) ? u_xlat16_1.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Local Keywords { "_ALPHAPREMULTIPLY_ON" "_RECEIVE_SHADOWS_OFF" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb22 = unity_OrthoParams.w==0.0;
#endif
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb3;
mediump float u_xlat16_12;
void main()
{
    u_xlat16_0.xyz = _MainLightColor.xyz * unity_LightData.zzz;
    u_xlat16_12 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12 = min(max(u_xlat16_12, 0.0), 1.0);
#else
    u_xlat16_12 = clamp(u_xlat16_12, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(u_xlat16_12) + vs_TEXCOORD1.xyz;
    u_xlat16_1 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat16_1 * _BaseColor;
    u_xlat16_2.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_Surface==1.0);
#else
    u_xlatb3 = _Surface==1.0;
#endif
    SV_Target0.w = (u_xlatb3) ? u_xlat16_1.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Local Keywords { "_ALPHAPREMULTIPLY_ON" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb22 = unity_OrthoParams.w==0.0;
#endif
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb3;
mediump float u_xlat16_12;
void main()
{
    u_xlat16_0.xyz = _MainLightColor.xyz * unity_LightData.zzz;
    u_xlat16_12 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12 = min(max(u_xlat16_12, 0.0), 1.0);
#else
    u_xlat16_12 = clamp(u_xlat16_12, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(u_xlat16_12) + vs_TEXCOORD1.xyz;
    u_xlat16_1 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat16_1 * _BaseColor;
    u_xlat16_2.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_Surface==1.0);
#else
    u_xlatb3 = _Surface==1.0;
#endif
    SV_Target0.w = (u_xlatb3) ? u_xlat16_1.w : 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Local Keywords { "_RECEIVE_SHADOWS_OFF" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb22 = unity_OrthoParams.w==0.0;
#endif
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec4 u_xlat16_1;
bool u_xlatb2;
mediump float u_xlat16_9;
void main()
{
    u_xlat16_0.xyz = _MainLightColor.xyz * unity_LightData.zzz;
    u_xlat16_9 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9 = min(max(u_xlat16_9, 0.0), 1.0);
#else
    u_xlat16_9 = clamp(u_xlat16_9, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(u_xlat16_9) + vs_TEXCOORD1.xyz;
    u_xlat16_1 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat16_1 * _BaseColor;
    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_Surface==1.0);
#else
    u_xlatb2 = _Surface==1.0;
#endif
    SV_Target0.w = (u_xlatb2) ? u_xlat16_1.w : 1.0;
    return;
}

#endif
"
}
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD6;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bvec3 u_xlatb4;
vec3 u_xlat5;
float u_xlat18;
bool u_xlatb22;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat16_1.x = inversesqrt(u_xlat18);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_0.y * u_xlat16_0.y;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_2 = u_xlat16_0.yzzx * u_xlat16_0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_1.xyz = unity_SHC.xyz * u_xlat16_1.xxx + u_xlat16_3.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat16_0);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat16_0);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat16_0);
    vs_TEXCOORD3.xyz = u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb4.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat16_1.xyzx).xyz;
    u_xlat16_1.x = (u_xlatb4.x) ? u_xlat16_3.x : u_xlat16_2.x;
    u_xlat16_1.y = (u_xlatb4.y) ? u_xlat16_3.y : u_xlat16_2.y;
    u_xlat16_1.z = (u_xlatb4.z) ? u_xlat16_3.z : u_xlat16_2.z;
    vs_TEXCOORD1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb22 = unity_OrthoParams.w==0.0;
#endif
    vs_TEXCOORD4.x = (u_xlatb22) ? u_xlat5.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    vs_TEXCOORD4.y = (u_xlatb22) ? u_xlat5.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    vs_TEXCOORD4.z = (u_xlatb22) ? u_xlat5.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	vec4 _MainLightPosition;
uniform 	mediump vec4 _MainLightColor;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec4 u_xlat16_1;
bool u_xlatb2;
mediump float u_xlat16_9;
void main()
{
    u_xlat16_0.xyz = _MainLightColor.xyz * unity_LightData.zzz;
    u_xlat16_9 = dot(vs_TEXCOORD3.xyz, _MainLightPosition.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9 = min(max(u_xlat16_9, 0.0), 1.0);
#else
    u_xlat16_9 = clamp(u_xlat16_9, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(u_xlat16_9) + vs_TEXCOORD1.xyz;
    u_xlat16_1 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat16_1 * _BaseColor;
    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_Surface==1.0);
#else
    u_xlatb2 = _Surface==1.0;
#endif
    SV_Target0.w = (u_xlatb2) ? u_xlat16_1.w : 1.0;
    return;
}

#endif
"
}
}
}
 Pass {
  Name "ShadowCaster"
  LOD 300
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "SHADOWCASTER" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" "ShaderModel" = "2.0" "UniversalMaterialType" = "SimpleLit" }
  ColorMask 0 0
  Cull Off
  GpuProgramID 555409
Program "vp" {
SubProgram "gles " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _BaseMap_ST;
uniform 	vec4 _ShadowBias;
uniform 	vec3 _LightDirection;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat0.xyz = _LightDirection.xyz * _ShadowBias.xxx + u_xlat0.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat16_2 = inversesqrt(u_xlat9);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_2);
    u_xlat9 = dot(_LightDirection.xyz, u_xlat1.xyz);
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat9 = (-u_xlat9) + 1.0;
    u_xlat9 = u_xlat9 * _ShadowBias.y;
    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat9) + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position.z = max((-u_xlat0.w), u_xlat0.z);
    gl_Position.xyw = u_xlat0.xyw;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
#define SV_TARGET0 gl_FragData[0]
void main()
{
    SV_TARGET0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles " {
Local Keywords { "_GLOSSINESS_FROM_BASE_ALPHA" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _BaseMap_ST;
uniform 	vec4 _ShadowBias;
uniform 	vec3 _LightDirection;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat0.xyz = _LightDirection.xyz * _ShadowBias.xxx + u_xlat0.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat16_2 = inversesqrt(u_xlat9);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_2);
    u_xlat9 = dot(_LightDirection.xyz, u_xlat1.xyz);
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat9 = (-u_xlat9) + 1.0;
    u_xlat9 = u_xlat9 * _ShadowBias.y;
    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat9) + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position.z = max((-u_xlat0.w), u_xlat0.z);
    gl_Position.xyw = u_xlat0.xyw;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
#define SV_TARGET0 gl_FragData[0]
void main()
{
    SV_TARGET0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
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
uniform 	vec4 _ShadowBias;
uniform 	vec3 _LightDirection;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat0.xyz = _LightDirection.xyz * _ShadowBias.xxx + u_xlat0.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat16_2 = inversesqrt(u_xlat9);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_2);
    u_xlat9 = dot(_LightDirection.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat9 = (-u_xlat9) + 1.0;
    u_xlat9 = u_xlat9 * _ShadowBias.y;
    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat9) + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position.z = max((-u_xlat0.w), u_xlat0.z);
    gl_Position.xyw = u_xlat0.xyw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_TARGET0;
void main()
{
    SV_TARGET0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 " {
Local Keywords { "_GLOSSINESS_FROM_BASE_ALPHA" }
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
uniform 	vec4 _ShadowBias;
uniform 	vec3 _LightDirection;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat0.xyz = _LightDirection.xyz * _ShadowBias.xxx + u_xlat0.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat16_2 = inversesqrt(u_xlat9);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_2);
    u_xlat9 = dot(_LightDirection.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat9 = (-u_xlat9) + 1.0;
    u_xlat9 = u_xlat9 * _ShadowBias.y;
    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat9) + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position.z = max((-u_xlat0.w), u_xlat0.z);
    gl_Position.xyw = u_xlat0.xyw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_TARGET0;
void main()
{
    SV_TARGET0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
}
}
 Pass {
  Name "DepthOnly"
  LOD 300
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "DepthOnly" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" "ShaderModel" = "2.0" "UniversalMaterialType" = "SimpleLit" }
  ColorMask 0 0
  Cull Off
  GpuProgramID 643677
Program "vp" {
SubProgram "gles " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _BaseMap_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
#define SV_TARGET0 gl_FragData[0]
void main()
{
    SV_TARGET0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles " {
Local Keywords { "_GLOSSINESS_FROM_BASE_ALPHA" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _BaseMap_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
#define SV_TARGET0 gl_FragData[0]
void main()
{
    SV_TARGET0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_TARGET0;
void main()
{
    SV_TARGET0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 " {
Local Keywords { "_GLOSSINESS_FROM_BASE_ALPHA" }
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_TARGET0;
void main()
{
    SV_TARGET0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
}
}
 Pass {
  Name "DepthNormals"
  LOD 300
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "DepthNormals" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" "ShaderModel" = "2.0" "UniversalMaterialType" = "SimpleLit" }
  Cull Off
  GpuProgramID 665017
Program "vp" {
SubProgram "gles " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _BaseMap_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec3 in_NORMAL0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
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
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat16_2.x = inversesqrt(u_xlat9);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xxx;
    u_xlat16_2.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_2.xxx;
    vs_TEXCOORD2.xyz = u_xlat16_2.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
varying highp vec3 vs_TEXCOORD2;
#define SV_TARGET0 gl_FragData[0]
vec3 u_xlat0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_7;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat0.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat0.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat16_1.x = dot(u_xlat0.xyz, vs_TEXCOORD2.xyz);
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat0.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat0.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat16_1.y = dot(u_xlat0.xyz, vs_TEXCOORD2.xyz);
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat0.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat16_1.z = dot(u_xlat0.xyz, vs_TEXCOORD2.xyz);
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlat16_1.x = dot(abs(u_xlat0.xyz), vec3(1.0, 1.0, 1.0));
    u_xlat16_1.xyz = u_xlat0.xyz / u_xlat16_1.xxx;
    u_xlat16_7 = (-u_xlat16_1.x) * 0.5 + 0.5;
    u_xlat16_7 = u_xlat16_1.y * 0.5 + u_xlat16_7;
    u_xlat16_7 = clamp(u_xlat16_7, 0.0, 1.0);
    u_xlatb0 = u_xlat16_1.z>=0.0;
    u_xlat16_1.x = u_xlat16_1.y + u_xlat16_1.x;
    SV_TARGET0.y = u_xlat16_1.x;
    SV_TARGET0.x = (u_xlatb0) ? u_xlat16_7 : (-u_xlat16_7);
    SV_TARGET0.zw = vec2(0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles " {
Local Keywords { "_GLOSSINESS_FROM_BASE_ALPHA" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _BaseMap_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec3 in_NORMAL0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
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
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat16_2.x = inversesqrt(u_xlat9);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xxx;
    u_xlat16_2.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_2.xxx;
    vs_TEXCOORD2.xyz = u_xlat16_2.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
varying highp vec3 vs_TEXCOORD2;
#define SV_TARGET0 gl_FragData[0]
vec3 u_xlat0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_7;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat0.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat0.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat16_1.x = dot(u_xlat0.xyz, vs_TEXCOORD2.xyz);
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat0.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat0.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat16_1.y = dot(u_xlat0.xyz, vs_TEXCOORD2.xyz);
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat0.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat16_1.z = dot(u_xlat0.xyz, vs_TEXCOORD2.xyz);
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlat16_1.x = dot(abs(u_xlat0.xyz), vec3(1.0, 1.0, 1.0));
    u_xlat16_1.xyz = u_xlat0.xyz / u_xlat16_1.xxx;
    u_xlat16_7 = (-u_xlat16_1.x) * 0.5 + 0.5;
    u_xlat16_7 = u_xlat16_1.y * 0.5 + u_xlat16_7;
    u_xlat16_7 = clamp(u_xlat16_7, 0.0, 1.0);
    u_xlatb0 = u_xlat16_1.z>=0.0;
    u_xlat16_1.x = u_xlat16_1.y + u_xlat16_1.x;
    SV_TARGET0.y = u_xlat16_1.x;
    SV_TARGET0.x = (u_xlatb0) ? u_xlat16_7 : (-u_xlat16_7);
    SV_TARGET0.zw = vec2(0.0, 0.0);
    return;
}

#endif
"
}
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
out highp vec2 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
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
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat16_2.x = inversesqrt(u_xlat9);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xxx;
    u_xlat16_2.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_2.xxx;
    vs_TEXCOORD2.xyz = u_xlat16_2.xyz;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out highp vec4 SV_TARGET0;
vec3 u_xlat0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_7;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat0.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat0.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat16_1.x = dot(u_xlat0.xyz, vs_TEXCOORD2.xyz);
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat0.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat0.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat16_1.y = dot(u_xlat0.xyz, vs_TEXCOORD2.xyz);
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat0.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat16_1.z = dot(u_xlat0.xyz, vs_TEXCOORD2.xyz);
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlat16_1.x = dot(abs(u_xlat0.xyz), vec3(1.0, 1.0, 1.0));
    u_xlat16_1.x = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_7 = (-u_xlat16_1.x) * 0.5 + 0.5;
    u_xlat16_7 = u_xlat16_1.y * 0.5 + u_xlat16_7;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7 = min(max(u_xlat16_7, 0.0), 1.0);
#else
    u_xlat16_7 = clamp(u_xlat16_7, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1.z>=0.0);
#else
    u_xlatb0 = u_xlat16_1.z>=0.0;
#endif
    u_xlat16_1.x = u_xlat16_1.y + u_xlat16_1.x;
    SV_TARGET0.y = u_xlat16_1.x;
    SV_TARGET0.x = (u_xlatb0) ? u_xlat16_7 : (-u_xlat16_7);
    SV_TARGET0.zw = vec2(0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 " {
Local Keywords { "_GLOSSINESS_FROM_BASE_ALPHA" }
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
out highp vec2 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
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
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat16_2.x = inversesqrt(u_xlat9);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xxx;
    u_xlat16_2.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_2.xxx;
    vs_TEXCOORD2.xyz = u_xlat16_2.xyz;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out highp vec4 SV_TARGET0;
vec3 u_xlat0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_7;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat0.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat0.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat16_1.x = dot(u_xlat0.xyz, vs_TEXCOORD2.xyz);
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat0.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat0.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat16_1.y = dot(u_xlat0.xyz, vs_TEXCOORD2.xyz);
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat0.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat16_1.z = dot(u_xlat0.xyz, vs_TEXCOORD2.xyz);
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlat16_1.x = dot(abs(u_xlat0.xyz), vec3(1.0, 1.0, 1.0));
    u_xlat16_1.x = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_7 = (-u_xlat16_1.x) * 0.5 + 0.5;
    u_xlat16_7 = u_xlat16_1.y * 0.5 + u_xlat16_7;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7 = min(max(u_xlat16_7, 0.0), 1.0);
#else
    u_xlat16_7 = clamp(u_xlat16_7, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1.z>=0.0);
#else
    u_xlatb0 = u_xlat16_1.z>=0.0;
#endif
    u_xlat16_1.x = u_xlat16_1.y + u_xlat16_1.x;
    SV_TARGET0.y = u_xlat16_1.x;
    SV_TARGET0.x = (u_xlatb0) ? u_xlat16_7 : (-u_xlat16_7);
    SV_TARGET0.zw = vec2(0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "INSTANCING_ON" }
"#ifdef VERTEX
#version 300 es
#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
	#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
#endif

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
uniform 	int unity_BaseInstanceID;
struct unity_Builtins0Array_Type {
	vec4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
	vec4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
};
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityInstancing_PerDraw0 {
#endif
	UNITY_UNIFORM unity_Builtins0Array_Type unity_Builtins0Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
out highp vec2 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
flat out highp uint vs_SV_InstanceID0;
vec3 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
void main()
{
    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
    u_xlati0 = int(u_xlati0 << 3);
    u_xlat1 = in_POSITION0.yyyy * unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
    u_xlat1 = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat16_3.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat1.xyz * u_xlat16_3.xxx;
    u_xlat16_3.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_3.xyz = u_xlat0.xyz * u_xlat16_3.xxx;
    vs_TEXCOORD2.xyz = u_xlat16_3.xyz;
    vs_SV_InstanceID0 = uint(0u);
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out highp vec4 SV_TARGET0;
vec3 u_xlat0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_7;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat0.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat0.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat16_1.x = dot(u_xlat0.xyz, vs_TEXCOORD2.xyz);
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat0.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat0.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat16_1.y = dot(u_xlat0.xyz, vs_TEXCOORD2.xyz);
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat0.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat16_1.z = dot(u_xlat0.xyz, vs_TEXCOORD2.xyz);
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlat16_1.x = dot(abs(u_xlat0.xyz), vec3(1.0, 1.0, 1.0));
    u_xlat16_1.x = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_7 = (-u_xlat16_1.x) * 0.5 + 0.5;
    u_xlat16_7 = u_xlat16_1.y * 0.5 + u_xlat16_7;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7 = min(max(u_xlat16_7, 0.0), 1.0);
#else
    u_xlat16_7 = clamp(u_xlat16_7, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1.z>=0.0);
#else
    u_xlatb0 = u_xlat16_1.z>=0.0;
#endif
    u_xlat16_1.x = u_xlat16_1.y + u_xlat16_1.x;
    SV_TARGET0.y = u_xlat16_1.x;
    SV_TARGET0.x = (u_xlatb0) ? u_xlat16_7 : (-u_xlat16_7);
    SV_TARGET0.zw = vec2(0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "INSTANCING_ON" }
Local Keywords { "_GLOSSINESS_FROM_BASE_ALPHA" }
"#ifdef VERTEX
#version 300 es
#ifndef UNITY_RUNTIME_INSTANCING_ARRAY_SIZE
	#define UNITY_RUNTIME_INSTANCING_ARRAY_SIZE 2
#endif

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
uniform 	int unity_BaseInstanceID;
struct unity_Builtins0Array_Type {
	vec4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
	vec4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
};
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityInstancing_PerDraw0 {
#endif
	UNITY_UNIFORM unity_Builtins0Array_Type unity_Builtins0Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
out highp vec2 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
flat out highp uint vs_SV_InstanceID0;
vec3 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
void main()
{
    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
    u_xlati0 = int(u_xlati0 << 3);
    u_xlat1 = in_POSITION0.yyyy * unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1];
    u_xlat1 = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat16_3.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat1.xyz * u_xlat16_3.xxx;
    u_xlat16_3.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_3.xyz = u_xlat0.xyz * u_xlat16_3.xxx;
    vs_TEXCOORD2.xyz = u_xlat16_3.xyz;
    vs_SV_InstanceID0 = uint(0u);
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out highp vec4 SV_TARGET0;
vec3 u_xlat0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_7;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat0.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat0.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat16_1.x = dot(u_xlat0.xyz, vs_TEXCOORD2.xyz);
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat0.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat0.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat16_1.y = dot(u_xlat0.xyz, vs_TEXCOORD2.xyz);
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat0.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat16_1.z = dot(u_xlat0.xyz, vs_TEXCOORD2.xyz);
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlat16_1.x = dot(abs(u_xlat0.xyz), vec3(1.0, 1.0, 1.0));
    u_xlat16_1.x = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_7 = (-u_xlat16_1.x) * 0.5 + 0.5;
    u_xlat16_7 = u_xlat16_1.y * 0.5 + u_xlat16_7;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7 = min(max(u_xlat16_7, 0.0), 1.0);
#else
    u_xlat16_7 = clamp(u_xlat16_7, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1.z>=0.0);
#else
    u_xlatb0 = u_xlat16_1.z>=0.0;
#endif
    u_xlat16_1.x = u_xlat16_1.y + u_xlat16_1.x;
    SV_TARGET0.y = u_xlat16_1.x;
    SV_TARGET0.x = (u_xlatb0) ? u_xlat16_7 : (-u_xlat16_7);
    SV_TARGET0.zw = vec2(0.0, 0.0);
    return;
}

#endif
"
}
}
}
 Pass {
  Name "Universal2D"
  LOD 300
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "Universal2D" "QUEUE" = "Transparent" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Transparent" "ShaderModel" = "2.0" "UniversalMaterialType" = "SimpleLit" }
  GpuProgramID 838492
Program "vp" {
SubProgram "gles " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _BaseMap_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 _BaseColor;
uniform lowp sampler2D _BaseMap;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture2D(_BaseMap, vs_TEXCOORD0.xy);
    SV_Target0 = u_xlat10_0 * _BaseColor;
    return;
}

#endif
"
}
SubProgram "gles " {
Local Keywords { "_ALPHAPREMULTIPLY_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _BaseMap_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 _BaseColor;
uniform lowp sampler2D _BaseMap;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture2D(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _BaseColor;
    SV_Target0.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
    return;
}

#endif
"
}
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
UNITY_BINDING(1) uniform UnityPerDraw {
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_BaseMap, vs_TEXCOORD0.xy);
    SV_Target0 = u_xlat16_0 * _BaseColor;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Local Keywords { "_ALPHAPREMULTIPLY_ON" }
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
UNITY_BINDING(1) uniform UnityPerDraw {
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _SpecColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * _BaseColor;
    SV_Target0.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
    return;
}

#endif
"
}
}
}
}
Fallback "Hidden/Universal Render Pipeline/FallbackError"
CustomEditor "UnityEditor.Rendering.Universal.ShaderGUI.SimpleLitShader"
}