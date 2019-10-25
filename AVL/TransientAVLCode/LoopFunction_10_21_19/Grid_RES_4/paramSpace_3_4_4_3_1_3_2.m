function [aeroForces] = paramSpace_3_4_4_3_1_3_2(sailStates,airStates)

	CL = (4.334164)*sailStates.alpha + (-0.271472)*sailStates.beta + (-2.558775)*sailStates.p + (35.535927)*sailStates.q + (1.126613)*sailStates.r + (0.010984)*sailStates.de;
	CD = -0.245940;
	CY = (-0.063231)*sailStates.alpha + (-0.024097)*sailStates.beta + (0.486182)*sailStates.p + (-0.498142)*sailStates.q + (-0.031919)*sailStates.r + (-0.000107)*sailStates.de;

	Cl = (1.330475)*sailStates.alpha + (-0.293678)*sailStates.beta + (-1.152086)*sailStates.p + (9.323836)*sailStates.q + (0.976142)*sailStates.r + (0.000198)*sailStates.de;
	Cm = (-14.215820)*sailStates.alpha + (1.113568)*sailStates.beta + (8.482903)*sailStates.p + (-135.916275)*sailStates.q + (-3.843073)*sailStates.r + (-0.068978)*sailStates.de;
	Cn = (0.187556)*sailStates.alpha + (0.012828)*sailStates.beta + (-0.994857)*sailStates.p + (4.551354)*sailStates.q + (0.005953)*sailStates.r + (0.000207)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end