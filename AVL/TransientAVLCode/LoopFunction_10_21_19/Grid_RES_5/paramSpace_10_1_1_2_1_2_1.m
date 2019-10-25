function [aeroForces] = paramSpace_10_1_1_2_1_2_1(sailStates,airStates)

	CL = (4.299720)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.364599)*sailStates.p + (33.956169)*sailStates.q + (0.957231)*sailStates.r + (0.011139)*sailStates.de;
	CD = -0.148770;
	CY = (-0.077705)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.368817)*sailStates.p + (-0.351849)*sailStates.q + (-0.025753)*sailStates.r + (-0.000076)*sailStates.de;

	Cl = (1.258908)*sailStates.alpha + (-0.170190)*sailStates.beta + (-1.035828)*sailStates.p + (8.362705)*sailStates.q + (0.773613)*sailStates.r + (0.000053)*sailStates.de;
	Cm = (-14.588822)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.868847)*sailStates.p + (-131.203201)*sailStates.q + (-3.209222)*sailStates.r + (-0.069551)*sailStates.de;
	Cn = (0.256063)*sailStates.alpha + (0.011901)*sailStates.beta + (-0.774355)*sailStates.p + (3.721445)*sailStates.q + (0.004806)*sailStates.r + (0.000178)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end