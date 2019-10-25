function [aeroForces] = paramSpace_1_2_2_2_1_3_3(sailStates,airStates)

	CL = (4.287290)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.844620)*sailStates.p + (35.216976)*sailStates.q + (0.195212)*sailStates.r + (0.010310)*sailStates.de;
	CD = -0.416060;
	CY = (0.002977)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.350703)*sailStates.p + (-0.491417)*sailStates.q + (0.061838)*sailStates.r + (-0.000105)*sailStates.de;

	Cl = (1.511025)*sailStates.alpha + (-0.155749)*sailStates.beta + (-1.485802)*sailStates.p + (12.065844)*sailStates.q + (0.389345)*sailStates.r + (0.000903)*sailStates.de;
	Cm = (-15.070447)*sailStates.alpha + (0.000000)*sailStates.beta + (10.415662)*sailStates.p + (-147.390610)*sailStates.q + (-0.583803)*sailStates.r + (-0.069614)*sailStates.de;
	Cn = (0.169211)*sailStates.alpha + (-0.027463)*sailStates.beta + (-1.015265)*sailStates.p + (5.843846)*sailStates.q + (-0.064171)*sailStates.r + (0.000227)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end