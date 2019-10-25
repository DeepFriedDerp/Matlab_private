function [aeroForces] = paramSpace_2_1_3_2_3_3_3(sailStates,airStates)

	CL = (4.271255)*sailStates.alpha + (0.210000)*sailStates.beta + (-2.966758)*sailStates.p + (37.979282)*sailStates.q + (0.817979)*sailStates.r + (0.011164)*sailStates.de;
	CD = -0.355710;
	CY = (0.157744)*sailStates.alpha + (-0.024637)*sailStates.beta + (0.373014)*sailStates.p + (0.771086)*sailStates.q + (0.000072)*sailStates.r + (0.000167)*sailStates.de;

	Cl = (1.407791)*sailStates.alpha + (-0.167959)*sailStates.beta + (-1.580236)*sailStates.p + (13.300278)*sailStates.q + (0.811159)*sailStates.r + (0.000992)*sailStates.de;
	Cm = (-14.129699)*sailStates.alpha + (-0.901422)*sailStates.beta + (10.133630)*sailStates.p + (-147.758499)*sailStates.q + (-2.823861)*sailStates.r + (-0.070714)*sailStates.de;
	Cn = (-0.248457)*sailStates.alpha + (-0.000228)*sailStates.beta + (-0.845160)*sailStates.p + (3.161824)*sailStates.q + (-0.000367)*sailStates.r + (-0.000162)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end