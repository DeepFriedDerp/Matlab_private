function [aeroForces] = paramSpace_4_4_4_2_1_3_2(sailStates,airStates)

	CL = (4.728710)*sailStates.alpha + (-0.499495)*sailStates.beta + (-2.515104)*sailStates.p + (38.812786)*sailStates.q + (2.207871)*sailStates.r + (0.011048)*sailStates.de;
	CD = -0.632670;
	CY = (-0.105284)*sailStates.alpha + (-0.022144)*sailStates.beta + (0.830359)*sailStates.p + (-0.756269)*sailStates.q + (-0.165250)*sailStates.r + (-0.000159)*sailStates.de;

	Cl = (1.580348)*sailStates.alpha + (-0.523293)*sailStates.beta + (-1.117075)*sailStates.p + (10.231284)*sailStates.q + (1.805041)*sailStates.r + (0.000150)*sailStates.de;
	Cm = (-12.150698)*sailStates.alpha + (1.928561)*sailStates.beta + (7.167234)*sailStates.p + (-132.741791)*sailStates.q + (-7.348286)*sailStates.r + (-0.066554)*sailStates.de;
	Cn = (0.220380)*sailStates.alpha + (0.070361)*sailStates.beta + (-1.667891)*sailStates.p + (7.312673)*sailStates.q + (0.016725)*sailStates.r + (0.000330)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end