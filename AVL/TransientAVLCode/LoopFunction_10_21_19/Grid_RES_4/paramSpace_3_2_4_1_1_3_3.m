function [aeroForces] = paramSpace_3_2_4_1_1_3_3(sailStates,airStates)

	CL = (7.374583)*sailStates.alpha + (0.233363)*sailStates.beta + (-3.491800)*sailStates.p + (44.914772)*sailStates.q + (3.129268)*sailStates.r + (0.011993)*sailStates.de;
	CD = -3.032650;
	CY = (0.277496)*sailStates.alpha + (-0.025862)*sailStates.beta + (1.458071)*sailStates.p + (-1.915491)*sailStates.q + (-0.095769)*sailStates.r + (-0.000419)*sailStates.de;

	Cl = (3.078877)*sailStates.alpha + (-0.581036)*sailStates.beta + (-1.954578)*sailStates.p + (17.427731)*sailStates.q + (2.802077)*sailStates.r + (0.001535)*sailStates.de;
	Cm = (-14.349888)*sailStates.alpha + (-0.921697)*sailStates.beta + (11.016156)*sailStates.p + (-160.694275)*sailStates.q + (-10.616362)*sailStates.r + (-0.072651)*sailStates.de;
	Cn = (-1.548904)*sailStates.alpha + (0.044775)*sailStates.beta + (-3.080549)*sailStates.p + (14.809560)*sailStates.q + (0.026565)*sailStates.r + (0.000831)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end