function [aeroForces] = paramSpace_4_3_3_2_2_3_1(sailStates,airStates)

	CL = (4.460052)*sailStates.alpha + (-0.144424)*sailStates.beta + (-2.169603)*sailStates.p + (35.605907)*sailStates.q + (1.857264)*sailStates.r + (0.011118)*sailStates.de;
	CD = -0.483750;
	CY = (-0.071229)*sailStates.alpha + (-0.025307)*sailStates.beta + (0.649714)*sailStates.p + (0.301045)*sailStates.q + (-0.129225)*sailStates.r + (0.000063)*sailStates.de;

	Cl = (1.148321)*sailStates.alpha + (-0.374961)*sailStates.beta + (-0.853553)*sailStates.p + (7.597748)*sailStates.q + (1.506641)*sailStates.r + (-0.000219)*sailStates.de;
	Cm = (-11.945086)*sailStates.alpha + (0.548714)*sailStates.beta + (6.247097)*sailStates.p + (-123.990753)*sailStates.q + (-6.180361)*sailStates.r + (-0.066646)*sailStates.de;
	Cn = (0.516561)*sailStates.alpha + (0.066196)*sailStates.beta + (-1.352259)*sailStates.p + (5.428563)*sailStates.q + (0.003005)*sailStates.r + (0.000010)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end