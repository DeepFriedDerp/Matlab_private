function [aeroForces] = paramSpace_2_2_2_2_2_2_2(sailStates,airStates)

	CL = (5.407076)*sailStates.alpha + (-4.068443)*sailStates.beta + (-3.491121)*sailStates.p + (47.976685)*sailStates.q + (2.260123)*sailStates.r + (0.010478)*sailStates.de;
	CD = -6.364820;
	CY = (1.839894)*sailStates.alpha + (-0.280781)*sailStates.beta + (0.331433)*sailStates.p + (15.998533)*sailStates.q + (-0.032303)*sailStates.r + (0.003048)*sailStates.de;

	Cl = (-5.899161)*sailStates.alpha + (-1.281189)*sailStates.beta + (-1.700305)*sailStates.p + (14.476608)*sailStates.q + (2.529346)*sailStates.r + (0.001273)*sailStates.de;
	Cm = (6.689927)*sailStates.alpha + (18.592365)*sailStates.beta + (10.835149)*sailStates.p + (-152.525909)*sailStates.q + (-8.053465)*sailStates.r + (-0.055407)*sailStates.de;
	Cn = (-1.913694)*sailStates.alpha + (0.399685)*sailStates.beta + (-0.949289)*sailStates.p + (-9.077487)*sailStates.q + (-0.208515)*sailStates.r + (-0.004009)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end