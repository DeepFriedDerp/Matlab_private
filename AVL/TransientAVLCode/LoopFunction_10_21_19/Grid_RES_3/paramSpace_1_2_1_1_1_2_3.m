function [aeroForces] = paramSpace_1_2_1_1_1_2_3(sailStates,airStates)

	CL = (3.407082)*sailStates.alpha + (0.000000)*sailStates.beta + (-3.405434)*sailStates.p + (42.298229)*sailStates.q + (-0.769893)*sailStates.r + (0.011108)*sailStates.de;
	CD = 0.093680;
	CY = (-0.150850)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.045498)*sailStates.p + (-1.081941)*sailStates.q + (-0.007920)*sailStates.r + (-0.000234)*sailStates.de;

	Cl = (1.230287)*sailStates.alpha + (0.065899)*sailStates.beta + (-1.906550)*sailStates.p + (16.543041)*sailStates.q + (-0.534867)*sailStates.r + (0.001596)*sailStates.de;
	Cm = (-12.430149)*sailStates.alpha + (-0.000000)*sailStates.beta + (11.611255)*sailStates.p + (-161.621323)*sailStates.q + (2.662106)*sailStates.r + (-0.071238)*sailStates.de;
	Cn = (0.429708)*sailStates.alpha + (0.011620)*sailStates.beta + (-0.184318)*sailStates.p + (3.011983)*sailStates.q + (-0.067913)*sailStates.r + (0.000336)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end