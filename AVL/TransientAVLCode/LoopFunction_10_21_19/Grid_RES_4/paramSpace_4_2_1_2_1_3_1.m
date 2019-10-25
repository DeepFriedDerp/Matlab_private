function [aeroForces] = paramSpace_4_2_1_2_1_3_1(sailStates,airStates)

	CL = (4.799542)*sailStates.alpha + (0.139383)*sailStates.beta + (-2.148538)*sailStates.p + (35.633972)*sailStates.q + (2.034847)*sailStates.r + (0.011287)*sailStates.de;
	CD = -0.621250;
	CY = (-0.191471)*sailStates.alpha + (-0.025413)*sailStates.beta + (0.741194)*sailStates.p + (-0.455227)*sailStates.q + (-0.147384)*sailStates.r + (-0.000096)*sailStates.de;

	Cl = (1.435834)*sailStates.alpha + (-0.309182)*sailStates.beta + (-0.871837)*sailStates.p + (8.029628)*sailStates.q + (1.625522)*sailStates.r + (-0.000184)*sailStates.de;
	Cm = (-12.588126)*sailStates.alpha + (-0.490467)*sailStates.beta + (6.005932)*sailStates.p + (-122.911674)*sailStates.q + (-6.716067)*sailStates.r + (-0.066547)*sailStates.de;
	Cn = (0.664093)*sailStates.alpha + (0.071684)*sailStates.beta + (-1.556318)*sailStates.p + (7.047778)*sailStates.q + (0.020413)*sailStates.r + (0.000254)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end