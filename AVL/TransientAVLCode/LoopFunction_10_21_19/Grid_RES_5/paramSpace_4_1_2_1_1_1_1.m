function [aeroForces] = paramSpace_4_1_2_1_1_1_1(sailStates,airStates)

	CL = (4.480365)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.119414)*sailStates.p + (34.149742)*sailStates.q + (-1.608079)*sailStates.r + (0.011266)*sailStates.de;
	CD = -0.603880;
	CY = (-0.041964)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.568836)*sailStates.p + (-1.241893)*sailStates.q + (-0.079901)*sailStates.r + (-0.000264)*sailStates.de;

	Cl = (0.911973)*sailStates.alpha + (0.334228)*sailStates.beta + (-0.813187)*sailStates.p + (6.799794)*sailStates.q + (-1.377256)*sailStates.r + (-0.000272)*sailStates.de;
	Cm = (-12.271149)*sailStates.alpha + (0.000000)*sailStates.beta + (6.479409)*sailStates.p + (-123.350212)*sailStates.q + (5.423193)*sailStates.r + (-0.067889)*sailStates.de;
	Cn = (-0.495057)*sailStates.alpha + (0.046973)*sailStates.beta + (1.230667)*sailStates.p + (-4.365780)*sailStates.q + (-0.004652)*sailStates.r + (0.000266)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end