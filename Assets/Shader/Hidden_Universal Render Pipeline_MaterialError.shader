//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Universal Render Pipeline/MaterialError" {
Properties {
}
SubShader {
 Pass {
  GpuProgramID 62737
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
    return;
}

#endif
#ifdef FRAGMENT
#version 310 es

precision highp float;
precision highp int;
layout(location = 0) out highp vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(1.0, 0.0, 1.0, 1.0);
    return;
}

#endif
"
}
}
}
}
}