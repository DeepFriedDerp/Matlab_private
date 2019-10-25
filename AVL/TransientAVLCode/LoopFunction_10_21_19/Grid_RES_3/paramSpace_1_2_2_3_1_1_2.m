function [aeroForces] = paramSpace_1_2_2_3_1_1_2(sailStates,airStates)

	CL = (4.106041)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.560290)*sailStates.p + (37.243542)*sailStates.q + (-1.413402)*sailStates.r + (0.011166)*sailStates.de;
	CD = -0.133800;
	CY = (-0.064533)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.424170)*sailStates.p + (-0.491629)*sailStates.q + (-0.074793)*sailStates.r + (-0.000105)*sailStates.de;

	Cl = (1.208825)*sailStates.alpha + (0.231696)*sailStates.beta + (-1.196861)*sailStates.p + (10.412672)*sailStates.q + (-1.113447)*sailStates.r + (0.000365)*sailStates.de;
	Cm = (-13.059693)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.081321)*sailStates.p + (-136.151047)*sailStates.q + (4.735854)*sailStates.r + (-0.068436)*sailStates.de;
	Cn = (0.086239)*sailStates.alpha + (0.040854)*sailStates.beta + (0.799555)*sailStates.p + (-2.598378)*sailStates.q + (-0.018136)*sailStates.r + (0.000071)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end