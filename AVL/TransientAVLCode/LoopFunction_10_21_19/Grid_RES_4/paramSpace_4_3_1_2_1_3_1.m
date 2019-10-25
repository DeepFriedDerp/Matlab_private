function [aeroForces] = paramSpace_4_3_1_2_1_3_1(sailStates,airStates)

	CL = (4.799542)*sailStates.alpha + (-0.139383)*sailStates.beta + (-2.148538)*sailStates.p + (35.633972)*sailStates.q + (2.034847)*sailStates.r + (0.011287)*sailStates.de;
	CD = -0.621250;
	CY = (-0.191471)*sailStates.alpha + (-0.024539)*sailStates.beta + (0.741194)*sailStates.p + (-0.455227)*sailStates.q + (-0.147384)*sailStates.r + (-0.000096)*sailStates.de;

	Cl = (1.387385)*sailStates.alpha + (-0.394782)*sailStates.beta + (-0.840289)*sailStates.p + (7.632663)*sailStates.q + (1.619290)*sailStates.r + (-0.000269)*sailStates.de;
	Cm = (-12.588126)*sailStates.alpha + (0.490468)*sailStates.beta + (6.005932)*sailStates.p + (-122.911674)*sailStates.q + (-6.716066)*sailStates.r + (-0.066547)*sailStates.de;
	Cn = (0.705699)*sailStates.alpha + (0.068343)*sailStates.beta + (-1.562594)*sailStates.p + (7.126739)*sailStates.q + (0.021653)*sailStates.r + (0.000254)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end