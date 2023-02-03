//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Universal Render Pipeline/ScreenSpaceShadows" {
Properties {
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "RenderPipeline" = "UniversalPipeline" }
 Pass {
  Name "ScreenSpaceShadows"
  Tags { "IGNOREPROJECTOR" = "true" "RenderPipeline" = "UniversalPipeline" }
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 62378
Program "vp" {
SubProgram "gles " {
Keywords { "_MAIN_LIGHT_SHADOWS" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat16_2.xyz = u_xlat0.xyw * vec3(0.5, 0.5, 0.5);
    u_xlat0.zw = u_xlat16_2.zz + u_xlat16_2.xy;
    u_xlat0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0 = u_xlat0;
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
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4_MainLightWorldToShadow[20];
uniform 	vec4 _CascadeShadowSplitSpheres0;
uniform 	vec4 _CascadeShadowSplitSpheres1;
uniform 	vec4 _CascadeShadowSplitSpheres2;
uniform 	vec4 _CascadeShadowSplitSpheres3;
uniform 	vec4 _CascadeShadowSplitSphereRadii;
uniform 	mediump vec4 _MainLightShadowParams;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _MainLightShadowmapTexture;
varying mediump vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec4 u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
bool u_xlatb4;
mediump float u_xlat16_7;
int u_xlati12;
int u_xlatu12;
int op_shl(int a, int b) { return int(floor(float(a) * pow(2.0, float(b)))); }
ivec2 op_shl(ivec2 a, ivec2 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); return a; }
ivec3 op_shl(ivec3 a, ivec3 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); a.z = op_shl(a.z, b.z); return a; }
ivec4 op_shl(ivec4 a, ivec4 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); a.z = op_shl(a.z, b.z); a.w = op_shl(a.w, b.w); return a; }

#define UNITY_DYNAMIC_INDEX_ES2 0



vec4 hlslcc_mtx4x4_MainLightWorldToShadowDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return hlslcc_mtx4x4_MainLightWorldToShadow[i];
#else
#define d_ar hlslcc_mtx4x4_MainLightWorldToShadow
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8]; else if (i == 9) return d_ar[9]; else if (i == 10) return d_ar[10]; else if (i == 11) return d_ar[11]; else if (i == 12) return d_ar[12]; else if (i == 13) return d_ar[13]; else if (i == 14) return d_ar[14]; else if (i == 15) return d_ar[15]; else if (i == 16) return d_ar[16]; else if (i == 17) return d_ar[17]; else if (i == 18) return d_ar[18]; else if (i == 19) return d_ar[19];
    return d_ar[0];
#undef d_ar
#endif
}

void main()
{
    u_xlat0.xy = vs_TEXCOORD0.zw * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraInvProjection[1];
    u_xlat0 = hlslcc_mtx4x4unity_CameraInvProjection[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1.x = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat1.x = u_xlat1.x * 2.0 + -1.0;
    u_xlat0 = hlslcc_mtx4x4unity_CameraInvProjection[2] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraInvProjection[3];
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.0, 1.0, -1.0);
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-_CascadeShadowSplitSpheres0.xyz);
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat2.xyz = u_xlat0.xyz + (-_CascadeShadowSplitSpheres1.xyz);
    u_xlat1.y = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.xyz = u_xlat0.xyz + (-_CascadeShadowSplitSpheres2.xyz);
    u_xlat1.z = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.xyz = u_xlat0.xyz + (-_CascadeShadowSplitSpheres3.xyz);
    u_xlat1.w = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlatb1 = lessThan(u_xlat1, _CascadeShadowSplitSphereRadii);
    u_xlat16_3.x = (u_xlatb1.x) ? float(-1.0) : float(-0.0);
    u_xlat16_3.y = (u_xlatb1.y) ? float(-1.0) : float(-0.0);
    u_xlat16_3.z = (u_xlatb1.z) ? float(-1.0) : float(-0.0);
    u_xlat16_1.x = (u_xlatb1.x) ? float(1.0) : float(0.0);
    u_xlat16_1.y = (u_xlatb1.y) ? float(1.0) : float(0.0);
    u_xlat16_1.z = (u_xlatb1.z) ? float(1.0) : float(0.0);
    u_xlat16_1.w = (u_xlatb1.w) ? float(1.0) : float(0.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_1.yzw;
    u_xlat16_1.yzw = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.x = dot(u_xlat16_1, vec4(4.0, 3.0, 2.0, 1.0));
    u_xlat16_3.x = (-u_xlat16_3.x) + 4.0;
    u_xlatu12 = int(u_xlat16_3.x);
    u_xlati12 = op_shl(int(u_xlatu12), 2);
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4_MainLightWorldToShadowDynamicIndex((u_xlati12 + 1)).xyz;
    u_xlat2.xyz = hlslcc_mtx4x4_MainLightWorldToShadowDynamicIndex(u_xlati12).xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_MainLightWorldToShadowDynamicIndex((u_xlati12 + 2)).xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4_MainLightWorldToShadowDynamicIndex((u_xlati12 + 3)).xyz;
    u_xlat0.x = texture2D(_MainLightShadowmapTexture, u_xlat0.xy).x;
    u_xlatb0 = u_xlat0.x<u_xlat0.z;
    u_xlat16_3.x = (u_xlatb0) ? 0.0 : _MainLightShadowParams.x;
    u_xlat16_7 = (-_MainLightShadowParams.x) + 1.0;
    u_xlat16_3.x = u_xlat16_3.x + u_xlat16_7;
    u_xlatb0 = 0.0>=u_xlat0.z;
    u_xlatb4 = u_xlat0.z>=1.0;
    u_xlatb0 = u_xlatb4 || u_xlatb0;
    SV_Target0 = (bool(u_xlatb0)) ? vec4(1.0, 1.0, 1.0, 1.0) : u_xlat16_3.xxxx;
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
out mediump vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat16_2.xyz = u_xlat0.xyw * vec3(0.5, 0.5, 0.5);
    u_xlat0.zw = u_xlat16_2.zz + u_xlat16_2.xy;
    u_xlat0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0 = u_xlat0;
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
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4_MainLightWorldToShadow[20];
uniform 	vec4 _CascadeShadowSplitSpheres0;
uniform 	vec4 _CascadeShadowSplitSpheres1;
uniform 	vec4 _CascadeShadowSplitSpheres2;
uniform 	vec4 _CascadeShadowSplitSpheres3;
uniform 	vec4 _CascadeShadowSplitSphereRadii;
uniform 	mediump vec4 _MainLightShadowParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainLightShadowmapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_MainLightShadowmapTexture;
UNITY_LOCATION(2) uniform highp sampler2D _CameraDepthTexture;
in mediump vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec4 u_xlatb1;
vec3 u_xlat2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
bool u_xlatb4;
int u_xlati12;
uint u_xlatu12;
bool u_xlatb12;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.zw * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraInvProjection[1];
    u_xlat0 = hlslcc_mtx4x4unity_CameraInvProjection[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1.x = texture(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat1.x = u_xlat1.x * 2.0 + -1.0;
    u_xlat0 = hlslcc_mtx4x4unity_CameraInvProjection[2] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraInvProjection[3];
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.0, 1.0, -1.0);
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-_CascadeShadowSplitSpheres0.xyz);
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat2.xyz = u_xlat0.xyz + (-_CascadeShadowSplitSpheres1.xyz);
    u_xlat1.y = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.xyz = u_xlat0.xyz + (-_CascadeShadowSplitSpheres2.xyz);
    u_xlat1.z = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.xyz = u_xlat0.xyz + (-_CascadeShadowSplitSpheres3.xyz);
    u_xlat1.w = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlatb1 = lessThan(u_xlat1, _CascadeShadowSplitSphereRadii);
    u_xlat16_3.x = (u_xlatb1.x) ? float(-1.0) : float(-0.0);
    u_xlat16_3.y = (u_xlatb1.y) ? float(-1.0) : float(-0.0);
    u_xlat16_3.z = (u_xlatb1.z) ? float(-1.0) : float(-0.0);
    u_xlat16_1.x = (u_xlatb1.x) ? float(1.0) : float(0.0);
    u_xlat16_1.y = (u_xlatb1.y) ? float(1.0) : float(0.0);
    u_xlat16_1.z = (u_xlatb1.z) ? float(1.0) : float(0.0);
    u_xlat16_1.w = (u_xlatb1.w) ? float(1.0) : float(0.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_1.yzw;
    u_xlat16_1.yzw = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.x = dot(u_xlat16_1, vec4(4.0, 3.0, 2.0, 1.0));
    u_xlat16_3.x = (-u_xlat16_3.x) + 4.0;
    u_xlatu12 = uint(u_xlat16_3.x);
    u_xlati12 = int(int(u_xlatu12) << 2);
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4_MainLightWorldToShadow[(u_xlati12 + 1)].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[u_xlati12].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_MainLightWorldToShadow[(u_xlati12 + 2)].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4_MainLightWorldToShadow[(u_xlati12 + 3)].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0>=u_xlat0.z);
#else
    u_xlatb12 = 0.0>=u_xlat0.z;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat0.z>=1.0);
#else
    u_xlatb2 = u_xlat0.z>=1.0;
#endif
    vec3 txVec0 = vec3(u_xlat0.xy,u_xlat0.z);
    u_xlat16_0 = textureLod(hlslcc_zcmp_MainLightShadowmapTexture, txVec0, 0.0);
    u_xlatb4 = u_xlatb12 || u_xlatb2;
    u_xlat16_3.x = (-_MainLightShadowParams.x) + 1.0;
    u_xlat16_3.x = u_xlat16_0 * _MainLightShadowParams.x + u_xlat16_3.x;
    SV_Target0 = (bool(u_xlatb4)) ? vec4(1.0, 1.0, 1.0, 1.0) : u_xlat16_3.xxxx;
    return;
}

#endif
"
}
}
}
}
}