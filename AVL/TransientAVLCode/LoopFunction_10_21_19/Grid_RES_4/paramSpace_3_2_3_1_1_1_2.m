function [aeroForces] = paramSpace_3_2_3_1_1_1_2(sailStates,airStates)

	CL = (5.425332)*sailStates.alpha + (-0.125794)*sailStates.beta + (-2.491518)*sailStates.p + (32.411606)*sailStates.q + (-1.441872)*sailStates.r + (0.010487)*sailStates.de;
	CD = -1.689840;
	CY = (-0.202608)*sailStates.alpha + (-0.025640)*sailStates.beta + (-0.693104)*sailStates.p + (-1.693498)*sailStates.q + (0.045369)*sailStates.r + (-0.000365)*sailStates.de;

	Cl = (1.198072)*sailStates.alpha + (0.383187)*sailStates.beta + (-1.195351)*sailStates.p + (9.316417)*sailStates.q + (-1.475919)*sailStates.r + (0.000349)*sailStates.de;
	Cm = (-14.573486)*sailStates.alpha + (0.501969)*sailStates.beta + (9.054230)*sailStates.p + (-136.398376)*sailStates.q + (4.899633)*sailStates.r + (-0.069983)*sailStates.de;
	Cn = (-0.178079)*sailStates.alpha + (-0.027581)*sailStates.beta + (1.683647)*sailStates.p + (-6.684343)*sailStates.q + (-0.008390)*sailStates.r + (0.000335)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end