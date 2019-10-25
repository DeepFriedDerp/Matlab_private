function [aeroForces] = paramSpace_3_2_2_3_1_3_2(sailStates,airStates)

	CL = (4.411940)*sailStates.alpha + (0.076523)*sailStates.beta + (-2.578795)*sailStates.p + (35.769100)*sailStates.q + (1.111771)*sailStates.r + (0.011212)*sailStates.de;
	CD = -0.243840;
	CY = (-0.063701)*sailStates.alpha + (-0.025136)*sailStates.beta + (0.456994)*sailStates.p + (-0.498142)*sailStates.q + (-0.029935)*sailStates.r + (-0.000107)*sailStates.de;

	Cl = (1.442387)*sailStates.alpha + (-0.183943)*sailStates.beta + (-1.226689)*sailStates.p + (10.203033)*sailStates.q + (0.934577)*sailStates.r + (0.000376)*sailStates.de;
	Cm = (-14.567074)*sailStates.alpha + (-0.281544)*sailStates.beta + (8.556131)*sailStates.p + (-136.960373)*sailStates.q + (-3.751220)*sailStates.r + (-0.070040)*sailStates.de;
	Cn = (0.146448)*sailStates.alpha + (0.014065)*sailStates.beta + (-0.947375)*sailStates.p + (4.477248)*sailStates.q + (0.006060)*sailStates.r + (0.000228)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end