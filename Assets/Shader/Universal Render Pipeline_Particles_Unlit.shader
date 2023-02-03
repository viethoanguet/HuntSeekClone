//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Universal Render Pipeline/Particles/Unlit" {
Properties {
_BaseMap ("Base Map", 2D) = "white" { }
_BaseColor ("Base Color", Color) = (1,1,1,1)
_Cutoff ("Alpha Cutoff", Range(0, 1)) = 0.5
_BumpMap ("Normal Map", 2D) = "bump" { }
_EmissionColor ("Color", Color) = (0,0,0,1)
_EmissionMap ("Emission", 2D) = "white" { }
_SoftParticlesNearFadeDistance ("Soft Particles Near Fade", Float) = 0
_SoftParticlesFarFadeDistance ("Soft Particles Far Fade", Float) = 1
_CameraNearFadeDistance ("Camera Near Fade", Float) = 1
_CameraFarFadeDistance ("Camera Far Fade", Float) = 2
_DistortionBlend ("Distortion Blend", Float) = 0.5
_DistortionStrength ("Distortion Strength", Float) = 1
_Surface ("__surface", Float) = 0
_Blend ("__mode", Float) = 0
_AlphaClip ("__clip", Float) = 0
_BlendOp ("__blendop", Float) = 0
_SrcBlend ("__src", Float) = 1
_DstBlend ("__dst", Float) = 0
_ZWrite ("__zw", Float) = 1
_Cull ("__cull", Float) = 2
_ColorMode ("_ColorMode", Float) = 0
_BaseColorAddSubDiff ("_ColorMode", Vector) = (0,0,0,0)
[ToggleOff] _FlipbookBlending ("__flipbookblending", Float) = 0
_SoftParticlesEnabled ("__softparticlesenabled", Float) = 0
_CameraFadingEnabled ("__camerafadingenabled", Float) = 0
_SoftParticleFadeParams ("__softparticlefadeparams", Vector) = (0,0,0,0)
_CameraFadeParams ("__camerafadeparams", Vector) = (0,0,0,0)
_DistortionEnabled ("__distortionenabled", Float) = 0
_DistortionStrengthScaled ("Distortion Strength Scaled", Float) = 0.1
_QueueOffset ("Queue offset", Float) = 0
_FlipbookMode ("flipbook", Float) = 0
_Mode ("mode", Float) = 0
_Color ("color", Color) = (1,1,1,1)
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "PerformanceChecks" = "False" "PreviewType" = "Plane" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" }
 Pass {
  Name "ForwardLit"
  Tags { "IGNOREPROJECTOR" = "true" "PerformanceChecks" = "False" "PreviewType" = "Plane" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" }
  Blend Zero Zero, Zero Zero
  ColorMask RGB 0
  ZWrite Off
  Cull Off
  GpuProgramID 60128
Program "vp" {
SubProgram "gles " {
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec3 in_NORMAL0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD8;
vec3 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat16_2 = inversesqrt(u_xlat9);
    vs_TEXCOORD2.xyz = u_xlat1.xyz * vec3(u_xlat16_2);
    u_xlatb9 = unity_OrthoParams.w==0.0;
    u_xlat1.x = (u_xlatb9) ? u_xlat0.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = (u_xlatb9) ? u_xlat0.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = (u_xlatb9) ? u_xlat0.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat16_2 = inversesqrt(u_xlat0.x);
    vs_TEXCOORD3.xyz = u_xlat1.xyz * vec3(u_xlat16_2);
    vs_TEXCOORD8.xyz = vec3(0.0, 0.0, 0.0);
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
uniform 	mediump float _Surface;
uniform lowp sampler2D _BaseMap;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
bool u_xlatb1;
void main()
{
    u_xlat10_0 = texture2D(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _BaseColor;
    u_xlat0 = u_xlat16_0 * vs_COLOR0;
    u_xlatb1 = _Surface==1.0;
    SV_Target0.w = (u_xlatb1) ? u_xlat0.w : 1.0;
    SV_Target0.xyz = u_xlat0.xyz;
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
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
out highp vec2 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD8;
vec3 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat16_2 = inversesqrt(u_xlat9);
    vs_TEXCOORD2.xyz = u_xlat1.xyz * vec3(u_xlat16_2);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb9 = unity_OrthoParams.w==0.0;
#endif
    u_xlat1.x = (u_xlatb9) ? u_xlat0.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = (u_xlatb9) ? u_xlat0.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = (u_xlatb9) ? u_xlat0.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat16_2 = inversesqrt(u_xlat0.x);
    vs_TEXCOORD3.xyz = u_xlat1.xyz * vec3(u_xlat16_2);
    vs_TEXCOORD8.xyz = vec3(0.0, 0.0, 0.0);
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
	UNITY_UNIFORM vec4 _SoftParticleFadeParams;
	UNITY_UNIFORM vec4 _CameraFadeParams;
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump vec4 _BaseColorAddSubDiff;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _DistortionStrengthScaled;
	UNITY_UNIFORM mediump float _DistortionBlend;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb1;
void main()
{
    u_xlat16_0 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * _BaseColor;
    u_xlat0 = u_xlat16_0 * vs_COLOR0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_Surface==1.0);
#else
    u_xlatb1 = _Surface==1.0;
#endif
    SV_Target0.w = (u_xlatb1) ? u_xlat0.w : 1.0;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles " {
Local Keywords { "_FADING_ON" "_SOFTPARTICLES_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec3 in_NORMAL0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD6;
varying highp vec3 vs_TEXCOORD8;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump float u_xlat16_3;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat16_3 = inversesqrt(u_xlat12);
    vs_TEXCOORD2.xyz = u_xlat2.xyz * vec3(u_xlat16_3);
    u_xlatb12 = unity_OrthoParams.w==0.0;
    u_xlat2.x = (u_xlatb12) ? u_xlat0.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = (u_xlatb12) ? u_xlat0.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = (u_xlatb12) ? u_xlat0.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat16_3 = inversesqrt(u_xlat0.x);
    vs_TEXCOORD3.xyz = u_xlat2.xyz * vec3(u_xlat16_3);
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
    vs_TEXCOORD8.xyz = vec3(0.0, 0.0, 0.0);
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
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 _SoftParticleFadeParams;
uniform 	vec4 _CameraFadeParams;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump float _Surface;
uniform lowp sampler2D _BaseMap;
uniform highp sampler2D _CameraDepthTexture;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
bvec2 u_xlatb1;
mediump float u_xlat16_2;
float u_xlat4;
void main()
{
    u_xlat10_0 = texture2D(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _BaseColor;
    u_xlat0 = u_xlat16_0 * vs_COLOR0;
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), _SoftParticleFadeParams.xyxx).xy;
    u_xlatb1.x = u_xlatb1.y || u_xlatb1.x;
    if(u_xlatb1.x){
        u_xlat1.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
        u_xlat1.x = texture2D(_CameraDepthTexture, u_xlat1.xy).x;
        u_xlat1.x = _ZBufferParams.z * u_xlat1.x + _ZBufferParams.w;
        u_xlat1.x = float(1.0) / u_xlat1.x;
        u_xlat4 = vs_TEXCOORD1.y * hlslcc_mtx4x4unity_MatrixV[1].z;
        u_xlat4 = hlslcc_mtx4x4unity_MatrixV[0].z * vs_TEXCOORD1.x + u_xlat4;
        u_xlat4 = hlslcc_mtx4x4unity_MatrixV[2].z * vs_TEXCOORD1.z + u_xlat4;
        u_xlat4 = u_xlat4 + hlslcc_mtx4x4unity_MatrixV[3].z;
        u_xlat1.x = u_xlat1.x + (-_SoftParticleFadeParams.x);
        u_xlat1.x = -abs(u_xlat4) + u_xlat1.x;
        u_xlat1.x = u_xlat1.x * _SoftParticleFadeParams.y;
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    } else {
        u_xlat1.x = 1.0;
    }
    u_xlat1.y = 1.0;
    u_xlat16_0 = u_xlat0 * u_xlat1.yyyx;
    u_xlat1.x = vs_TEXCOORD6.z / vs_TEXCOORD6.w;
    u_xlat1.x = _ZBufferParams.z * u_xlat1.x + _ZBufferParams.w;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x + (-_CameraFadeParams.x);
    u_xlat1.x = u_xlat1.x * _CameraFadeParams.y;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat16_2 = u_xlat16_0.w * u_xlat1.x;
    u_xlatb1.x = _Surface==1.0;
    SV_Target0.w = (u_xlatb1.x) ? u_xlat16_2 : 1.0;
    SV_Target0.xyz = u_xlat16_0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Local Keywords { "_FADING_ON" "_SOFTPARTICLES_ON" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
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
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
out highp vec2 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD8;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump float u_xlat16_3;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat16_3 = inversesqrt(u_xlat12);
    vs_TEXCOORD2.xyz = u_xlat2.xyz * vec3(u_xlat16_3);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb12 = unity_OrthoParams.w==0.0;
#endif
    u_xlat2.x = (u_xlatb12) ? u_xlat0.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = (u_xlatb12) ? u_xlat0.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = (u_xlatb12) ? u_xlat0.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat16_3 = inversesqrt(u_xlat0.x);
    vs_TEXCOORD3.xyz = u_xlat2.xyz * vec3(u_xlat16_3);
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
    vs_TEXCOORD8.xyz = vec3(0.0, 0.0, 0.0);
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _SoftParticleFadeParams;
	UNITY_UNIFORM vec4 _CameraFadeParams;
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump vec4 _BaseColorAddSubDiff;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _DistortionStrengthScaled;
	UNITY_UNIFORM mediump float _DistortionBlend;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
UNITY_LOCATION(1) uniform highp sampler2D _CameraDepthTexture;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
bvec2 u_xlatb1;
mediump float u_xlat16_2;
float u_xlat4;
void main()
{
    u_xlat16_0 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * _BaseColor;
    u_xlat0 = u_xlat16_0 * vs_COLOR0;
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), _SoftParticleFadeParams.xyxx).xy;
    u_xlatb1.x = u_xlatb1.y || u_xlatb1.x;
    if(u_xlatb1.x){
        u_xlat1.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
        u_xlat1.x = texture(_CameraDepthTexture, u_xlat1.xy).x;
        u_xlat1.x = _ZBufferParams.z * u_xlat1.x + _ZBufferParams.w;
        u_xlat1.x = float(1.0) / u_xlat1.x;
        u_xlat4 = vs_TEXCOORD1.y * hlslcc_mtx4x4unity_MatrixV[1].z;
        u_xlat4 = hlslcc_mtx4x4unity_MatrixV[0].z * vs_TEXCOORD1.x + u_xlat4;
        u_xlat4 = hlslcc_mtx4x4unity_MatrixV[2].z * vs_TEXCOORD1.z + u_xlat4;
        u_xlat4 = u_xlat4 + hlslcc_mtx4x4unity_MatrixV[3].z;
        u_xlat1.x = u_xlat1.x + (-_SoftParticleFadeParams.x);
        u_xlat1.x = -abs(u_xlat4) + u_xlat1.x;
        u_xlat1.x = u_xlat1.x * _SoftParticleFadeParams.y;
#ifdef UNITY_ADRENO_ES3
        u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    } else {
        u_xlat1.x = 1.0;
    }
    u_xlat1.y = 1.0;
    u_xlat16_0 = u_xlat0 * u_xlat1.yyyx;
    u_xlat1.x = vs_TEXCOORD6.z / vs_TEXCOORD6.w;
    u_xlat1.x = _ZBufferParams.z * u_xlat1.x + _ZBufferParams.w;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x + (-_CameraFadeParams.x);
    u_xlat1.x = u_xlat1.x * _CameraFadeParams.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_2 = u_xlat16_0.w * u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(_Surface==1.0);
#else
    u_xlatb1.x = _Surface==1.0;
#endif
    SV_Target0.w = (u_xlatb1.x) ? u_xlat16_2 : 1.0;
    SV_Target0.xyz = u_xlat16_0.xyz;
    return;
}

#endif
"
}
SubProgram "gles " {
Local Keywords { "_DISTORTION_ON" "_FADING_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec3 in_NORMAL0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD6;
varying highp vec3 vs_TEXCOORD8;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump float u_xlat16_3;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat16_3 = inversesqrt(u_xlat12);
    vs_TEXCOORD2.xyz = u_xlat2.xyz * vec3(u_xlat16_3);
    u_xlatb12 = unity_OrthoParams.w==0.0;
    u_xlat2.x = (u_xlatb12) ? u_xlat0.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = (u_xlatb12) ? u_xlat0.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = (u_xlatb12) ? u_xlat0.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat16_3 = inversesqrt(u_xlat0.x);
    vs_TEXCOORD3.xyz = u_xlat2.xyz * vec3(u_xlat16_3);
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
    vs_TEXCOORD8.xyz = vec3(0.0, 0.0, 0.0);
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
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _CameraFadeParams;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump float _DistortionBlend;
uniform 	mediump float _Surface;
uniform lowp sampler2D _BaseMap;
uniform lowp sampler2D _CameraOpaqueTexture;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
float u_xlat2;
float u_xlat3;
mediump float u_xlat16_4;
lowp vec3 u_xlat10_5;
vec3 u_xlat7;
void main()
{
    u_xlat0.xyz = vs_TEXCOORD6.zxy / vs_TEXCOORD6.www;
    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat10_5.xyz = texture2D(_CameraOpaqueTexture, u_xlat0.yz).xyz;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-_CameraFadeParams.x);
    u_xlat0.x = u_xlat0.x * _CameraFadeParams.y;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat10_1 = texture2D(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat10_1 * _BaseColor;
    u_xlat2 = u_xlat16_1.w * vs_COLOR0.w;
    u_xlat7.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz + (-u_xlat10_5.xyz);
    u_xlat3 = u_xlat2 * u_xlat0.x + (-_DistortionBlend);
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
    u_xlat16_4 = u_xlat0.x * u_xlat2;
    u_xlat0.xyz = vec3(u_xlat3) * u_xlat7.xyz + u_xlat10_5.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    u_xlatb0 = _Surface==1.0;
    SV_Target0.w = (u_xlatb0) ? u_xlat16_4 : 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Local Keywords { "_DISTORTION_ON" "_FADING_ON" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
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
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
out highp vec2 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD8;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump float u_xlat16_3;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat16_3 = inversesqrt(u_xlat12);
    vs_TEXCOORD2.xyz = u_xlat2.xyz * vec3(u_xlat16_3);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb12 = unity_OrthoParams.w==0.0;
#endif
    u_xlat2.x = (u_xlatb12) ? u_xlat0.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = (u_xlatb12) ? u_xlat0.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = (u_xlatb12) ? u_xlat0.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat16_3 = inversesqrt(u_xlat0.x);
    vs_TEXCOORD3.xyz = u_xlat2.xyz * vec3(u_xlat16_3);
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
    vs_TEXCOORD8.xyz = vec3(0.0, 0.0, 0.0);
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _SoftParticleFadeParams;
	UNITY_UNIFORM vec4 _CameraFadeParams;
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump vec4 _BaseColorAddSubDiff;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _DistortionStrengthScaled;
	UNITY_UNIFORM mediump float _DistortionBlend;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
UNITY_LOCATION(1) uniform mediump sampler2D _CameraOpaqueTexture;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
float u_xlat2;
float u_xlat3;
mediump float u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat7;
void main()
{
    u_xlat0.xyz = vs_TEXCOORD6.zxy / vs_TEXCOORD6.www;
    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat16_5.xyz = texture(_CameraOpaqueTexture, u_xlat0.yz).xyz;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-_CameraFadeParams.x);
    u_xlat0.x = u_xlat0.x * _CameraFadeParams.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_1 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat16_1 * _BaseColor;
    u_xlat2 = u_xlat16_1.w * vs_COLOR0.w;
    u_xlat7.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz + (-u_xlat16_5.xyz);
    u_xlat3 = u_xlat2 * u_xlat0.x + (-_DistortionBlend);
#ifdef UNITY_ADRENO_ES3
    u_xlat3 = min(max(u_xlat3, 0.0), 1.0);
#else
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
#endif
    u_xlat16_4 = u_xlat0.x * u_xlat2;
    u_xlat0.xyz = vec3(u_xlat3) * u_xlat7.xyz + u_xlat16_5.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_Surface==1.0);
#else
    u_xlatb0 = _Surface==1.0;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_4 : 1.0;
    return;
}

#endif
"
}
SubProgram "gles " {
Local Keywords { "_EMISSION" "_FADING_ON" "_SOFTPARTICLES_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec3 in_NORMAL0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD6;
varying highp vec3 vs_TEXCOORD8;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump float u_xlat16_3;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat16_3 = inversesqrt(u_xlat12);
    vs_TEXCOORD2.xyz = u_xlat2.xyz * vec3(u_xlat16_3);
    u_xlatb12 = unity_OrthoParams.w==0.0;
    u_xlat2.x = (u_xlatb12) ? u_xlat0.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = (u_xlatb12) ? u_xlat0.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = (u_xlatb12) ? u_xlat0.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat16_3 = inversesqrt(u_xlat0.x);
    vs_TEXCOORD3.xyz = u_xlat2.xyz * vec3(u_xlat16_3);
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
    vs_TEXCOORD8.xyz = vec3(0.0, 0.0, 0.0);
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
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 _SoftParticleFadeParams;
uniform 	vec4 _CameraFadeParams;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump float _Surface;
uniform lowp sampler2D _BaseMap;
uniform highp sampler2D _CameraDepthTexture;
uniform lowp sampler2D _EmissionMap;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
lowp vec3 u_xlat10_1;
bvec2 u_xlatb1;
mediump float u_xlat16_2;
float u_xlat4;
void main()
{
    u_xlat10_0 = texture2D(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _BaseColor;
    u_xlat0 = u_xlat16_0 * vs_COLOR0;
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), _SoftParticleFadeParams.xyxx).xy;
    u_xlatb1.x = u_xlatb1.y || u_xlatb1.x;
    if(u_xlatb1.x){
        u_xlat1.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
        u_xlat1.x = texture2D(_CameraDepthTexture, u_xlat1.xy).x;
        u_xlat1.x = _ZBufferParams.z * u_xlat1.x + _ZBufferParams.w;
        u_xlat1.x = float(1.0) / u_xlat1.x;
        u_xlat4 = vs_TEXCOORD1.y * hlslcc_mtx4x4unity_MatrixV[1].z;
        u_xlat4 = hlslcc_mtx4x4unity_MatrixV[0].z * vs_TEXCOORD1.x + u_xlat4;
        u_xlat4 = hlslcc_mtx4x4unity_MatrixV[2].z * vs_TEXCOORD1.z + u_xlat4;
        u_xlat4 = u_xlat4 + hlslcc_mtx4x4unity_MatrixV[3].z;
        u_xlat1.x = u_xlat1.x + (-_SoftParticleFadeParams.x);
        u_xlat1.x = -abs(u_xlat4) + u_xlat1.x;
        u_xlat1.x = u_xlat1.x * _SoftParticleFadeParams.y;
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    } else {
        u_xlat1.x = 1.0;
    }
    u_xlat1.y = 1.0;
    u_xlat16_0 = u_xlat0 * u_xlat1.yyyx;
    u_xlat1.x = vs_TEXCOORD6.z / vs_TEXCOORD6.w;
    u_xlat1.x = _ZBufferParams.z * u_xlat1.x + _ZBufferParams.w;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x + (-_CameraFadeParams.x);
    u_xlat1.x = u_xlat1.x * _CameraFadeParams.y;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat16_2 = u_xlat16_0.w * u_xlat1.x;
    u_xlat10_1.xyz = texture2D(_EmissionMap, vs_TEXCOORD0.xy).xyz;
    SV_Target0.xyz = u_xlat10_1.xyz * _EmissionColor.xyz + u_xlat16_0.xyz;
    u_xlatb1.x = _Surface==1.0;
    SV_Target0.w = (u_xlatb1.x) ? u_xlat16_2 : 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Local Keywords { "_EMISSION" "_FADING_ON" "_SOFTPARTICLES_ON" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
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
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
out highp vec2 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD8;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump float u_xlat16_3;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat16_3 = inversesqrt(u_xlat12);
    vs_TEXCOORD2.xyz = u_xlat2.xyz * vec3(u_xlat16_3);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb12 = unity_OrthoParams.w==0.0;
#endif
    u_xlat2.x = (u_xlatb12) ? u_xlat0.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = (u_xlatb12) ? u_xlat0.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = (u_xlatb12) ? u_xlat0.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat16_3 = inversesqrt(u_xlat0.x);
    vs_TEXCOORD3.xyz = u_xlat2.xyz * vec3(u_xlat16_3);
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
    vs_TEXCOORD8.xyz = vec3(0.0, 0.0, 0.0);
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _SoftParticleFadeParams;
	UNITY_UNIFORM vec4 _CameraFadeParams;
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump vec4 _BaseColorAddSubDiff;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _DistortionStrengthScaled;
	UNITY_UNIFORM mediump float _DistortionBlend;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
UNITY_LOCATION(1) uniform mediump sampler2D _EmissionMap;
UNITY_LOCATION(2) uniform highp sampler2D _CameraDepthTexture;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump vec3 u_xlat16_1;
bvec2 u_xlatb1;
mediump float u_xlat16_2;
float u_xlat4;
void main()
{
    u_xlat16_0 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * _BaseColor;
    u_xlat0 = u_xlat16_0 * vs_COLOR0;
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), _SoftParticleFadeParams.xyxx).xy;
    u_xlatb1.x = u_xlatb1.y || u_xlatb1.x;
    if(u_xlatb1.x){
        u_xlat1.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
        u_xlat1.x = texture(_CameraDepthTexture, u_xlat1.xy).x;
        u_xlat1.x = _ZBufferParams.z * u_xlat1.x + _ZBufferParams.w;
        u_xlat1.x = float(1.0) / u_xlat1.x;
        u_xlat4 = vs_TEXCOORD1.y * hlslcc_mtx4x4unity_MatrixV[1].z;
        u_xlat4 = hlslcc_mtx4x4unity_MatrixV[0].z * vs_TEXCOORD1.x + u_xlat4;
        u_xlat4 = hlslcc_mtx4x4unity_MatrixV[2].z * vs_TEXCOORD1.z + u_xlat4;
        u_xlat4 = u_xlat4 + hlslcc_mtx4x4unity_MatrixV[3].z;
        u_xlat1.x = u_xlat1.x + (-_SoftParticleFadeParams.x);
        u_xlat1.x = -abs(u_xlat4) + u_xlat1.x;
        u_xlat1.x = u_xlat1.x * _SoftParticleFadeParams.y;
#ifdef UNITY_ADRENO_ES3
        u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    } else {
        u_xlat1.x = 1.0;
    }
    u_xlat1.y = 1.0;
    u_xlat16_0 = u_xlat0 * u_xlat1.yyyx;
    u_xlat1.x = vs_TEXCOORD6.z / vs_TEXCOORD6.w;
    u_xlat1.x = _ZBufferParams.z * u_xlat1.x + _ZBufferParams.w;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x + (-_CameraFadeParams.x);
    u_xlat1.x = u_xlat1.x * _CameraFadeParams.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_2 = u_xlat16_0.w * u_xlat1.x;
    u_xlat16_1.xyz = texture(_EmissionMap, vs_TEXCOORD0.xy).xyz;
    SV_Target0.xyz = u_xlat16_1.xyz * _EmissionColor.xyz + u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(_Surface==1.0);
#else
    u_xlatb1.x = _Surface==1.0;
#endif
    SV_Target0.w = (u_xlatb1.x) ? u_xlat16_2 : 1.0;
    return;
}

#endif
"
}
SubProgram "gles " {
Local Keywords { "_ALPHAPREMULTIPLY_ON" "_DISTORTION_ON" "_FADING_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec3 in_NORMAL0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD6;
varying highp vec3 vs_TEXCOORD8;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump float u_xlat16_3;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat16_3 = inversesqrt(u_xlat12);
    vs_TEXCOORD2.xyz = u_xlat2.xyz * vec3(u_xlat16_3);
    u_xlatb12 = unity_OrthoParams.w==0.0;
    u_xlat2.x = (u_xlatb12) ? u_xlat0.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = (u_xlatb12) ? u_xlat0.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = (u_xlatb12) ? u_xlat0.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat16_3 = inversesqrt(u_xlat0.x);
    vs_TEXCOORD3.xyz = u_xlat2.xyz * vec3(u_xlat16_3);
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
    vs_TEXCOORD8.xyz = vec3(0.0, 0.0, 0.0);
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
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _CameraFadeParams;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump float _DistortionBlend;
uniform 	mediump float _Surface;
uniform lowp sampler2D _BaseMap;
uniform lowp sampler2D _CameraOpaqueTexture;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
lowp vec3 u_xlat10_6;
float u_xlat15;
void main()
{
    u_xlat10_0 = texture2D(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _BaseColor;
    u_xlat0 = u_xlat16_0 * vs_COLOR0;
    u_xlat16_1.xyz = u_xlat0.www * u_xlat0.xyz;
    u_xlat2.xyz = vs_TEXCOORD6.zxy / vs_TEXCOORD6.www;
    u_xlat2.x = _ZBufferParams.z * u_xlat2.x + _ZBufferParams.w;
    u_xlat10_6.xyz = texture2D(_CameraOpaqueTexture, u_xlat2.yz).xyz;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat2.x = u_xlat2.x + (-_CameraFadeParams.x);
    u_xlat2.x = u_xlat2.x * _CameraFadeParams.y;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat3.xyz = u_xlat16_1.xyz * u_xlat2.xxx + (-u_xlat10_6.xyz);
    u_xlat15 = u_xlat0.w * u_xlat2.x + (-_DistortionBlend);
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat16_1.x = u_xlat0.w * u_xlat2.x;
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat3.xyz + u_xlat10_6.xyz;
    SV_Target0.xyz = u_xlat2.xyz;
    u_xlatb2 = _Surface==1.0;
    SV_Target0.w = (u_xlatb2) ? u_xlat16_1.x : 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Local Keywords { "_ALPHAPREMULTIPLY_ON" "_DISTORTION_ON" "_FADING_ON" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
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
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
out highp vec2 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD8;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump float u_xlat16_3;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat16_3 = inversesqrt(u_xlat12);
    vs_TEXCOORD2.xyz = u_xlat2.xyz * vec3(u_xlat16_3);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb12 = unity_OrthoParams.w==0.0;
#endif
    u_xlat2.x = (u_xlatb12) ? u_xlat0.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = (u_xlatb12) ? u_xlat0.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = (u_xlatb12) ? u_xlat0.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat16_3 = inversesqrt(u_xlat0.x);
    vs_TEXCOORD3.xyz = u_xlat2.xyz * vec3(u_xlat16_3);
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
    vs_TEXCOORD8.xyz = vec3(0.0, 0.0, 0.0);
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _SoftParticleFadeParams;
	UNITY_UNIFORM vec4 _CameraFadeParams;
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump vec4 _BaseColorAddSubDiff;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _DistortionStrengthScaled;
	UNITY_UNIFORM mediump float _DistortionBlend;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
UNITY_LOCATION(1) uniform mediump sampler2D _CameraOpaqueTexture;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
mediump vec3 u_xlat16_6;
float u_xlat15;
void main()
{
    u_xlat16_0 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * _BaseColor;
    u_xlat0 = u_xlat16_0 * vs_COLOR0;
    u_xlat16_1.xyz = u_xlat0.www * u_xlat0.xyz;
    u_xlat2.xyz = vs_TEXCOORD6.zxy / vs_TEXCOORD6.www;
    u_xlat2.x = _ZBufferParams.z * u_xlat2.x + _ZBufferParams.w;
    u_xlat16_6.xyz = texture(_CameraOpaqueTexture, u_xlat2.yz).xyz;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat2.x = u_xlat2.x + (-_CameraFadeParams.x);
    u_xlat2.x = u_xlat2.x * _CameraFadeParams.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat16_1.xyz * u_xlat2.xxx + (-u_xlat16_6.xyz);
    u_xlat15 = u_xlat0.w * u_xlat2.x + (-_DistortionBlend);
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat0.w * u_xlat2.x;
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat3.xyz + u_xlat16_6.xyz;
    SV_Target0.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_Surface==1.0);
#else
    u_xlatb2 = _Surface==1.0;
#endif
    SV_Target0.w = (u_xlatb2) ? u_xlat16_1.x : 1.0;
    return;
}

#endif
"
}
SubProgram "gles " {
Local Keywords { "_ALPHATEST_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec3 in_NORMAL0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD8;
vec3 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat16_2 = inversesqrt(u_xlat9);
    vs_TEXCOORD2.xyz = u_xlat1.xyz * vec3(u_xlat16_2);
    u_xlatb9 = unity_OrthoParams.w==0.0;
    u_xlat1.x = (u_xlatb9) ? u_xlat0.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = (u_xlatb9) ? u_xlat0.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = (u_xlatb9) ? u_xlat0.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat16_2 = inversesqrt(u_xlat0.x);
    vs_TEXCOORD3.xyz = u_xlat1.xyz * vec3(u_xlat16_2);
    vs_TEXCOORD8.xyz = vec3(0.0, 0.0, 0.0);
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
uniform 	mediump float _Cutoff;
uniform 	mediump float _Surface;
uniform lowp sampler2D _BaseMap;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump float u_xlat16_1;
bool u_xlatb2;
void main()
{
    u_xlat10_0 = texture2D(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _BaseColor;
    u_xlat16_1 = u_xlat16_0.w * vs_COLOR0.w + (-_Cutoff);
    u_xlat0 = u_xlat16_0 * vs_COLOR0;
    u_xlatb2 = u_xlat16_1<0.0;
    if(u_xlatb2){discard;}
    u_xlatb2 = _Surface==1.0;
    SV_Target0.w = (u_xlatb2) ? u_xlat0.w : 1.0;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Local Keywords { "_ALPHATEST_ON" }
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
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
out highp vec2 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD8;
vec3 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat16_2 = inversesqrt(u_xlat9);
    vs_TEXCOORD2.xyz = u_xlat1.xyz * vec3(u_xlat16_2);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb9 = unity_OrthoParams.w==0.0;
#endif
    u_xlat1.x = (u_xlatb9) ? u_xlat0.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = (u_xlatb9) ? u_xlat0.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = (u_xlatb9) ? u_xlat0.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat16_2 = inversesqrt(u_xlat0.x);
    vs_TEXCOORD3.xyz = u_xlat1.xyz * vec3(u_xlat16_2);
    vs_TEXCOORD8.xyz = vec3(0.0, 0.0, 0.0);
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
	UNITY_UNIFORM vec4 _SoftParticleFadeParams;
	UNITY_UNIFORM vec4 _CameraFadeParams;
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump vec4 _BaseColorAddSubDiff;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _DistortionStrengthScaled;
	UNITY_UNIFORM mediump float _DistortionBlend;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump float u_xlat16_1;
bool u_xlatb2;
void main()
{
    u_xlat16_0 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * _BaseColor;
    u_xlat16_1 = u_xlat16_0.w * vs_COLOR0.w + (-_Cutoff);
    u_xlat0 = u_xlat16_0 * vs_COLOR0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_1<0.0);
#else
    u_xlatb2 = u_xlat16_1<0.0;
#endif
    if(u_xlatb2){discard;}
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_Surface==1.0);
#else
    u_xlatb2 = _Surface==1.0;
#endif
    SV_Target0.w = (u_xlatb2) ? u_xlat0.w : 1.0;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles " {
Local Keywords { "_COLOROVERLAY_ON" "_EMISSION" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec3 in_NORMAL0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD8;
vec3 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat16_2 = inversesqrt(u_xlat9);
    vs_TEXCOORD2.xyz = u_xlat1.xyz * vec3(u_xlat16_2);
    u_xlatb9 = unity_OrthoParams.w==0.0;
    u_xlat1.x = (u_xlatb9) ? u_xlat0.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = (u_xlatb9) ? u_xlat0.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = (u_xlatb9) ? u_xlat0.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat16_2 = inversesqrt(u_xlat0.x);
    vs_TEXCOORD3.xyz = u_xlat1.xyz * vec3(u_xlat16_2);
    vs_TEXCOORD8.xyz = vec3(0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump float _Surface;
uniform lowp sampler2D _BaseMap;
uniform lowp sampler2D _EmissionMap;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
bvec3 u_xlatb3;
float u_xlat13;
void main()
{
    u_xlat10_0 = texture2D(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat1.xyz = (-u_xlat10_0.xyz) * _BaseColor.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_0 = u_xlat10_0 * _BaseColor;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat1.xyz;
    u_xlat2.xyz = (-vs_COLOR0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = (-u_xlat1.xyz) * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat16_0.xyz + u_xlat16_0.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vs_COLOR0.xyz + (-u_xlat1.xyz);
    u_xlatb3.xyz = greaterThanEqual(vec4(0.5, 0.5, 0.5, 0.0), u_xlat16_0.xyzx).xyz;
    u_xlat13 = u_xlat16_0.w * vs_COLOR0.w;
    u_xlat3.x = u_xlatb3.x ? float(1.0) : 0.0;
    u_xlat3.y = u_xlatb3.y ? float(1.0) : 0.0;
    u_xlat3.z = u_xlatb3.z ? float(1.0) : 0.0;
;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat10_2.xyz = texture2D(_EmissionMap, vs_TEXCOORD0.xy).xyz;
    SV_Target0.xyz = u_xlat10_2.xyz * _EmissionColor.xyz + u_xlat1.xyz;
    u_xlatb1 = _Surface==1.0;
    SV_Target0.w = (u_xlatb1) ? u_xlat13 : 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Local Keywords { "_COLOROVERLAY_ON" "_EMISSION" }
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
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
out highp vec2 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD8;
vec3 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat16_2 = inversesqrt(u_xlat9);
    vs_TEXCOORD2.xyz = u_xlat1.xyz * vec3(u_xlat16_2);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb9 = unity_OrthoParams.w==0.0;
#endif
    u_xlat1.x = (u_xlatb9) ? u_xlat0.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = (u_xlatb9) ? u_xlat0.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = (u_xlatb9) ? u_xlat0.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat16_2 = inversesqrt(u_xlat0.x);
    vs_TEXCOORD3.xyz = u_xlat1.xyz * vec3(u_xlat16_2);
    vs_TEXCOORD8.xyz = vec3(0.0, 0.0, 0.0);
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
	UNITY_UNIFORM vec4 _SoftParticleFadeParams;
	UNITY_UNIFORM vec4 _CameraFadeParams;
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump vec4 _BaseColorAddSubDiff;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _DistortionStrengthScaled;
	UNITY_UNIFORM mediump float _DistortionBlend;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
UNITY_LOCATION(1) uniform mediump sampler2D _EmissionMap;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
bvec3 u_xlatb3;
float u_xlat13;
void main()
{
    u_xlat16_0 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat1.xyz = (-u_xlat16_0.xyz) * _BaseColor.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_0 = u_xlat16_0 * _BaseColor;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat1.xyz;
    u_xlat2.xyz = (-vs_COLOR0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = (-u_xlat1.xyz) * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat16_0.xyz + u_xlat16_0.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vs_COLOR0.xyz + (-u_xlat1.xyz);
    u_xlatb3.xyz = greaterThanEqual(vec4(0.5, 0.5, 0.5, 0.0), u_xlat16_0.xyzx).xyz;
    u_xlat13 = u_xlat16_0.w * vs_COLOR0.w;
    u_xlat3.x = u_xlatb3.x ? float(1.0) : 0.0;
    u_xlat3.y = u_xlatb3.y ? float(1.0) : 0.0;
    u_xlat3.z = u_xlatb3.z ? float(1.0) : 0.0;
;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat16_2.xyz = texture(_EmissionMap, vs_TEXCOORD0.xy).xyz;
    SV_Target0.xyz = u_xlat16_2.xyz * _EmissionColor.xyz + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_Surface==1.0);
#else
    u_xlatb1 = _Surface==1.0;
#endif
    SV_Target0.w = (u_xlatb1) ? u_xlat13 : 1.0;
    return;
}

#endif
"
}
SubProgram "gles " {
Local Keywords { "_COLORADDSUBDIFF_ON" "_EMISSION" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec3 in_NORMAL0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD8;
vec3 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat16_2 = inversesqrt(u_xlat9);
    vs_TEXCOORD2.xyz = u_xlat1.xyz * vec3(u_xlat16_2);
    u_xlatb9 = unity_OrthoParams.w==0.0;
    u_xlat1.x = (u_xlatb9) ? u_xlat0.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = (u_xlatb9) ? u_xlat0.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = (u_xlatb9) ? u_xlat0.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat16_2 = inversesqrt(u_xlat0.x);
    vs_TEXCOORD3.xyz = u_xlat1.xyz * vec3(u_xlat16_2);
    vs_TEXCOORD8.xyz = vec3(0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump vec4 _BaseColorAddSubDiff;
uniform 	mediump float _Surface;
uniform lowp sampler2D _BaseMap;
uniform lowp sampler2D _EmissionMap;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
float u_xlat10;
void main()
{
    u_xlat10_0 = texture2D(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_0 * _BaseColor;
    u_xlat1.xyz = vs_COLOR0.xyz * _BaseColorAddSubDiff.xxx + u_xlat16_0.xyz;
    u_xlat10 = u_xlat16_0.w * vs_COLOR0.w;
    u_xlat2.xyz = (-u_xlat1.xyz) + abs(u_xlat1.xyz);
    u_xlat1.xyz = _BaseColorAddSubDiff.yyy * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat10_2.xyz = texture2D(_EmissionMap, vs_TEXCOORD0.xy).xyz;
    SV_Target0.xyz = u_xlat10_2.xyz * _EmissionColor.xyz + u_xlat1.xyz;
    u_xlatb1 = _Surface==1.0;
    SV_Target0.w = (u_xlatb1) ? u_xlat10 : 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Local Keywords { "_COLORADDSUBDIFF_ON" "_EMISSION" }
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
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
out highp vec2 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD8;
vec3 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat16_2 = inversesqrt(u_xlat9);
    vs_TEXCOORD2.xyz = u_xlat1.xyz * vec3(u_xlat16_2);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb9 = unity_OrthoParams.w==0.0;
#endif
    u_xlat1.x = (u_xlatb9) ? u_xlat0.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = (u_xlatb9) ? u_xlat0.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = (u_xlatb9) ? u_xlat0.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat16_2 = inversesqrt(u_xlat0.x);
    vs_TEXCOORD3.xyz = u_xlat1.xyz * vec3(u_xlat16_2);
    vs_TEXCOORD8.xyz = vec3(0.0, 0.0, 0.0);
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
	UNITY_UNIFORM vec4 _SoftParticleFadeParams;
	UNITY_UNIFORM vec4 _CameraFadeParams;
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump vec4 _BaseColorAddSubDiff;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _DistortionStrengthScaled;
	UNITY_UNIFORM mediump float _DistortionBlend;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
UNITY_LOCATION(1) uniform mediump sampler2D _EmissionMap;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
float u_xlat10;
void main()
{
    u_xlat16_0 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * _BaseColor;
    u_xlat1.xyz = vs_COLOR0.xyz * _BaseColorAddSubDiff.xxx + u_xlat16_0.xyz;
    u_xlat10 = u_xlat16_0.w * vs_COLOR0.w;
    u_xlat2.xyz = (-u_xlat1.xyz) + abs(u_xlat1.xyz);
    u_xlat1.xyz = _BaseColorAddSubDiff.yyy * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat16_2.xyz = texture(_EmissionMap, vs_TEXCOORD0.xy).xyz;
    SV_Target0.xyz = u_xlat16_2.xyz * _EmissionColor.xyz + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_Surface==1.0);
#else
    u_xlatb1 = _Surface==1.0;
#endif
    SV_Target0.w = (u_xlatb1) ? u_xlat10 : 1.0;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	int unity_BaseInstanceID;
struct unity_Builtins0Array_Type {
	vec4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
	vec4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
};
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityInstancing_PerDraw0 {
#endif
	UNITY_UNIFORM unity_Builtins0Array_Type unity_Builtins0Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
out highp vec2 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD8;
flat out highp uint vs_SV_InstanceID0;
float u_xlat0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump float u_xlat16_2;
vec3 u_xlat3;
void main()
{
    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
    u_xlati0 = int(u_xlati0 << 3);
    u_xlat3.xyz = in_POSITION0.yyy * unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1].xyz;
    u_xlat3.xyz = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0].xyz * in_POSITION0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2].xyz * in_POSITION0.zzz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz + unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz;
    u_xlat1 = u_xlat3.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat3.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat3.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD1.xyz = u_xlat3.xyz;
    u_xlat3.xyz = (-u_xlat3.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat1.x = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
    u_xlat0 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0 = max(u_xlat0, 1.17549435e-38);
    u_xlat16_2 = inversesqrt(u_xlat0);
    vs_TEXCOORD2.xyz = u_xlat1.xyz * vec3(u_xlat16_2);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb0 = unity_OrthoParams.w==0.0;
#endif
    u_xlat1.x = (u_xlatb0) ? u_xlat3.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = (u_xlatb0) ? u_xlat3.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = (u_xlatb0) ? u_xlat3.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0 = max(u_xlat0, 1.17549435e-38);
    u_xlat16_2 = inversesqrt(u_xlat0);
    vs_TEXCOORD3.xyz = u_xlat1.xyz * vec3(u_xlat16_2);
    vs_TEXCOORD8.xyz = vec3(0.0, 0.0, 0.0);
    vs_SV_InstanceID0 =  uint(gl_InstanceID);
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
	UNITY_UNIFORM vec4 _SoftParticleFadeParams;
	UNITY_UNIFORM vec4 _CameraFadeParams;
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump vec4 _BaseColorAddSubDiff;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _DistortionStrengthScaled;
	UNITY_UNIFORM mediump float _DistortionBlend;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb1;
void main()
{
    u_xlat16_0 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * _BaseColor;
    u_xlat0 = u_xlat16_0 * vs_COLOR0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_Surface==1.0);
#else
    u_xlatb1 = _Surface==1.0;
#endif
    SV_Target0.w = (u_xlatb1) ? u_xlat0.w : 1.0;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "INSTANCING_ON" }
Local Keywords { "_FADING_ON" "_SOFTPARTICLES_ON" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	int unity_BaseInstanceID;
struct unity_Builtins0Array_Type {
	vec4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
	vec4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
};
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityInstancing_PerDraw0 {
#endif
	UNITY_UNIFORM unity_Builtins0Array_Type unity_Builtins0Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
out highp vec2 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD8;
flat out highp uint vs_SV_InstanceID0;
vec4 u_xlat0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump float u_xlat16_3;
vec3 u_xlat4;
void main()
{
    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
    u_xlati0 = int(u_xlati0 << 3);
    u_xlat4.xyz = in_POSITION0.yyy * unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1].xyz;
    u_xlat4.xyz = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz;
    u_xlat1 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD1.xyz = u_xlat4.xyz;
    u_xlat4.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat2.x = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat16_3 = inversesqrt(u_xlat0.x);
    vs_TEXCOORD2.xyz = u_xlat2.xyz * vec3(u_xlat16_3);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb0 = unity_OrthoParams.w==0.0;
#endif
    u_xlat2.x = (u_xlatb0) ? u_xlat4.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = (u_xlatb0) ? u_xlat4.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = (u_xlatb0) ? u_xlat4.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat16_3 = inversesqrt(u_xlat0.x);
    vs_TEXCOORD3.xyz = u_xlat2.xyz * vec3(u_xlat16_3);
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
    vs_TEXCOORD8.xyz = vec3(0.0, 0.0, 0.0);
    vs_SV_InstanceID0 =  uint(gl_InstanceID);
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _SoftParticleFadeParams;
	UNITY_UNIFORM vec4 _CameraFadeParams;
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump vec4 _BaseColorAddSubDiff;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _DistortionStrengthScaled;
	UNITY_UNIFORM mediump float _DistortionBlend;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
UNITY_LOCATION(1) uniform highp sampler2D _CameraDepthTexture;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
bvec2 u_xlatb1;
mediump float u_xlat16_2;
float u_xlat4;
void main()
{
    u_xlat16_0 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * _BaseColor;
    u_xlat0 = u_xlat16_0 * vs_COLOR0;
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), _SoftParticleFadeParams.xyxx).xy;
    u_xlatb1.x = u_xlatb1.y || u_xlatb1.x;
    if(u_xlatb1.x){
        u_xlat1.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
        u_xlat1.x = texture(_CameraDepthTexture, u_xlat1.xy).x;
        u_xlat1.x = _ZBufferParams.z * u_xlat1.x + _ZBufferParams.w;
        u_xlat1.x = float(1.0) / u_xlat1.x;
        u_xlat4 = vs_TEXCOORD1.y * hlslcc_mtx4x4unity_MatrixV[1].z;
        u_xlat4 = hlslcc_mtx4x4unity_MatrixV[0].z * vs_TEXCOORD1.x + u_xlat4;
        u_xlat4 = hlslcc_mtx4x4unity_MatrixV[2].z * vs_TEXCOORD1.z + u_xlat4;
        u_xlat4 = u_xlat4 + hlslcc_mtx4x4unity_MatrixV[3].z;
        u_xlat1.x = u_xlat1.x + (-_SoftParticleFadeParams.x);
        u_xlat1.x = -abs(u_xlat4) + u_xlat1.x;
        u_xlat1.x = u_xlat1.x * _SoftParticleFadeParams.y;
#ifdef UNITY_ADRENO_ES3
        u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    } else {
        u_xlat1.x = 1.0;
    }
    u_xlat1.y = 1.0;
    u_xlat16_0 = u_xlat0 * u_xlat1.yyyx;
    u_xlat1.x = vs_TEXCOORD6.z / vs_TEXCOORD6.w;
    u_xlat1.x = _ZBufferParams.z * u_xlat1.x + _ZBufferParams.w;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x + (-_CameraFadeParams.x);
    u_xlat1.x = u_xlat1.x * _CameraFadeParams.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_2 = u_xlat16_0.w * u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(_Surface==1.0);
#else
    u_xlatb1.x = _Surface==1.0;
#endif
    SV_Target0.w = (u_xlatb1.x) ? u_xlat16_2 : 1.0;
    SV_Target0.xyz = u_xlat16_0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "INSTANCING_ON" }
Local Keywords { "_DISTORTION_ON" "_FADING_ON" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	int unity_BaseInstanceID;
struct unity_Builtins0Array_Type {
	vec4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
	vec4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
};
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityInstancing_PerDraw0 {
#endif
	UNITY_UNIFORM unity_Builtins0Array_Type unity_Builtins0Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
out highp vec2 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD8;
flat out highp uint vs_SV_InstanceID0;
vec4 u_xlat0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump float u_xlat16_3;
vec3 u_xlat4;
void main()
{
    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
    u_xlati0 = int(u_xlati0 << 3);
    u_xlat4.xyz = in_POSITION0.yyy * unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1].xyz;
    u_xlat4.xyz = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz;
    u_xlat1 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD1.xyz = u_xlat4.xyz;
    u_xlat4.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat2.x = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat16_3 = inversesqrt(u_xlat0.x);
    vs_TEXCOORD2.xyz = u_xlat2.xyz * vec3(u_xlat16_3);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb0 = unity_OrthoParams.w==0.0;
#endif
    u_xlat2.x = (u_xlatb0) ? u_xlat4.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = (u_xlatb0) ? u_xlat4.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = (u_xlatb0) ? u_xlat4.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat16_3 = inversesqrt(u_xlat0.x);
    vs_TEXCOORD3.xyz = u_xlat2.xyz * vec3(u_xlat16_3);
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
    vs_TEXCOORD8.xyz = vec3(0.0, 0.0, 0.0);
    vs_SV_InstanceID0 =  uint(gl_InstanceID);
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _SoftParticleFadeParams;
	UNITY_UNIFORM vec4 _CameraFadeParams;
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump vec4 _BaseColorAddSubDiff;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _DistortionStrengthScaled;
	UNITY_UNIFORM mediump float _DistortionBlend;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
UNITY_LOCATION(1) uniform mediump sampler2D _CameraOpaqueTexture;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
float u_xlat2;
float u_xlat3;
mediump float u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat7;
void main()
{
    u_xlat0.xyz = vs_TEXCOORD6.zxy / vs_TEXCOORD6.www;
    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat16_5.xyz = texture(_CameraOpaqueTexture, u_xlat0.yz).xyz;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-_CameraFadeParams.x);
    u_xlat0.x = u_xlat0.x * _CameraFadeParams.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_1 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat16_1 * _BaseColor;
    u_xlat2 = u_xlat16_1.w * vs_COLOR0.w;
    u_xlat7.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz + (-u_xlat16_5.xyz);
    u_xlat3 = u_xlat2 * u_xlat0.x + (-_DistortionBlend);
#ifdef UNITY_ADRENO_ES3
    u_xlat3 = min(max(u_xlat3, 0.0), 1.0);
#else
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
#endif
    u_xlat16_4 = u_xlat0.x * u_xlat2;
    u_xlat0.xyz = vec3(u_xlat3) * u_xlat7.xyz + u_xlat16_5.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_Surface==1.0);
#else
    u_xlatb0 = _Surface==1.0;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_4 : 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "INSTANCING_ON" }
Local Keywords { "_EMISSION" "_FADING_ON" "_SOFTPARTICLES_ON" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	int unity_BaseInstanceID;
struct unity_Builtins0Array_Type {
	vec4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
	vec4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
};
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityInstancing_PerDraw0 {
#endif
	UNITY_UNIFORM unity_Builtins0Array_Type unity_Builtins0Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
out highp vec2 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD8;
flat out highp uint vs_SV_InstanceID0;
vec4 u_xlat0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump float u_xlat16_3;
vec3 u_xlat4;
void main()
{
    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
    u_xlati0 = int(u_xlati0 << 3);
    u_xlat4.xyz = in_POSITION0.yyy * unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1].xyz;
    u_xlat4.xyz = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz;
    u_xlat1 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD1.xyz = u_xlat4.xyz;
    u_xlat4.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat2.x = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat16_3 = inversesqrt(u_xlat0.x);
    vs_TEXCOORD2.xyz = u_xlat2.xyz * vec3(u_xlat16_3);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb0 = unity_OrthoParams.w==0.0;
#endif
    u_xlat2.x = (u_xlatb0) ? u_xlat4.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = (u_xlatb0) ? u_xlat4.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = (u_xlatb0) ? u_xlat4.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat16_3 = inversesqrt(u_xlat0.x);
    vs_TEXCOORD3.xyz = u_xlat2.xyz * vec3(u_xlat16_3);
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
    vs_TEXCOORD8.xyz = vec3(0.0, 0.0, 0.0);
    vs_SV_InstanceID0 =  uint(gl_InstanceID);
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _SoftParticleFadeParams;
	UNITY_UNIFORM vec4 _CameraFadeParams;
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump vec4 _BaseColorAddSubDiff;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _DistortionStrengthScaled;
	UNITY_UNIFORM mediump float _DistortionBlend;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
UNITY_LOCATION(1) uniform mediump sampler2D _EmissionMap;
UNITY_LOCATION(2) uniform highp sampler2D _CameraDepthTexture;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump vec3 u_xlat16_1;
bvec2 u_xlatb1;
mediump float u_xlat16_2;
float u_xlat4;
void main()
{
    u_xlat16_0 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * _BaseColor;
    u_xlat0 = u_xlat16_0 * vs_COLOR0;
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), _SoftParticleFadeParams.xyxx).xy;
    u_xlatb1.x = u_xlatb1.y || u_xlatb1.x;
    if(u_xlatb1.x){
        u_xlat1.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
        u_xlat1.x = texture(_CameraDepthTexture, u_xlat1.xy).x;
        u_xlat1.x = _ZBufferParams.z * u_xlat1.x + _ZBufferParams.w;
        u_xlat1.x = float(1.0) / u_xlat1.x;
        u_xlat4 = vs_TEXCOORD1.y * hlslcc_mtx4x4unity_MatrixV[1].z;
        u_xlat4 = hlslcc_mtx4x4unity_MatrixV[0].z * vs_TEXCOORD1.x + u_xlat4;
        u_xlat4 = hlslcc_mtx4x4unity_MatrixV[2].z * vs_TEXCOORD1.z + u_xlat4;
        u_xlat4 = u_xlat4 + hlslcc_mtx4x4unity_MatrixV[3].z;
        u_xlat1.x = u_xlat1.x + (-_SoftParticleFadeParams.x);
        u_xlat1.x = -abs(u_xlat4) + u_xlat1.x;
        u_xlat1.x = u_xlat1.x * _SoftParticleFadeParams.y;
#ifdef UNITY_ADRENO_ES3
        u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    } else {
        u_xlat1.x = 1.0;
    }
    u_xlat1.y = 1.0;
    u_xlat16_0 = u_xlat0 * u_xlat1.yyyx;
    u_xlat1.x = vs_TEXCOORD6.z / vs_TEXCOORD6.w;
    u_xlat1.x = _ZBufferParams.z * u_xlat1.x + _ZBufferParams.w;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x + (-_CameraFadeParams.x);
    u_xlat1.x = u_xlat1.x * _CameraFadeParams.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_2 = u_xlat16_0.w * u_xlat1.x;
    u_xlat16_1.xyz = texture(_EmissionMap, vs_TEXCOORD0.xy).xyz;
    SV_Target0.xyz = u_xlat16_1.xyz * _EmissionColor.xyz + u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(_Surface==1.0);
#else
    u_xlatb1.x = _Surface==1.0;
#endif
    SV_Target0.w = (u_xlatb1.x) ? u_xlat16_2 : 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "INSTANCING_ON" }
Local Keywords { "_ALPHAPREMULTIPLY_ON" "_DISTORTION_ON" "_FADING_ON" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	int unity_BaseInstanceID;
struct unity_Builtins0Array_Type {
	vec4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
	vec4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
};
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityInstancing_PerDraw0 {
#endif
	UNITY_UNIFORM unity_Builtins0Array_Type unity_Builtins0Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
out highp vec2 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD8;
flat out highp uint vs_SV_InstanceID0;
vec4 u_xlat0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump float u_xlat16_3;
vec3 u_xlat4;
void main()
{
    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
    u_xlati0 = int(u_xlati0 << 3);
    u_xlat4.xyz = in_POSITION0.yyy * unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1].xyz;
    u_xlat4.xyz = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz;
    u_xlat1 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD1.xyz = u_xlat4.xyz;
    u_xlat4.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat2.x = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat16_3 = inversesqrt(u_xlat0.x);
    vs_TEXCOORD2.xyz = u_xlat2.xyz * vec3(u_xlat16_3);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb0 = unity_OrthoParams.w==0.0;
#endif
    u_xlat2.x = (u_xlatb0) ? u_xlat4.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = (u_xlatb0) ? u_xlat4.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = (u_xlatb0) ? u_xlat4.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat16_3 = inversesqrt(u_xlat0.x);
    vs_TEXCOORD3.xyz = u_xlat2.xyz * vec3(u_xlat16_3);
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
    vs_TEXCOORD8.xyz = vec3(0.0, 0.0, 0.0);
    vs_SV_InstanceID0 =  uint(gl_InstanceID);
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _SoftParticleFadeParams;
	UNITY_UNIFORM vec4 _CameraFadeParams;
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump vec4 _BaseColorAddSubDiff;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _DistortionStrengthScaled;
	UNITY_UNIFORM mediump float _DistortionBlend;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
UNITY_LOCATION(1) uniform mediump sampler2D _CameraOpaqueTexture;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
mediump vec3 u_xlat16_6;
float u_xlat15;
void main()
{
    u_xlat16_0 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * _BaseColor;
    u_xlat0 = u_xlat16_0 * vs_COLOR0;
    u_xlat16_1.xyz = u_xlat0.www * u_xlat0.xyz;
    u_xlat2.xyz = vs_TEXCOORD6.zxy / vs_TEXCOORD6.www;
    u_xlat2.x = _ZBufferParams.z * u_xlat2.x + _ZBufferParams.w;
    u_xlat16_6.xyz = texture(_CameraOpaqueTexture, u_xlat2.yz).xyz;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat2.x = u_xlat2.x + (-_CameraFadeParams.x);
    u_xlat2.x = u_xlat2.x * _CameraFadeParams.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat16_1.xyz * u_xlat2.xxx + (-u_xlat16_6.xyz);
    u_xlat15 = u_xlat0.w * u_xlat2.x + (-_DistortionBlend);
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat0.w * u_xlat2.x;
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat3.xyz + u_xlat16_6.xyz;
    SV_Target0.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_Surface==1.0);
#else
    u_xlatb2 = _Surface==1.0;
#endif
    SV_Target0.w = (u_xlatb2) ? u_xlat16_1.x : 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "INSTANCING_ON" }
Local Keywords { "_ALPHATEST_ON" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	int unity_BaseInstanceID;
struct unity_Builtins0Array_Type {
	vec4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
	vec4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
};
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityInstancing_PerDraw0 {
#endif
	UNITY_UNIFORM unity_Builtins0Array_Type unity_Builtins0Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
out highp vec2 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD8;
flat out highp uint vs_SV_InstanceID0;
float u_xlat0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump float u_xlat16_2;
vec3 u_xlat3;
void main()
{
    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
    u_xlati0 = int(u_xlati0 << 3);
    u_xlat3.xyz = in_POSITION0.yyy * unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1].xyz;
    u_xlat3.xyz = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0].xyz * in_POSITION0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2].xyz * in_POSITION0.zzz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz + unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz;
    u_xlat1 = u_xlat3.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat3.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat3.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD1.xyz = u_xlat3.xyz;
    u_xlat3.xyz = (-u_xlat3.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat1.x = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
    u_xlat0 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0 = max(u_xlat0, 1.17549435e-38);
    u_xlat16_2 = inversesqrt(u_xlat0);
    vs_TEXCOORD2.xyz = u_xlat1.xyz * vec3(u_xlat16_2);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb0 = unity_OrthoParams.w==0.0;
#endif
    u_xlat1.x = (u_xlatb0) ? u_xlat3.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = (u_xlatb0) ? u_xlat3.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = (u_xlatb0) ? u_xlat3.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0 = max(u_xlat0, 1.17549435e-38);
    u_xlat16_2 = inversesqrt(u_xlat0);
    vs_TEXCOORD3.xyz = u_xlat1.xyz * vec3(u_xlat16_2);
    vs_TEXCOORD8.xyz = vec3(0.0, 0.0, 0.0);
    vs_SV_InstanceID0 =  uint(gl_InstanceID);
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
	UNITY_UNIFORM vec4 _SoftParticleFadeParams;
	UNITY_UNIFORM vec4 _CameraFadeParams;
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump vec4 _BaseColorAddSubDiff;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _DistortionStrengthScaled;
	UNITY_UNIFORM mediump float _DistortionBlend;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump float u_xlat16_1;
bool u_xlatb2;
void main()
{
    u_xlat16_0 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * _BaseColor;
    u_xlat16_1 = u_xlat16_0.w * vs_COLOR0.w + (-_Cutoff);
    u_xlat0 = u_xlat16_0 * vs_COLOR0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_1<0.0);
#else
    u_xlatb2 = u_xlat16_1<0.0;
#endif
    if(u_xlatb2){discard;}
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_Surface==1.0);
#else
    u_xlatb2 = _Surface==1.0;
#endif
    SV_Target0.w = (u_xlatb2) ? u_xlat0.w : 1.0;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "INSTANCING_ON" }
Local Keywords { "_COLOROVERLAY_ON" "_EMISSION" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	int unity_BaseInstanceID;
struct unity_Builtins0Array_Type {
	vec4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
	vec4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
};
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityInstancing_PerDraw0 {
#endif
	UNITY_UNIFORM unity_Builtins0Array_Type unity_Builtins0Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
out highp vec2 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD8;
flat out highp uint vs_SV_InstanceID0;
float u_xlat0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump float u_xlat16_2;
vec3 u_xlat3;
void main()
{
    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
    u_xlati0 = int(u_xlati0 << 3);
    u_xlat3.xyz = in_POSITION0.yyy * unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1].xyz;
    u_xlat3.xyz = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0].xyz * in_POSITION0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2].xyz * in_POSITION0.zzz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz + unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz;
    u_xlat1 = u_xlat3.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat3.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat3.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD1.xyz = u_xlat3.xyz;
    u_xlat3.xyz = (-u_xlat3.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat1.x = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
    u_xlat0 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0 = max(u_xlat0, 1.17549435e-38);
    u_xlat16_2 = inversesqrt(u_xlat0);
    vs_TEXCOORD2.xyz = u_xlat1.xyz * vec3(u_xlat16_2);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb0 = unity_OrthoParams.w==0.0;
#endif
    u_xlat1.x = (u_xlatb0) ? u_xlat3.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = (u_xlatb0) ? u_xlat3.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = (u_xlatb0) ? u_xlat3.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0 = max(u_xlat0, 1.17549435e-38);
    u_xlat16_2 = inversesqrt(u_xlat0);
    vs_TEXCOORD3.xyz = u_xlat1.xyz * vec3(u_xlat16_2);
    vs_TEXCOORD8.xyz = vec3(0.0, 0.0, 0.0);
    vs_SV_InstanceID0 =  uint(gl_InstanceID);
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
	UNITY_UNIFORM vec4 _SoftParticleFadeParams;
	UNITY_UNIFORM vec4 _CameraFadeParams;
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump vec4 _BaseColorAddSubDiff;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _DistortionStrengthScaled;
	UNITY_UNIFORM mediump float _DistortionBlend;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
UNITY_LOCATION(1) uniform mediump sampler2D _EmissionMap;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
bvec3 u_xlatb3;
float u_xlat13;
void main()
{
    u_xlat16_0 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat1.xyz = (-u_xlat16_0.xyz) * _BaseColor.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_0 = u_xlat16_0 * _BaseColor;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat1.xyz;
    u_xlat2.xyz = (-vs_COLOR0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = (-u_xlat1.xyz) * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat16_0.xyz + u_xlat16_0.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vs_COLOR0.xyz + (-u_xlat1.xyz);
    u_xlatb3.xyz = greaterThanEqual(vec4(0.5, 0.5, 0.5, 0.0), u_xlat16_0.xyzx).xyz;
    u_xlat13 = u_xlat16_0.w * vs_COLOR0.w;
    u_xlat3.x = u_xlatb3.x ? float(1.0) : 0.0;
    u_xlat3.y = u_xlatb3.y ? float(1.0) : 0.0;
    u_xlat3.z = u_xlatb3.z ? float(1.0) : 0.0;
;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat16_2.xyz = texture(_EmissionMap, vs_TEXCOORD0.xy).xyz;
    SV_Target0.xyz = u_xlat16_2.xyz * _EmissionColor.xyz + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_Surface==1.0);
#else
    u_xlatb1 = _Surface==1.0;
#endif
    SV_Target0.w = (u_xlatb1) ? u_xlat13 : 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "INSTANCING_ON" }
Local Keywords { "_COLORADDSUBDIFF_ON" "_EMISSION" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	int unity_BaseInstanceID;
struct unity_Builtins0Array_Type {
	vec4 hlslcc_mtx4x4unity_ObjectToWorldArray[4];
	vec4 hlslcc_mtx4x4unity_WorldToObjectArray[4];
};
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityInstancing_PerDraw0 {
#endif
	UNITY_UNIFORM unity_Builtins0Array_Type unity_Builtins0Array[UNITY_RUNTIME_INSTANCING_ARRAY_SIZE];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
out highp vec2 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD8;
flat out highp uint vs_SV_InstanceID0;
float u_xlat0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump float u_xlat16_2;
vec3 u_xlat3;
void main()
{
    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
    u_xlati0 = int(u_xlati0 << 3);
    u_xlat3.xyz = in_POSITION0.yyy * unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[1].xyz;
    u_xlat3.xyz = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[0].xyz * in_POSITION0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[2].xyz * in_POSITION0.zzz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz + unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_ObjectToWorldArray[3].xyz;
    u_xlat1 = u_xlat3.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat3.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat3.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD1.xyz = u_xlat3.xyz;
    u_xlat3.xyz = (-u_xlat3.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat1.x = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, unity_Builtins0Array[u_xlati0 / 8].hlslcc_mtx4x4unity_WorldToObjectArray[2].xyz);
    u_xlat0 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0 = max(u_xlat0, 1.17549435e-38);
    u_xlat16_2 = inversesqrt(u_xlat0);
    vs_TEXCOORD2.xyz = u_xlat1.xyz * vec3(u_xlat16_2);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb0 = unity_OrthoParams.w==0.0;
#endif
    u_xlat1.x = (u_xlatb0) ? u_xlat3.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = (u_xlatb0) ? u_xlat3.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = (u_xlatb0) ? u_xlat3.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0 = max(u_xlat0, 1.17549435e-38);
    u_xlat16_2 = inversesqrt(u_xlat0);
    vs_TEXCOORD3.xyz = u_xlat1.xyz * vec3(u_xlat16_2);
    vs_TEXCOORD8.xyz = vec3(0.0, 0.0, 0.0);
    vs_SV_InstanceID0 =  uint(gl_InstanceID);
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
	UNITY_UNIFORM vec4 _SoftParticleFadeParams;
	UNITY_UNIFORM vec4 _CameraFadeParams;
	UNITY_UNIFORM vec4 _BaseMap_ST;
	UNITY_UNIFORM mediump vec4 _BaseColor;
	UNITY_UNIFORM mediump vec4 _EmissionColor;
	UNITY_UNIFORM mediump vec4 _BaseColorAddSubDiff;
	UNITY_UNIFORM mediump float _Cutoff;
	UNITY_UNIFORM mediump float _DistortionStrengthScaled;
	UNITY_UNIFORM mediump float _DistortionBlend;
	UNITY_UNIFORM mediump float _Surface;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
UNITY_LOCATION(1) uniform mediump sampler2D _EmissionMap;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
float u_xlat10;
void main()
{
    u_xlat16_0 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * _BaseColor;
    u_xlat1.xyz = vs_COLOR0.xyz * _BaseColorAddSubDiff.xxx + u_xlat16_0.xyz;
    u_xlat10 = u_xlat16_0.w * vs_COLOR0.w;
    u_xlat2.xyz = (-u_xlat1.xyz) + abs(u_xlat1.xyz);
    u_xlat1.xyz = _BaseColorAddSubDiff.yyy * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat16_2.xyz = texture(_EmissionMap, vs_TEXCOORD0.xy).xyz;
    SV_Target0.xyz = u_xlat16_2.xyz * _EmissionColor.xyz + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_Surface==1.0);
#else
    u_xlatb1 = _Surface==1.0;
#endif
    SV_Target0.w = (u_xlatb1) ? u_xlat10 : 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "PROCEDURAL_INSTANCING_ON" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	int unity_BaseInstanceID;
uniform 	vec4 unity_ParticleUVShiftData;
uniform 	float unity_ParticleUseMeshColors;
 struct unity_ParticleInstanceData_type {
	uint[14] value;
};

layout(std430, binding = 0) readonly buffer unity_ParticleInstanceData {
	unity_ParticleInstanceData_type unity_ParticleInstanceData_buf[];
};
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
layout(location = 0) out highp vec2 vs_TEXCOORD0;
layout(location = 1) out mediump vec4 vs_COLOR0;
layout(location = 2) out highp vec4 vs_TEXCOORD1;
layout(location = 3) out highp vec3 vs_TEXCOORD2;
layout(location = 4) out highp vec3 vs_TEXCOORD3;
layout(location = 5) out highp vec3 vs_TEXCOORD8;
layout(location = 6) flat out highp uint vs_SV_InstanceID0;
vec4 u_xlat0;
vec4 u_xlat1;
int u_xlati1;
uint u_xlatu1;
vec4 u_xlat2;
uvec3 u_xlatu2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
vec3 u_xlat6;
vec4 u_xlat7;
mediump float u_xlat16_8;
float u_xlat9;
vec3 u_xlat10;
bool u_xlatb18;
float u_xlat27;
bool u_xlatb27;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyz;
    u_xlat0.w = 1.0;
    u_xlati1 = gl_InstanceID + unity_BaseInstanceID;
    u_xlat2 = vec4(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 2]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 3]));
    u_xlat3.w = u_xlat2.y;
    u_xlat10.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(12 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(12 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(12 >> 2) + 2]));
    u_xlat3.y = u_xlat10.y;
    u_xlat4.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(24 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(24 >> 2) + 2]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(24 >> 2) + 0]));
    u_xlat3.z = u_xlat4.x;
    u_xlat5.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(0 >> 2) + 2]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(0 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(0 >> 2) + 1]));
    u_xlat1.x = uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(52 >> 2) + 0]);
    u_xlat1.x = floor(u_xlat1.x);
    u_xlat3.x = u_xlat5.z;
    u_xlat6.y = dot(u_xlat3, u_xlat0);
    u_xlat7 = u_xlat6.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat4.w = u_xlat2.x;
    u_xlat5.z = u_xlat4.y;
    u_xlat4.x = u_xlat5.y;
    u_xlat4.y = u_xlat10.x;
    u_xlat5.y = u_xlat10.z;
    u_xlat6.x = dot(u_xlat4, u_xlat0);
    u_xlat7 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat6.xxxx + u_xlat7;
    u_xlat5.w = u_xlat2.z;
    u_xlat6.z = dot(u_xlat5, u_xlat0);
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat6.zzzz + u_xlat7;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat0.x = u_xlat1.x / unity_ParticleUVShiftData.y;
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat9 = (-u_xlat0.x) * unity_ParticleUVShiftData.y + u_xlat1.x;
    u_xlat9 = floor(u_xlat9);
    u_xlat1.x = u_xlat9 * unity_ParticleUVShiftData.z;
    u_xlat9 = (-unity_ParticleUVShiftData.w) + 1.0;
    u_xlat1.y = (-u_xlat0.x) * unity_ParticleUVShiftData.w + u_xlat9;
    u_xlat0.xy = in_TEXCOORD0.xy * unity_ParticleUVShiftData.zw + u_xlat1.xy;
    u_xlatb18 = unity_ParticleUVShiftData.x!=0.0;
    vs_TEXCOORD0.xy = (bool(u_xlatb18)) ? u_xlat0.xy : in_TEXCOORD0.xy;
    u_xlat0 = in_COLOR0 + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat0 = vec4(unity_ParticleUseMeshColors) * u_xlat0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlatu1 = uint(floatBitsToUint(u_xlat2.w)) & 255u;
    u_xlat1.x = float(u_xlatu1);
    u_xlatu2.x = bitfieldExtract(uint(floatBitsToUint(u_xlat2.w)), int(8), int(8));
    u_xlatu2.y = bitfieldExtract(uint(floatBitsToUint(u_xlat2.w)), int(16), int(8));
    u_xlatu2.z = uint(floatBitsToUint(u_xlat2.w)) >> 24u;
    u_xlat1.yzw = vec3(u_xlatu2.xyz);
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat0 = u_xlat0 * vec4(0.00392156886, 0.00392156886, 0.00392156886, 0.00392156886);
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD1.w = 0.0;
    vs_TEXCOORD1.xyz = u_xlat6.xyz;
    u_xlat0.xyz = (-u_xlat6.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.xyz = u_xlat4.yzx * u_xlat5.zxy;
    u_xlat1.xyz = u_xlat4.zxy * u_xlat5.yzx + (-u_xlat1.xyz);
    u_xlat2.xyz = u_xlat3.zxy * u_xlat5.yzx;
    u_xlat2.xyz = u_xlat3.yzx * u_xlat5.zxy + (-u_xlat2.xyz);
    u_xlat27 = dot(u_xlat4.xyz, u_xlat2.xyz);
    u_xlat27 = float(1.0) / float(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat1.xyz;
    u_xlat1.y = dot(in_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat5.xyz = u_xlat3.yzx * u_xlat4.zxy;
    u_xlat3.xyz = u_xlat4.yzx * u_xlat3.zxy + (-u_xlat5.xyz);
    u_xlat3.xyz = vec3(u_xlat27) * u_xlat3.xyz;
    u_xlat2.xyz = vec3(u_xlat27) * u_xlat2.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, u_xlat2.xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, u_xlat3.xyz);
    u_xlat27 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat27 = max(u_xlat27, 1.17549435e-38);
    u_xlat16_8 = inversesqrt(u_xlat27);
    vs_TEXCOORD2.xyz = u_xlat1.xyz * vec3(u_xlat16_8);
    u_xlatb27 = unity_OrthoParams.w==0.0;
    u_xlat1.x = (u_xlatb27) ? u_xlat0.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = (u_xlatb27) ? u_xlat0.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = (u_xlatb27) ? u_xlat0.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat16_8 = inversesqrt(u_xlat0.x);
    vs_TEXCOORD3.xyz = u_xlat1.xyz * vec3(u_xlat16_8);
    vs_TEXCOORD8.xyz = vec3(0.0, 0.0, 0.0);
    vs_SV_InstanceID0 =  uint(gl_InstanceID);
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
UNITY_BINDING(0) uniform UnityPerMaterial {
	vec4 _SoftParticleFadeParams;
	vec4 _CameraFadeParams;
	vec4 _BaseMap_ST;
	mediump vec4 _BaseColor;
	mediump vec4 _EmissionColor;
	mediump vec4 _BaseColorAddSubDiff;
	mediump float _Cutoff;
	mediump float _DistortionStrengthScaled;
	mediump float _DistortionBlend;
	mediump float _Surface;
};
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb1;
void main()
{
    u_xlat16_0 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * _BaseColor;
    u_xlat0 = u_xlat16_0 * vs_COLOR0;
    u_xlatb1 = _Surface==1.0;
    SV_Target0.w = (u_xlatb1) ? u_xlat0.w : 1.0;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "PROCEDURAL_INSTANCING_ON" }
Local Keywords { "_FADING_ON" "_SOFTPARTICLES_ON" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	int unity_BaseInstanceID;
uniform 	vec4 unity_ParticleUVShiftData;
uniform 	float unity_ParticleUseMeshColors;
 struct unity_ParticleInstanceData_type {
	uint[14] value;
};

layout(std430, binding = 0) readonly buffer unity_ParticleInstanceData {
	unity_ParticleInstanceData_type unity_ParticleInstanceData_buf[];
};
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
layout(location = 0) out highp vec2 vs_TEXCOORD0;
layout(location = 1) out mediump vec4 vs_COLOR0;
layout(location = 2) out highp vec4 vs_TEXCOORD1;
layout(location = 4) out highp vec3 vs_TEXCOORD2;
layout(location = 5) out highp vec3 vs_TEXCOORD3;
layout(location = 3) out highp vec4 vs_TEXCOORD6;
layout(location = 6) out highp vec3 vs_TEXCOORD8;
layout(location = 7) flat out highp uint vs_SV_InstanceID0;
vec4 u_xlat0;
vec4 u_xlat1;
int u_xlati1;
vec4 u_xlat2;
uvec3 u_xlatu2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
vec3 u_xlat6;
vec4 u_xlat7;
mediump float u_xlat16_8;
vec3 u_xlat10;
bool u_xlatb19;
float u_xlat28;
bool u_xlatb28;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyz;
    u_xlat0.w = 1.0;
    u_xlati1 = gl_InstanceID + unity_BaseInstanceID;
    u_xlat2 = vec4(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 2]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 3]));
    u_xlat3.w = u_xlat2.y;
    u_xlat10.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(12 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(12 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(12 >> 2) + 2]));
    u_xlat3.y = u_xlat10.y;
    u_xlat4.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(24 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(24 >> 2) + 2]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(24 >> 2) + 0]));
    u_xlat3.z = u_xlat4.x;
    u_xlat5.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(0 >> 2) + 2]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(0 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(0 >> 2) + 1]));
    u_xlat1.x = uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(52 >> 2) + 0]);
    u_xlat1.x = floor(u_xlat1.x);
    u_xlat3.x = u_xlat5.z;
    u_xlat6.y = dot(u_xlat3, u_xlat0);
    u_xlat7 = u_xlat6.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat4.w = u_xlat2.x;
    u_xlat5.z = u_xlat4.y;
    u_xlat4.x = u_xlat5.y;
    u_xlat4.y = u_xlat10.x;
    u_xlat5.y = u_xlat10.z;
    u_xlat6.x = dot(u_xlat4, u_xlat0);
    u_xlat7 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat6.xxxx + u_xlat7;
    u_xlat5.w = u_xlat2.z;
    u_xlat6.z = dot(u_xlat5, u_xlat0);
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat6.zzzz + u_xlat7;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat0;
    u_xlat10.x = u_xlat1.x / unity_ParticleUVShiftData.y;
    u_xlat10.x = floor(u_xlat10.x);
    u_xlat1.x = (-u_xlat10.x) * unity_ParticleUVShiftData.y + u_xlat1.x;
    u_xlat1.x = floor(u_xlat1.x);
    u_xlat2.x = u_xlat1.x * unity_ParticleUVShiftData.z;
    u_xlat1.x = (-unity_ParticleUVShiftData.w) + 1.0;
    u_xlat2.y = (-u_xlat10.x) * unity_ParticleUVShiftData.w + u_xlat1.x;
    u_xlat1.xy = in_TEXCOORD0.xy * unity_ParticleUVShiftData.zw + u_xlat2.xy;
    u_xlatb19 = unity_ParticleUVShiftData.x!=0.0;
    vs_TEXCOORD0.xy = (bool(u_xlatb19)) ? u_xlat1.xy : in_TEXCOORD0.xy;
    u_xlat1 = in_COLOR0 + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat1 = vec4(unity_ParticleUseMeshColors) * u_xlat1 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlatu2.x = uint(floatBitsToUint(u_xlat2.w)) & 255u;
    u_xlat7.x = float(u_xlatu2.x);
    u_xlatu2.x = bitfieldExtract(uint(floatBitsToUint(u_xlat2.w)), int(8), int(8));
    u_xlatu2.y = bitfieldExtract(uint(floatBitsToUint(u_xlat2.w)), int(16), int(8));
    u_xlatu2.z = uint(floatBitsToUint(u_xlat2.w)) >> 24u;
    u_xlat7.yzw = vec3(u_xlatu2.xyz);
    u_xlat1 = u_xlat1 * u_xlat7;
    u_xlat1 = u_xlat1 * vec4(0.00392156886, 0.00392156886, 0.00392156886, 0.00392156886);
    vs_COLOR0 = u_xlat1;
    vs_TEXCOORD1.w = 0.0;
    vs_TEXCOORD1.xyz = u_xlat6.xyz;
    u_xlat1.xyz = (-u_xlat6.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2.xyz = u_xlat4.yzx * u_xlat5.zxy;
    u_xlat2.xyz = u_xlat4.zxy * u_xlat5.yzx + (-u_xlat2.xyz);
    u_xlat6.xyz = u_xlat3.zxy * u_xlat5.yzx;
    u_xlat5.xyz = u_xlat3.yzx * u_xlat5.zxy + (-u_xlat6.xyz);
    u_xlat28 = dot(u_xlat4.xyz, u_xlat5.xyz);
    u_xlat28 = float(1.0) / float(u_xlat28);
    u_xlat2.xyz = vec3(u_xlat28) * u_xlat2.xyz;
    u_xlat2.y = dot(in_NORMAL0.xyz, u_xlat2.xyz);
    u_xlat6.xyz = u_xlat3.yzx * u_xlat4.zxy;
    u_xlat3.xyz = u_xlat4.yzx * u_xlat3.zxy + (-u_xlat6.xyz);
    u_xlat3.xyz = vec3(u_xlat28) * u_xlat3.xyz;
    u_xlat4.xyz = vec3(u_xlat28) * u_xlat5.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, u_xlat4.xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, u_xlat3.xyz);
    u_xlat28 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat28 = max(u_xlat28, 1.17549435e-38);
    u_xlat16_8 = inversesqrt(u_xlat28);
    vs_TEXCOORD2.xyz = u_xlat2.xyz * vec3(u_xlat16_8);
    u_xlatb28 = unity_OrthoParams.w==0.0;
    u_xlat2.x = (u_xlatb28) ? u_xlat1.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = (u_xlatb28) ? u_xlat1.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = (u_xlatb28) ? u_xlat1.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = max(u_xlat1.x, 1.17549435e-38);
    u_xlat16_8 = inversesqrt(u_xlat1.x);
    vs_TEXCOORD3.xyz = u_xlat2.xyz * vec3(u_xlat16_8);
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD8.xyz = vec3(0.0, 0.0, 0.0);
    vs_SV_InstanceID0 =  uint(gl_InstanceID);
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
UNITY_BINDING(0) uniform UnityPerMaterial {
	vec4 _SoftParticleFadeParams;
	vec4 _CameraFadeParams;
	vec4 _BaseMap_ST;
	mediump vec4 _BaseColor;
	mediump vec4 _EmissionColor;
	mediump vec4 _BaseColorAddSubDiff;
	mediump float _Cutoff;
	mediump float _DistortionStrengthScaled;
	mediump float _DistortionBlend;
	mediump float _Surface;
};
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
UNITY_LOCATION(1) uniform highp sampler2D _CameraDepthTexture;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 2) in highp vec4 vs_TEXCOORD1;
layout(location = 3) in highp vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
bvec2 u_xlatb1;
mediump float u_xlat16_2;
float u_xlat4;
void main()
{
    u_xlat16_0 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * _BaseColor;
    u_xlat0 = u_xlat16_0 * vs_COLOR0;
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), _SoftParticleFadeParams.xyxx).xy;
    u_xlatb1.x = u_xlatb1.y || u_xlatb1.x;
    if(u_xlatb1.x){
        u_xlat1.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
        u_xlat1.x = texture(_CameraDepthTexture, u_xlat1.xy).x;
        u_xlat1.x = _ZBufferParams.z * u_xlat1.x + _ZBufferParams.w;
        u_xlat1.x = float(1.0) / u_xlat1.x;
        u_xlat4 = vs_TEXCOORD1.y * hlslcc_mtx4x4unity_MatrixV[1].z;
        u_xlat4 = hlslcc_mtx4x4unity_MatrixV[0].z * vs_TEXCOORD1.x + u_xlat4;
        u_xlat4 = hlslcc_mtx4x4unity_MatrixV[2].z * vs_TEXCOORD1.z + u_xlat4;
        u_xlat4 = u_xlat4 + hlslcc_mtx4x4unity_MatrixV[3].z;
        u_xlat1.x = u_xlat1.x + (-_SoftParticleFadeParams.x);
        u_xlat1.x = -abs(u_xlat4) + u_xlat1.x;
        u_xlat1.x = u_xlat1.x * _SoftParticleFadeParams.y;
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    } else {
        u_xlat1.x = 1.0;
    }
    u_xlat1.y = 1.0;
    u_xlat16_0 = u_xlat0 * u_xlat1.yyyx;
    u_xlat1.x = vs_TEXCOORD6.z / vs_TEXCOORD6.w;
    u_xlat1.x = _ZBufferParams.z * u_xlat1.x + _ZBufferParams.w;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x + (-_CameraFadeParams.x);
    u_xlat1.x = u_xlat1.x * _CameraFadeParams.y;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat16_2 = u_xlat16_0.w * u_xlat1.x;
    u_xlatb1.x = _Surface==1.0;
    SV_Target0.w = (u_xlatb1.x) ? u_xlat16_2 : 1.0;
    SV_Target0.xyz = u_xlat16_0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "PROCEDURAL_INSTANCING_ON" }
Local Keywords { "_DISTORTION_ON" "_FADING_ON" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	int unity_BaseInstanceID;
uniform 	vec4 unity_ParticleUVShiftData;
uniform 	float unity_ParticleUseMeshColors;
 struct unity_ParticleInstanceData_type {
	uint[14] value;
};

layout(std430, binding = 0) readonly buffer unity_ParticleInstanceData {
	unity_ParticleInstanceData_type unity_ParticleInstanceData_buf[];
};
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
layout(location = 0) out highp vec2 vs_TEXCOORD0;
layout(location = 1) out mediump vec4 vs_COLOR0;
layout(location = 3) out highp vec4 vs_TEXCOORD1;
layout(location = 4) out highp vec3 vs_TEXCOORD2;
layout(location = 5) out highp vec3 vs_TEXCOORD3;
layout(location = 2) out highp vec4 vs_TEXCOORD6;
layout(location = 6) out highp vec3 vs_TEXCOORD8;
layout(location = 7) flat out highp uint vs_SV_InstanceID0;
vec4 u_xlat0;
vec4 u_xlat1;
int u_xlati1;
vec4 u_xlat2;
uvec3 u_xlatu2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
vec3 u_xlat6;
vec4 u_xlat7;
mediump float u_xlat16_8;
vec3 u_xlat10;
bool u_xlatb19;
float u_xlat28;
bool u_xlatb28;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyz;
    u_xlat0.w = 1.0;
    u_xlati1 = gl_InstanceID + unity_BaseInstanceID;
    u_xlat2 = vec4(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 2]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 3]));
    u_xlat3.w = u_xlat2.y;
    u_xlat10.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(12 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(12 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(12 >> 2) + 2]));
    u_xlat3.y = u_xlat10.y;
    u_xlat4.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(24 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(24 >> 2) + 2]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(24 >> 2) + 0]));
    u_xlat3.z = u_xlat4.x;
    u_xlat5.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(0 >> 2) + 2]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(0 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(0 >> 2) + 1]));
    u_xlat1.x = uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(52 >> 2) + 0]);
    u_xlat1.x = floor(u_xlat1.x);
    u_xlat3.x = u_xlat5.z;
    u_xlat6.y = dot(u_xlat3, u_xlat0);
    u_xlat7 = u_xlat6.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat4.w = u_xlat2.x;
    u_xlat5.z = u_xlat4.y;
    u_xlat4.x = u_xlat5.y;
    u_xlat4.y = u_xlat10.x;
    u_xlat5.y = u_xlat10.z;
    u_xlat6.x = dot(u_xlat4, u_xlat0);
    u_xlat7 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat6.xxxx + u_xlat7;
    u_xlat5.w = u_xlat2.z;
    u_xlat6.z = dot(u_xlat5, u_xlat0);
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat6.zzzz + u_xlat7;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat0;
    u_xlat10.x = u_xlat1.x / unity_ParticleUVShiftData.y;
    u_xlat10.x = floor(u_xlat10.x);
    u_xlat1.x = (-u_xlat10.x) * unity_ParticleUVShiftData.y + u_xlat1.x;
    u_xlat1.x = floor(u_xlat1.x);
    u_xlat2.x = u_xlat1.x * unity_ParticleUVShiftData.z;
    u_xlat1.x = (-unity_ParticleUVShiftData.w) + 1.0;
    u_xlat2.y = (-u_xlat10.x) * unity_ParticleUVShiftData.w + u_xlat1.x;
    u_xlat1.xy = in_TEXCOORD0.xy * unity_ParticleUVShiftData.zw + u_xlat2.xy;
    u_xlatb19 = unity_ParticleUVShiftData.x!=0.0;
    vs_TEXCOORD0.xy = (bool(u_xlatb19)) ? u_xlat1.xy : in_TEXCOORD0.xy;
    u_xlat1 = in_COLOR0 + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat1 = vec4(unity_ParticleUseMeshColors) * u_xlat1 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlatu2.x = uint(floatBitsToUint(u_xlat2.w)) & 255u;
    u_xlat7.x = float(u_xlatu2.x);
    u_xlatu2.x = bitfieldExtract(uint(floatBitsToUint(u_xlat2.w)), int(8), int(8));
    u_xlatu2.y = bitfieldExtract(uint(floatBitsToUint(u_xlat2.w)), int(16), int(8));
    u_xlatu2.z = uint(floatBitsToUint(u_xlat2.w)) >> 24u;
    u_xlat7.yzw = vec3(u_xlatu2.xyz);
    u_xlat1 = u_xlat1 * u_xlat7;
    u_xlat1 = u_xlat1 * vec4(0.00392156886, 0.00392156886, 0.00392156886, 0.00392156886);
    vs_COLOR0 = u_xlat1;
    vs_TEXCOORD1.w = 0.0;
    vs_TEXCOORD1.xyz = u_xlat6.xyz;
    u_xlat1.xyz = (-u_xlat6.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2.xyz = u_xlat4.yzx * u_xlat5.zxy;
    u_xlat2.xyz = u_xlat4.zxy * u_xlat5.yzx + (-u_xlat2.xyz);
    u_xlat6.xyz = u_xlat3.zxy * u_xlat5.yzx;
    u_xlat5.xyz = u_xlat3.yzx * u_xlat5.zxy + (-u_xlat6.xyz);
    u_xlat28 = dot(u_xlat4.xyz, u_xlat5.xyz);
    u_xlat28 = float(1.0) / float(u_xlat28);
    u_xlat2.xyz = vec3(u_xlat28) * u_xlat2.xyz;
    u_xlat2.y = dot(in_NORMAL0.xyz, u_xlat2.xyz);
    u_xlat6.xyz = u_xlat3.yzx * u_xlat4.zxy;
    u_xlat3.xyz = u_xlat4.yzx * u_xlat3.zxy + (-u_xlat6.xyz);
    u_xlat3.xyz = vec3(u_xlat28) * u_xlat3.xyz;
    u_xlat4.xyz = vec3(u_xlat28) * u_xlat5.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, u_xlat4.xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, u_xlat3.xyz);
    u_xlat28 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat28 = max(u_xlat28, 1.17549435e-38);
    u_xlat16_8 = inversesqrt(u_xlat28);
    vs_TEXCOORD2.xyz = u_xlat2.xyz * vec3(u_xlat16_8);
    u_xlatb28 = unity_OrthoParams.w==0.0;
    u_xlat2.x = (u_xlatb28) ? u_xlat1.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = (u_xlatb28) ? u_xlat1.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = (u_xlatb28) ? u_xlat1.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = max(u_xlat1.x, 1.17549435e-38);
    u_xlat16_8 = inversesqrt(u_xlat1.x);
    vs_TEXCOORD3.xyz = u_xlat2.xyz * vec3(u_xlat16_8);
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD8.xyz = vec3(0.0, 0.0, 0.0);
    vs_SV_InstanceID0 =  uint(gl_InstanceID);
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
UNITY_BINDING(0) uniform UnityPerMaterial {
	vec4 _SoftParticleFadeParams;
	vec4 _CameraFadeParams;
	vec4 _BaseMap_ST;
	mediump vec4 _BaseColor;
	mediump vec4 _EmissionColor;
	mediump vec4 _BaseColorAddSubDiff;
	mediump float _Cutoff;
	mediump float _DistortionStrengthScaled;
	mediump float _DistortionBlend;
	mediump float _Surface;
};
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
UNITY_LOCATION(1) uniform mediump sampler2D _CameraOpaqueTexture;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 2) in highp vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
float u_xlat2;
float u_xlat3;
mediump float u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat7;
void main()
{
    u_xlat0.xyz = vs_TEXCOORD6.zxy / vs_TEXCOORD6.www;
    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat16_5.xyz = texture(_CameraOpaqueTexture, u_xlat0.yz).xyz;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-_CameraFadeParams.x);
    u_xlat0.x = u_xlat0.x * _CameraFadeParams.y;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_1 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat16_1 * _BaseColor;
    u_xlat2 = u_xlat16_1.w * vs_COLOR0.w;
    u_xlat7.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz + (-u_xlat16_5.xyz);
    u_xlat3 = u_xlat2 * u_xlat0.x + (-_DistortionBlend);
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
    u_xlat16_4 = u_xlat0.x * u_xlat2;
    u_xlat0.xyz = vec3(u_xlat3) * u_xlat7.xyz + u_xlat16_5.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    u_xlatb0 = _Surface==1.0;
    SV_Target0.w = (u_xlatb0) ? u_xlat16_4 : 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "PROCEDURAL_INSTANCING_ON" }
Local Keywords { "_EMISSION" "_FADING_ON" "_SOFTPARTICLES_ON" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	int unity_BaseInstanceID;
uniform 	vec4 unity_ParticleUVShiftData;
uniform 	float unity_ParticleUseMeshColors;
 struct unity_ParticleInstanceData_type {
	uint[14] value;
};

layout(std430, binding = 0) readonly buffer unity_ParticleInstanceData {
	unity_ParticleInstanceData_type unity_ParticleInstanceData_buf[];
};
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
layout(location = 0) out highp vec2 vs_TEXCOORD0;
layout(location = 1) out mediump vec4 vs_COLOR0;
layout(location = 2) out highp vec4 vs_TEXCOORD1;
layout(location = 4) out highp vec3 vs_TEXCOORD2;
layout(location = 5) out highp vec3 vs_TEXCOORD3;
layout(location = 3) out highp vec4 vs_TEXCOORD6;
layout(location = 6) out highp vec3 vs_TEXCOORD8;
layout(location = 7) flat out highp uint vs_SV_InstanceID0;
vec4 u_xlat0;
vec4 u_xlat1;
int u_xlati1;
vec4 u_xlat2;
uvec3 u_xlatu2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
vec3 u_xlat6;
vec4 u_xlat7;
mediump float u_xlat16_8;
vec3 u_xlat10;
bool u_xlatb19;
float u_xlat28;
bool u_xlatb28;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyz;
    u_xlat0.w = 1.0;
    u_xlati1 = gl_InstanceID + unity_BaseInstanceID;
    u_xlat2 = vec4(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 2]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 3]));
    u_xlat3.w = u_xlat2.y;
    u_xlat10.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(12 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(12 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(12 >> 2) + 2]));
    u_xlat3.y = u_xlat10.y;
    u_xlat4.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(24 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(24 >> 2) + 2]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(24 >> 2) + 0]));
    u_xlat3.z = u_xlat4.x;
    u_xlat5.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(0 >> 2) + 2]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(0 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(0 >> 2) + 1]));
    u_xlat1.x = uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(52 >> 2) + 0]);
    u_xlat1.x = floor(u_xlat1.x);
    u_xlat3.x = u_xlat5.z;
    u_xlat6.y = dot(u_xlat3, u_xlat0);
    u_xlat7 = u_xlat6.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat4.w = u_xlat2.x;
    u_xlat5.z = u_xlat4.y;
    u_xlat4.x = u_xlat5.y;
    u_xlat4.y = u_xlat10.x;
    u_xlat5.y = u_xlat10.z;
    u_xlat6.x = dot(u_xlat4, u_xlat0);
    u_xlat7 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat6.xxxx + u_xlat7;
    u_xlat5.w = u_xlat2.z;
    u_xlat6.z = dot(u_xlat5, u_xlat0);
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat6.zzzz + u_xlat7;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat0;
    u_xlat10.x = u_xlat1.x / unity_ParticleUVShiftData.y;
    u_xlat10.x = floor(u_xlat10.x);
    u_xlat1.x = (-u_xlat10.x) * unity_ParticleUVShiftData.y + u_xlat1.x;
    u_xlat1.x = floor(u_xlat1.x);
    u_xlat2.x = u_xlat1.x * unity_ParticleUVShiftData.z;
    u_xlat1.x = (-unity_ParticleUVShiftData.w) + 1.0;
    u_xlat2.y = (-u_xlat10.x) * unity_ParticleUVShiftData.w + u_xlat1.x;
    u_xlat1.xy = in_TEXCOORD0.xy * unity_ParticleUVShiftData.zw + u_xlat2.xy;
    u_xlatb19 = unity_ParticleUVShiftData.x!=0.0;
    vs_TEXCOORD0.xy = (bool(u_xlatb19)) ? u_xlat1.xy : in_TEXCOORD0.xy;
    u_xlat1 = in_COLOR0 + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat1 = vec4(unity_ParticleUseMeshColors) * u_xlat1 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlatu2.x = uint(floatBitsToUint(u_xlat2.w)) & 255u;
    u_xlat7.x = float(u_xlatu2.x);
    u_xlatu2.x = bitfieldExtract(uint(floatBitsToUint(u_xlat2.w)), int(8), int(8));
    u_xlatu2.y = bitfieldExtract(uint(floatBitsToUint(u_xlat2.w)), int(16), int(8));
    u_xlatu2.z = uint(floatBitsToUint(u_xlat2.w)) >> 24u;
    u_xlat7.yzw = vec3(u_xlatu2.xyz);
    u_xlat1 = u_xlat1 * u_xlat7;
    u_xlat1 = u_xlat1 * vec4(0.00392156886, 0.00392156886, 0.00392156886, 0.00392156886);
    vs_COLOR0 = u_xlat1;
    vs_TEXCOORD1.w = 0.0;
    vs_TEXCOORD1.xyz = u_xlat6.xyz;
    u_xlat1.xyz = (-u_xlat6.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2.xyz = u_xlat4.yzx * u_xlat5.zxy;
    u_xlat2.xyz = u_xlat4.zxy * u_xlat5.yzx + (-u_xlat2.xyz);
    u_xlat6.xyz = u_xlat3.zxy * u_xlat5.yzx;
    u_xlat5.xyz = u_xlat3.yzx * u_xlat5.zxy + (-u_xlat6.xyz);
    u_xlat28 = dot(u_xlat4.xyz, u_xlat5.xyz);
    u_xlat28 = float(1.0) / float(u_xlat28);
    u_xlat2.xyz = vec3(u_xlat28) * u_xlat2.xyz;
    u_xlat2.y = dot(in_NORMAL0.xyz, u_xlat2.xyz);
    u_xlat6.xyz = u_xlat3.yzx * u_xlat4.zxy;
    u_xlat3.xyz = u_xlat4.yzx * u_xlat3.zxy + (-u_xlat6.xyz);
    u_xlat3.xyz = vec3(u_xlat28) * u_xlat3.xyz;
    u_xlat4.xyz = vec3(u_xlat28) * u_xlat5.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, u_xlat4.xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, u_xlat3.xyz);
    u_xlat28 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat28 = max(u_xlat28, 1.17549435e-38);
    u_xlat16_8 = inversesqrt(u_xlat28);
    vs_TEXCOORD2.xyz = u_xlat2.xyz * vec3(u_xlat16_8);
    u_xlatb28 = unity_OrthoParams.w==0.0;
    u_xlat2.x = (u_xlatb28) ? u_xlat1.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = (u_xlatb28) ? u_xlat1.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = (u_xlatb28) ? u_xlat1.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = max(u_xlat1.x, 1.17549435e-38);
    u_xlat16_8 = inversesqrt(u_xlat1.x);
    vs_TEXCOORD3.xyz = u_xlat2.xyz * vec3(u_xlat16_8);
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD8.xyz = vec3(0.0, 0.0, 0.0);
    vs_SV_InstanceID0 =  uint(gl_InstanceID);
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
UNITY_BINDING(0) uniform UnityPerMaterial {
	vec4 _SoftParticleFadeParams;
	vec4 _CameraFadeParams;
	vec4 _BaseMap_ST;
	mediump vec4 _BaseColor;
	mediump vec4 _EmissionColor;
	mediump vec4 _BaseColorAddSubDiff;
	mediump float _Cutoff;
	mediump float _DistortionStrengthScaled;
	mediump float _DistortionBlend;
	mediump float _Surface;
};
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
UNITY_LOCATION(1) uniform mediump sampler2D _EmissionMap;
UNITY_LOCATION(2) uniform highp sampler2D _CameraDepthTexture;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 2) in highp vec4 vs_TEXCOORD1;
layout(location = 3) in highp vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump vec3 u_xlat16_1;
bvec2 u_xlatb1;
mediump float u_xlat16_2;
float u_xlat4;
void main()
{
    u_xlat16_0 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * _BaseColor;
    u_xlat0 = u_xlat16_0 * vs_COLOR0;
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), _SoftParticleFadeParams.xyxx).xy;
    u_xlatb1.x = u_xlatb1.y || u_xlatb1.x;
    if(u_xlatb1.x){
        u_xlat1.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
        u_xlat1.x = texture(_CameraDepthTexture, u_xlat1.xy).x;
        u_xlat1.x = _ZBufferParams.z * u_xlat1.x + _ZBufferParams.w;
        u_xlat1.x = float(1.0) / u_xlat1.x;
        u_xlat4 = vs_TEXCOORD1.y * hlslcc_mtx4x4unity_MatrixV[1].z;
        u_xlat4 = hlslcc_mtx4x4unity_MatrixV[0].z * vs_TEXCOORD1.x + u_xlat4;
        u_xlat4 = hlslcc_mtx4x4unity_MatrixV[2].z * vs_TEXCOORD1.z + u_xlat4;
        u_xlat4 = u_xlat4 + hlslcc_mtx4x4unity_MatrixV[3].z;
        u_xlat1.x = u_xlat1.x + (-_SoftParticleFadeParams.x);
        u_xlat1.x = -abs(u_xlat4) + u_xlat1.x;
        u_xlat1.x = u_xlat1.x * _SoftParticleFadeParams.y;
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    } else {
        u_xlat1.x = 1.0;
    }
    u_xlat1.y = 1.0;
    u_xlat16_0 = u_xlat0 * u_xlat1.yyyx;
    u_xlat1.x = vs_TEXCOORD6.z / vs_TEXCOORD6.w;
    u_xlat1.x = _ZBufferParams.z * u_xlat1.x + _ZBufferParams.w;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat1.x = u_xlat1.x + (-_CameraFadeParams.x);
    u_xlat1.x = u_xlat1.x * _CameraFadeParams.y;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat16_2 = u_xlat16_0.w * u_xlat1.x;
    u_xlat16_1.xyz = texture(_EmissionMap, vs_TEXCOORD0.xy).xyz;
    SV_Target0.xyz = u_xlat16_1.xyz * _EmissionColor.xyz + u_xlat16_0.xyz;
    u_xlatb1.x = _Surface==1.0;
    SV_Target0.w = (u_xlatb1.x) ? u_xlat16_2 : 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "PROCEDURAL_INSTANCING_ON" }
Local Keywords { "_ALPHAPREMULTIPLY_ON" "_DISTORTION_ON" "_FADING_ON" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	int unity_BaseInstanceID;
uniform 	vec4 unity_ParticleUVShiftData;
uniform 	float unity_ParticleUseMeshColors;
 struct unity_ParticleInstanceData_type {
	uint[14] value;
};

layout(std430, binding = 0) readonly buffer unity_ParticleInstanceData {
	unity_ParticleInstanceData_type unity_ParticleInstanceData_buf[];
};
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
layout(location = 0) out highp vec2 vs_TEXCOORD0;
layout(location = 1) out mediump vec4 vs_COLOR0;
layout(location = 3) out highp vec4 vs_TEXCOORD1;
layout(location = 4) out highp vec3 vs_TEXCOORD2;
layout(location = 5) out highp vec3 vs_TEXCOORD3;
layout(location = 2) out highp vec4 vs_TEXCOORD6;
layout(location = 6) out highp vec3 vs_TEXCOORD8;
layout(location = 7) flat out highp uint vs_SV_InstanceID0;
vec4 u_xlat0;
vec4 u_xlat1;
int u_xlati1;
vec4 u_xlat2;
uvec3 u_xlatu2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
vec3 u_xlat6;
vec4 u_xlat7;
mediump float u_xlat16_8;
vec3 u_xlat10;
bool u_xlatb19;
float u_xlat28;
bool u_xlatb28;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyz;
    u_xlat0.w = 1.0;
    u_xlati1 = gl_InstanceID + unity_BaseInstanceID;
    u_xlat2 = vec4(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 2]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 3]));
    u_xlat3.w = u_xlat2.y;
    u_xlat10.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(12 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(12 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(12 >> 2) + 2]));
    u_xlat3.y = u_xlat10.y;
    u_xlat4.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(24 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(24 >> 2) + 2]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(24 >> 2) + 0]));
    u_xlat3.z = u_xlat4.x;
    u_xlat5.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(0 >> 2) + 2]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(0 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(0 >> 2) + 1]));
    u_xlat1.x = uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(52 >> 2) + 0]);
    u_xlat1.x = floor(u_xlat1.x);
    u_xlat3.x = u_xlat5.z;
    u_xlat6.y = dot(u_xlat3, u_xlat0);
    u_xlat7 = u_xlat6.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat4.w = u_xlat2.x;
    u_xlat5.z = u_xlat4.y;
    u_xlat4.x = u_xlat5.y;
    u_xlat4.y = u_xlat10.x;
    u_xlat5.y = u_xlat10.z;
    u_xlat6.x = dot(u_xlat4, u_xlat0);
    u_xlat7 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat6.xxxx + u_xlat7;
    u_xlat5.w = u_xlat2.z;
    u_xlat6.z = dot(u_xlat5, u_xlat0);
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat6.zzzz + u_xlat7;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat0;
    u_xlat10.x = u_xlat1.x / unity_ParticleUVShiftData.y;
    u_xlat10.x = floor(u_xlat10.x);
    u_xlat1.x = (-u_xlat10.x) * unity_ParticleUVShiftData.y + u_xlat1.x;
    u_xlat1.x = floor(u_xlat1.x);
    u_xlat2.x = u_xlat1.x * unity_ParticleUVShiftData.z;
    u_xlat1.x = (-unity_ParticleUVShiftData.w) + 1.0;
    u_xlat2.y = (-u_xlat10.x) * unity_ParticleUVShiftData.w + u_xlat1.x;
    u_xlat1.xy = in_TEXCOORD0.xy * unity_ParticleUVShiftData.zw + u_xlat2.xy;
    u_xlatb19 = unity_ParticleUVShiftData.x!=0.0;
    vs_TEXCOORD0.xy = (bool(u_xlatb19)) ? u_xlat1.xy : in_TEXCOORD0.xy;
    u_xlat1 = in_COLOR0 + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat1 = vec4(unity_ParticleUseMeshColors) * u_xlat1 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlatu2.x = uint(floatBitsToUint(u_xlat2.w)) & 255u;
    u_xlat7.x = float(u_xlatu2.x);
    u_xlatu2.x = bitfieldExtract(uint(floatBitsToUint(u_xlat2.w)), int(8), int(8));
    u_xlatu2.y = bitfieldExtract(uint(floatBitsToUint(u_xlat2.w)), int(16), int(8));
    u_xlatu2.z = uint(floatBitsToUint(u_xlat2.w)) >> 24u;
    u_xlat7.yzw = vec3(u_xlatu2.xyz);
    u_xlat1 = u_xlat1 * u_xlat7;
    u_xlat1 = u_xlat1 * vec4(0.00392156886, 0.00392156886, 0.00392156886, 0.00392156886);
    vs_COLOR0 = u_xlat1;
    vs_TEXCOORD1.w = 0.0;
    vs_TEXCOORD1.xyz = u_xlat6.xyz;
    u_xlat1.xyz = (-u_xlat6.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2.xyz = u_xlat4.yzx * u_xlat5.zxy;
    u_xlat2.xyz = u_xlat4.zxy * u_xlat5.yzx + (-u_xlat2.xyz);
    u_xlat6.xyz = u_xlat3.zxy * u_xlat5.yzx;
    u_xlat5.xyz = u_xlat3.yzx * u_xlat5.zxy + (-u_xlat6.xyz);
    u_xlat28 = dot(u_xlat4.xyz, u_xlat5.xyz);
    u_xlat28 = float(1.0) / float(u_xlat28);
    u_xlat2.xyz = vec3(u_xlat28) * u_xlat2.xyz;
    u_xlat2.y = dot(in_NORMAL0.xyz, u_xlat2.xyz);
    u_xlat6.xyz = u_xlat3.yzx * u_xlat4.zxy;
    u_xlat3.xyz = u_xlat4.yzx * u_xlat3.zxy + (-u_xlat6.xyz);
    u_xlat3.xyz = vec3(u_xlat28) * u_xlat3.xyz;
    u_xlat4.xyz = vec3(u_xlat28) * u_xlat5.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, u_xlat4.xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, u_xlat3.xyz);
    u_xlat28 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat28 = max(u_xlat28, 1.17549435e-38);
    u_xlat16_8 = inversesqrt(u_xlat28);
    vs_TEXCOORD2.xyz = u_xlat2.xyz * vec3(u_xlat16_8);
    u_xlatb28 = unity_OrthoParams.w==0.0;
    u_xlat2.x = (u_xlatb28) ? u_xlat1.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = (u_xlatb28) ? u_xlat1.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = (u_xlatb28) ? u_xlat1.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = max(u_xlat1.x, 1.17549435e-38);
    u_xlat16_8 = inversesqrt(u_xlat1.x);
    vs_TEXCOORD3.xyz = u_xlat2.xyz * vec3(u_xlat16_8);
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD8.xyz = vec3(0.0, 0.0, 0.0);
    vs_SV_InstanceID0 =  uint(gl_InstanceID);
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
UNITY_BINDING(0) uniform UnityPerMaterial {
	vec4 _SoftParticleFadeParams;
	vec4 _CameraFadeParams;
	vec4 _BaseMap_ST;
	mediump vec4 _BaseColor;
	mediump vec4 _EmissionColor;
	mediump vec4 _BaseColorAddSubDiff;
	mediump float _Cutoff;
	mediump float _DistortionStrengthScaled;
	mediump float _DistortionBlend;
	mediump float _Surface;
};
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
UNITY_LOCATION(1) uniform mediump sampler2D _CameraOpaqueTexture;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 2) in highp vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
mediump vec3 u_xlat16_6;
float u_xlat15;
void main()
{
    u_xlat16_0 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * _BaseColor;
    u_xlat0 = u_xlat16_0 * vs_COLOR0;
    u_xlat16_1.xyz = u_xlat0.www * u_xlat0.xyz;
    u_xlat2.xyz = vs_TEXCOORD6.zxy / vs_TEXCOORD6.www;
    u_xlat2.x = _ZBufferParams.z * u_xlat2.x + _ZBufferParams.w;
    u_xlat16_6.xyz = texture(_CameraOpaqueTexture, u_xlat2.yz).xyz;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat2.x = u_xlat2.x + (-_CameraFadeParams.x);
    u_xlat2.x = u_xlat2.x * _CameraFadeParams.y;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat3.xyz = u_xlat16_1.xyz * u_xlat2.xxx + (-u_xlat16_6.xyz);
    u_xlat15 = u_xlat0.w * u_xlat2.x + (-_DistortionBlend);
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat16_1.x = u_xlat0.w * u_xlat2.x;
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat3.xyz + u_xlat16_6.xyz;
    SV_Target0.xyz = u_xlat2.xyz;
    u_xlatb2 = _Surface==1.0;
    SV_Target0.w = (u_xlatb2) ? u_xlat16_1.x : 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "PROCEDURAL_INSTANCING_ON" }
Local Keywords { "_ALPHATEST_ON" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	int unity_BaseInstanceID;
uniform 	vec4 unity_ParticleUVShiftData;
uniform 	float unity_ParticleUseMeshColors;
 struct unity_ParticleInstanceData_type {
	uint[14] value;
};

layout(std430, binding = 0) readonly buffer unity_ParticleInstanceData {
	unity_ParticleInstanceData_type unity_ParticleInstanceData_buf[];
};
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
layout(location = 0) out highp vec2 vs_TEXCOORD0;
layout(location = 1) out mediump vec4 vs_COLOR0;
layout(location = 2) out highp vec4 vs_TEXCOORD1;
layout(location = 3) out highp vec3 vs_TEXCOORD2;
layout(location = 4) out highp vec3 vs_TEXCOORD3;
layout(location = 5) out highp vec3 vs_TEXCOORD8;
layout(location = 6) flat out highp uint vs_SV_InstanceID0;
vec4 u_xlat0;
vec4 u_xlat1;
int u_xlati1;
uint u_xlatu1;
vec4 u_xlat2;
uvec3 u_xlatu2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
vec3 u_xlat6;
vec4 u_xlat7;
mediump float u_xlat16_8;
float u_xlat9;
vec3 u_xlat10;
bool u_xlatb18;
float u_xlat27;
bool u_xlatb27;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyz;
    u_xlat0.w = 1.0;
    u_xlati1 = gl_InstanceID + unity_BaseInstanceID;
    u_xlat2 = vec4(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 2]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 3]));
    u_xlat3.w = u_xlat2.y;
    u_xlat10.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(12 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(12 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(12 >> 2) + 2]));
    u_xlat3.y = u_xlat10.y;
    u_xlat4.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(24 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(24 >> 2) + 2]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(24 >> 2) + 0]));
    u_xlat3.z = u_xlat4.x;
    u_xlat5.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(0 >> 2) + 2]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(0 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(0 >> 2) + 1]));
    u_xlat1.x = uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(52 >> 2) + 0]);
    u_xlat1.x = floor(u_xlat1.x);
    u_xlat3.x = u_xlat5.z;
    u_xlat6.y = dot(u_xlat3, u_xlat0);
    u_xlat7 = u_xlat6.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat4.w = u_xlat2.x;
    u_xlat5.z = u_xlat4.y;
    u_xlat4.x = u_xlat5.y;
    u_xlat4.y = u_xlat10.x;
    u_xlat5.y = u_xlat10.z;
    u_xlat6.x = dot(u_xlat4, u_xlat0);
    u_xlat7 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat6.xxxx + u_xlat7;
    u_xlat5.w = u_xlat2.z;
    u_xlat6.z = dot(u_xlat5, u_xlat0);
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat6.zzzz + u_xlat7;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat0.x = u_xlat1.x / unity_ParticleUVShiftData.y;
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat9 = (-u_xlat0.x) * unity_ParticleUVShiftData.y + u_xlat1.x;
    u_xlat9 = floor(u_xlat9);
    u_xlat1.x = u_xlat9 * unity_ParticleUVShiftData.z;
    u_xlat9 = (-unity_ParticleUVShiftData.w) + 1.0;
    u_xlat1.y = (-u_xlat0.x) * unity_ParticleUVShiftData.w + u_xlat9;
    u_xlat0.xy = in_TEXCOORD0.xy * unity_ParticleUVShiftData.zw + u_xlat1.xy;
    u_xlatb18 = unity_ParticleUVShiftData.x!=0.0;
    vs_TEXCOORD0.xy = (bool(u_xlatb18)) ? u_xlat0.xy : in_TEXCOORD0.xy;
    u_xlat0 = in_COLOR0 + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat0 = vec4(unity_ParticleUseMeshColors) * u_xlat0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlatu1 = uint(floatBitsToUint(u_xlat2.w)) & 255u;
    u_xlat1.x = float(u_xlatu1);
    u_xlatu2.x = bitfieldExtract(uint(floatBitsToUint(u_xlat2.w)), int(8), int(8));
    u_xlatu2.y = bitfieldExtract(uint(floatBitsToUint(u_xlat2.w)), int(16), int(8));
    u_xlatu2.z = uint(floatBitsToUint(u_xlat2.w)) >> 24u;
    u_xlat1.yzw = vec3(u_xlatu2.xyz);
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat0 = u_xlat0 * vec4(0.00392156886, 0.00392156886, 0.00392156886, 0.00392156886);
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD1.w = 0.0;
    vs_TEXCOORD1.xyz = u_xlat6.xyz;
    u_xlat0.xyz = (-u_xlat6.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.xyz = u_xlat4.yzx * u_xlat5.zxy;
    u_xlat1.xyz = u_xlat4.zxy * u_xlat5.yzx + (-u_xlat1.xyz);
    u_xlat2.xyz = u_xlat3.zxy * u_xlat5.yzx;
    u_xlat2.xyz = u_xlat3.yzx * u_xlat5.zxy + (-u_xlat2.xyz);
    u_xlat27 = dot(u_xlat4.xyz, u_xlat2.xyz);
    u_xlat27 = float(1.0) / float(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat1.xyz;
    u_xlat1.y = dot(in_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat5.xyz = u_xlat3.yzx * u_xlat4.zxy;
    u_xlat3.xyz = u_xlat4.yzx * u_xlat3.zxy + (-u_xlat5.xyz);
    u_xlat3.xyz = vec3(u_xlat27) * u_xlat3.xyz;
    u_xlat2.xyz = vec3(u_xlat27) * u_xlat2.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, u_xlat2.xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, u_xlat3.xyz);
    u_xlat27 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat27 = max(u_xlat27, 1.17549435e-38);
    u_xlat16_8 = inversesqrt(u_xlat27);
    vs_TEXCOORD2.xyz = u_xlat1.xyz * vec3(u_xlat16_8);
    u_xlatb27 = unity_OrthoParams.w==0.0;
    u_xlat1.x = (u_xlatb27) ? u_xlat0.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = (u_xlatb27) ? u_xlat0.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = (u_xlatb27) ? u_xlat0.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat16_8 = inversesqrt(u_xlat0.x);
    vs_TEXCOORD3.xyz = u_xlat1.xyz * vec3(u_xlat16_8);
    vs_TEXCOORD8.xyz = vec3(0.0, 0.0, 0.0);
    vs_SV_InstanceID0 =  uint(gl_InstanceID);
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
UNITY_BINDING(0) uniform UnityPerMaterial {
	vec4 _SoftParticleFadeParams;
	vec4 _CameraFadeParams;
	vec4 _BaseMap_ST;
	mediump vec4 _BaseColor;
	mediump vec4 _EmissionColor;
	mediump vec4 _BaseColorAddSubDiff;
	mediump float _Cutoff;
	mediump float _DistortionStrengthScaled;
	mediump float _DistortionBlend;
	mediump float _Surface;
};
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump float u_xlat16_1;
bool u_xlatb2;
void main()
{
    u_xlat16_0 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * _BaseColor;
    u_xlat16_1 = u_xlat16_0.w * vs_COLOR0.w + (-_Cutoff);
    u_xlat0 = u_xlat16_0 * vs_COLOR0;
    u_xlatb2 = u_xlat16_1<0.0;
    if(u_xlatb2){discard;}
    u_xlatb2 = _Surface==1.0;
    SV_Target0.w = (u_xlatb2) ? u_xlat0.w : 1.0;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "PROCEDURAL_INSTANCING_ON" }
Local Keywords { "_COLOROVERLAY_ON" "_EMISSION" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	int unity_BaseInstanceID;
uniform 	vec4 unity_ParticleUVShiftData;
uniform 	float unity_ParticleUseMeshColors;
 struct unity_ParticleInstanceData_type {
	uint[14] value;
};

layout(std430, binding = 0) readonly buffer unity_ParticleInstanceData {
	unity_ParticleInstanceData_type unity_ParticleInstanceData_buf[];
};
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
layout(location = 0) out highp vec2 vs_TEXCOORD0;
layout(location = 1) out mediump vec4 vs_COLOR0;
layout(location = 2) out highp vec4 vs_TEXCOORD1;
layout(location = 3) out highp vec3 vs_TEXCOORD2;
layout(location = 4) out highp vec3 vs_TEXCOORD3;
layout(location = 5) out highp vec3 vs_TEXCOORD8;
layout(location = 6) flat out highp uint vs_SV_InstanceID0;
vec4 u_xlat0;
vec4 u_xlat1;
int u_xlati1;
uint u_xlatu1;
vec4 u_xlat2;
uvec3 u_xlatu2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
vec3 u_xlat6;
vec4 u_xlat7;
mediump float u_xlat16_8;
float u_xlat9;
vec3 u_xlat10;
bool u_xlatb18;
float u_xlat27;
bool u_xlatb27;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyz;
    u_xlat0.w = 1.0;
    u_xlati1 = gl_InstanceID + unity_BaseInstanceID;
    u_xlat2 = vec4(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 2]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 3]));
    u_xlat3.w = u_xlat2.y;
    u_xlat10.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(12 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(12 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(12 >> 2) + 2]));
    u_xlat3.y = u_xlat10.y;
    u_xlat4.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(24 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(24 >> 2) + 2]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(24 >> 2) + 0]));
    u_xlat3.z = u_xlat4.x;
    u_xlat5.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(0 >> 2) + 2]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(0 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(0 >> 2) + 1]));
    u_xlat1.x = uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(52 >> 2) + 0]);
    u_xlat1.x = floor(u_xlat1.x);
    u_xlat3.x = u_xlat5.z;
    u_xlat6.y = dot(u_xlat3, u_xlat0);
    u_xlat7 = u_xlat6.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat4.w = u_xlat2.x;
    u_xlat5.z = u_xlat4.y;
    u_xlat4.x = u_xlat5.y;
    u_xlat4.y = u_xlat10.x;
    u_xlat5.y = u_xlat10.z;
    u_xlat6.x = dot(u_xlat4, u_xlat0);
    u_xlat7 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat6.xxxx + u_xlat7;
    u_xlat5.w = u_xlat2.z;
    u_xlat6.z = dot(u_xlat5, u_xlat0);
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat6.zzzz + u_xlat7;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat0.x = u_xlat1.x / unity_ParticleUVShiftData.y;
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat9 = (-u_xlat0.x) * unity_ParticleUVShiftData.y + u_xlat1.x;
    u_xlat9 = floor(u_xlat9);
    u_xlat1.x = u_xlat9 * unity_ParticleUVShiftData.z;
    u_xlat9 = (-unity_ParticleUVShiftData.w) + 1.0;
    u_xlat1.y = (-u_xlat0.x) * unity_ParticleUVShiftData.w + u_xlat9;
    u_xlat0.xy = in_TEXCOORD0.xy * unity_ParticleUVShiftData.zw + u_xlat1.xy;
    u_xlatb18 = unity_ParticleUVShiftData.x!=0.0;
    vs_TEXCOORD0.xy = (bool(u_xlatb18)) ? u_xlat0.xy : in_TEXCOORD0.xy;
    u_xlat0 = in_COLOR0 + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat0 = vec4(unity_ParticleUseMeshColors) * u_xlat0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlatu1 = uint(floatBitsToUint(u_xlat2.w)) & 255u;
    u_xlat1.x = float(u_xlatu1);
    u_xlatu2.x = bitfieldExtract(uint(floatBitsToUint(u_xlat2.w)), int(8), int(8));
    u_xlatu2.y = bitfieldExtract(uint(floatBitsToUint(u_xlat2.w)), int(16), int(8));
    u_xlatu2.z = uint(floatBitsToUint(u_xlat2.w)) >> 24u;
    u_xlat1.yzw = vec3(u_xlatu2.xyz);
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat0 = u_xlat0 * vec4(0.00392156886, 0.00392156886, 0.00392156886, 0.00392156886);
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD1.w = 0.0;
    vs_TEXCOORD1.xyz = u_xlat6.xyz;
    u_xlat0.xyz = (-u_xlat6.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.xyz = u_xlat4.yzx * u_xlat5.zxy;
    u_xlat1.xyz = u_xlat4.zxy * u_xlat5.yzx + (-u_xlat1.xyz);
    u_xlat2.xyz = u_xlat3.zxy * u_xlat5.yzx;
    u_xlat2.xyz = u_xlat3.yzx * u_xlat5.zxy + (-u_xlat2.xyz);
    u_xlat27 = dot(u_xlat4.xyz, u_xlat2.xyz);
    u_xlat27 = float(1.0) / float(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat1.xyz;
    u_xlat1.y = dot(in_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat5.xyz = u_xlat3.yzx * u_xlat4.zxy;
    u_xlat3.xyz = u_xlat4.yzx * u_xlat3.zxy + (-u_xlat5.xyz);
    u_xlat3.xyz = vec3(u_xlat27) * u_xlat3.xyz;
    u_xlat2.xyz = vec3(u_xlat27) * u_xlat2.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, u_xlat2.xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, u_xlat3.xyz);
    u_xlat27 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat27 = max(u_xlat27, 1.17549435e-38);
    u_xlat16_8 = inversesqrt(u_xlat27);
    vs_TEXCOORD2.xyz = u_xlat1.xyz * vec3(u_xlat16_8);
    u_xlatb27 = unity_OrthoParams.w==0.0;
    u_xlat1.x = (u_xlatb27) ? u_xlat0.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = (u_xlatb27) ? u_xlat0.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = (u_xlatb27) ? u_xlat0.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat16_8 = inversesqrt(u_xlat0.x);
    vs_TEXCOORD3.xyz = u_xlat1.xyz * vec3(u_xlat16_8);
    vs_TEXCOORD8.xyz = vec3(0.0, 0.0, 0.0);
    vs_SV_InstanceID0 =  uint(gl_InstanceID);
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
UNITY_BINDING(0) uniform UnityPerMaterial {
	vec4 _SoftParticleFadeParams;
	vec4 _CameraFadeParams;
	vec4 _BaseMap_ST;
	mediump vec4 _BaseColor;
	mediump vec4 _EmissionColor;
	mediump vec4 _BaseColorAddSubDiff;
	mediump float _Cutoff;
	mediump float _DistortionStrengthScaled;
	mediump float _DistortionBlend;
	mediump float _Surface;
};
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
UNITY_LOCATION(1) uniform mediump sampler2D _EmissionMap;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
bvec3 u_xlatb3;
float u_xlat13;
void main()
{
    u_xlat16_0 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat1.xyz = (-u_xlat16_0.xyz) * _BaseColor.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_0 = u_xlat16_0 * _BaseColor;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat1.xyz;
    u_xlat2.xyz = (-vs_COLOR0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = (-u_xlat1.xyz) * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat16_0.xyz + u_xlat16_0.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vs_COLOR0.xyz + (-u_xlat1.xyz);
    u_xlatb3.xyz = greaterThanEqual(vec4(0.5, 0.5, 0.5, 0.0), u_xlat16_0.xyzx).xyz;
    u_xlat13 = u_xlat16_0.w * vs_COLOR0.w;
    u_xlat3.x = u_xlatb3.x ? float(1.0) : 0.0;
    u_xlat3.y = u_xlatb3.y ? float(1.0) : 0.0;
    u_xlat3.z = u_xlatb3.z ? float(1.0) : 0.0;
;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat16_2.xyz = texture(_EmissionMap, vs_TEXCOORD0.xy).xyz;
    SV_Target0.xyz = u_xlat16_2.xyz * _EmissionColor.xyz + u_xlat1.xyz;
    u_xlatb1 = _Surface==1.0;
    SV_Target0.w = (u_xlatb1) ? u_xlat13 : 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "PROCEDURAL_INSTANCING_ON" }
Local Keywords { "_COLORADDSUBDIFF_ON" "_EMISSION" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	int unity_BaseInstanceID;
uniform 	vec4 unity_ParticleUVShiftData;
uniform 	float unity_ParticleUseMeshColors;
 struct unity_ParticleInstanceData_type {
	uint[14] value;
};

layout(std430, binding = 0) readonly buffer unity_ParticleInstanceData {
	unity_ParticleInstanceData_type unity_ParticleInstanceData_buf[];
};
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
layout(location = 0) out highp vec2 vs_TEXCOORD0;
layout(location = 1) out mediump vec4 vs_COLOR0;
layout(location = 2) out highp vec4 vs_TEXCOORD1;
layout(location = 3) out highp vec3 vs_TEXCOORD2;
layout(location = 4) out highp vec3 vs_TEXCOORD3;
layout(location = 5) out highp vec3 vs_TEXCOORD8;
layout(location = 6) flat out highp uint vs_SV_InstanceID0;
vec4 u_xlat0;
vec4 u_xlat1;
int u_xlati1;
uint u_xlatu1;
vec4 u_xlat2;
uvec3 u_xlatu2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
vec3 u_xlat6;
vec4 u_xlat7;
mediump float u_xlat16_8;
float u_xlat9;
vec3 u_xlat10;
bool u_xlatb18;
float u_xlat27;
bool u_xlatb27;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyz;
    u_xlat0.w = 1.0;
    u_xlati1 = gl_InstanceID + unity_BaseInstanceID;
    u_xlat2 = vec4(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 2]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(36 >> 2) + 3]));
    u_xlat3.w = u_xlat2.y;
    u_xlat10.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(12 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(12 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(12 >> 2) + 2]));
    u_xlat3.y = u_xlat10.y;
    u_xlat4.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(24 >> 2) + 1]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(24 >> 2) + 2]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(24 >> 2) + 0]));
    u_xlat3.z = u_xlat4.x;
    u_xlat5.xyz = vec3(uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(0 >> 2) + 2]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(0 >> 2) + 0]), uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(0 >> 2) + 1]));
    u_xlat1.x = uintBitsToFloat(unity_ParticleInstanceData_buf[u_xlati1].value[(52 >> 2) + 0]);
    u_xlat1.x = floor(u_xlat1.x);
    u_xlat3.x = u_xlat5.z;
    u_xlat6.y = dot(u_xlat3, u_xlat0);
    u_xlat7 = u_xlat6.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat4.w = u_xlat2.x;
    u_xlat5.z = u_xlat4.y;
    u_xlat4.x = u_xlat5.y;
    u_xlat4.y = u_xlat10.x;
    u_xlat5.y = u_xlat10.z;
    u_xlat6.x = dot(u_xlat4, u_xlat0);
    u_xlat7 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat6.xxxx + u_xlat7;
    u_xlat5.w = u_xlat2.z;
    u_xlat6.z = dot(u_xlat5, u_xlat0);
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat6.zzzz + u_xlat7;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat0.x = u_xlat1.x / unity_ParticleUVShiftData.y;
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat9 = (-u_xlat0.x) * unity_ParticleUVShiftData.y + u_xlat1.x;
    u_xlat9 = floor(u_xlat9);
    u_xlat1.x = u_xlat9 * unity_ParticleUVShiftData.z;
    u_xlat9 = (-unity_ParticleUVShiftData.w) + 1.0;
    u_xlat1.y = (-u_xlat0.x) * unity_ParticleUVShiftData.w + u_xlat9;
    u_xlat0.xy = in_TEXCOORD0.xy * unity_ParticleUVShiftData.zw + u_xlat1.xy;
    u_xlatb18 = unity_ParticleUVShiftData.x!=0.0;
    vs_TEXCOORD0.xy = (bool(u_xlatb18)) ? u_xlat0.xy : in_TEXCOORD0.xy;
    u_xlat0 = in_COLOR0 + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat0 = vec4(unity_ParticleUseMeshColors) * u_xlat0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlatu1 = uint(floatBitsToUint(u_xlat2.w)) & 255u;
    u_xlat1.x = float(u_xlatu1);
    u_xlatu2.x = bitfieldExtract(uint(floatBitsToUint(u_xlat2.w)), int(8), int(8));
    u_xlatu2.y = bitfieldExtract(uint(floatBitsToUint(u_xlat2.w)), int(16), int(8));
    u_xlatu2.z = uint(floatBitsToUint(u_xlat2.w)) >> 24u;
    u_xlat1.yzw = vec3(u_xlatu2.xyz);
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat0 = u_xlat0 * vec4(0.00392156886, 0.00392156886, 0.00392156886, 0.00392156886);
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD1.w = 0.0;
    vs_TEXCOORD1.xyz = u_xlat6.xyz;
    u_xlat0.xyz = (-u_xlat6.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.xyz = u_xlat4.yzx * u_xlat5.zxy;
    u_xlat1.xyz = u_xlat4.zxy * u_xlat5.yzx + (-u_xlat1.xyz);
    u_xlat2.xyz = u_xlat3.zxy * u_xlat5.yzx;
    u_xlat2.xyz = u_xlat3.yzx * u_xlat5.zxy + (-u_xlat2.xyz);
    u_xlat27 = dot(u_xlat4.xyz, u_xlat2.xyz);
    u_xlat27 = float(1.0) / float(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat1.xyz;
    u_xlat1.y = dot(in_NORMAL0.xyz, u_xlat1.xyz);
    u_xlat5.xyz = u_xlat3.yzx * u_xlat4.zxy;
    u_xlat3.xyz = u_xlat4.yzx * u_xlat3.zxy + (-u_xlat5.xyz);
    u_xlat3.xyz = vec3(u_xlat27) * u_xlat3.xyz;
    u_xlat2.xyz = vec3(u_xlat27) * u_xlat2.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, u_xlat2.xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, u_xlat3.xyz);
    u_xlat27 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat27 = max(u_xlat27, 1.17549435e-38);
    u_xlat16_8 = inversesqrt(u_xlat27);
    vs_TEXCOORD2.xyz = u_xlat1.xyz * vec3(u_xlat16_8);
    u_xlatb27 = unity_OrthoParams.w==0.0;
    u_xlat1.x = (u_xlatb27) ? u_xlat0.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = (u_xlatb27) ? u_xlat0.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = (u_xlatb27) ? u_xlat0.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat16_8 = inversesqrt(u_xlat0.x);
    vs_TEXCOORD3.xyz = u_xlat1.xyz * vec3(u_xlat16_8);
    vs_TEXCOORD8.xyz = vec3(0.0, 0.0, 0.0);
    vs_SV_InstanceID0 =  uint(gl_InstanceID);
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
UNITY_BINDING(0) uniform UnityPerMaterial {
	vec4 _SoftParticleFadeParams;
	vec4 _CameraFadeParams;
	vec4 _BaseMap_ST;
	mediump vec4 _BaseColor;
	mediump vec4 _EmissionColor;
	mediump vec4 _BaseColorAddSubDiff;
	mediump float _Cutoff;
	mediump float _DistortionStrengthScaled;
	mediump float _DistortionBlend;
	mediump float _Surface;
};
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
UNITY_LOCATION(1) uniform mediump sampler2D _EmissionMap;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
float u_xlat10;
void main()
{
    u_xlat16_0 = texture(_BaseMap, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * _BaseColor;
    u_xlat1.xyz = vs_COLOR0.xyz * _BaseColorAddSubDiff.xxx + u_xlat16_0.xyz;
    u_xlat10 = u_xlat16_0.w * vs_COLOR0.w;
    u_xlat2.xyz = (-u_xlat1.xyz) + abs(u_xlat1.xyz);
    u_xlat1.xyz = _BaseColorAddSubDiff.yyy * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat16_2.xyz = texture(_EmissionMap, vs_TEXCOORD0.xy).xyz;
    SV_Target0.xyz = u_xlat16_2.xyz * _EmissionColor.xyz + u_xlat1.xyz;
    u_xlatb1 = _Surface==1.0;
    SV_Target0.w = (u_xlatb1) ? u_xlat10 : 1.0;
    return;
}

#endif
"
}
}
}
}
CustomEditor "UnityEditor.Rendering.Universal.ShaderGUI.ParticlesUnlitShader"
}