function [aeroForces] = paramSpace_1_1_3_1_3_2_1(sailStates,airStates)

	CL = (3.774841)*sailStates.alpha + (-0.206288)*sailStates.beta + (-1.560163)*sailStates.p + (27.999407)*sailStates.q + (-1.058586)*sailStates.r + (0.010130)*sailStates.de;
	CD = -0.040380;
	CY = (0.271666)*sailStates.alpha + (-0.027872)*sailStates.beta + (-0.372229)*sailStates.p + (1.002334)*sailStates.q + (-0.074005)*sailStates.r + (0.000207)*sailStates.de;

	Cl = (0.829152)*sailStates.alpha + (0.084293)*sailStates.beta + (-0.471441)*sailStates.p + (3.773927)*sailStates.q + (-0.739361)*sailStates.r + (-0.000755)*sailStates.de;
	Cm = (-12.529502)*sailStates.alpha + (0.707566)*sailStates.beta + (4.791084)*sailStates.p + (-107.565659)*sailStates.q + (3.505333)*sailStates.r + (-0.064308)*sailStates.de;
	Cn = (-0.707209)*sailStates.alpha + (0.033841)*sailStates.beta + (0.763708)*sailStates.p + (-4.165707)*sailStates.q + (0.023409)*sailStates.r + (-0.000323)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end