function [aeroForces] = paramSpace_2_2_1_2_2_2_2(sailStates,airStates)

	CL = (5.417774)*sailStates.alpha + (-3.892806)*sailStates.beta + (-3.482487)*sailStates.p + (47.759270)*sailStates.q + (2.208529)*sailStates.r + (0.010550)*sailStates.de;
	CD = -6.237750;
	CY = (1.821676)*sailStates.alpha + (-0.254131)*sailStates.beta + (0.291981)*sailStates.p + (15.935324)*sailStates.q + (-0.029411)*sailStates.r + (0.003036)*sailStates.de;

	Cl = (-5.649221)*sailStates.alpha + (-1.245238)*sailStates.beta + (-1.694208)*sailStates.p + (14.399580)*sailStates.q + (2.454017)*sailStates.r + (0.001263)*sailStates.de;
	Cm = (5.987814)*sailStates.alpha + (17.522831)*sailStates.beta + (10.836753)*sailStates.p + (-152.298370)*sailStates.q + (-7.828000)*sailStates.r + (-0.055381)*sailStates.de;
	Cn = (-1.890087)*sailStates.alpha + (0.357332)*sailStates.beta + (-0.878925)*sailStates.p + (-9.182683)*sailStates.q + (-0.200059)*sailStates.r + (-0.003966)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end