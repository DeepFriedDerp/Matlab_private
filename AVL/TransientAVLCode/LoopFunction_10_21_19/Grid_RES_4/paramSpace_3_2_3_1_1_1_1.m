function [aeroForces] = paramSpace_3_2_3_1_1_1_1(sailStates,airStates)

	CL = (5.089978)*sailStates.alpha + (-0.131190)*sailStates.beta + (-1.606860)*sailStates.p + (25.243666)*sailStates.q + (-1.558686)*sailStates.r + (0.010103)*sailStates.de;
	CD = -1.708510;
	CY = (0.092181)*sailStates.alpha + (-0.025553)*sailStates.beta + (-0.729113)*sailStates.p + (-1.471503)*sailStates.q + (0.047737)*sailStates.r + (-0.000312)*sailStates.de;

	Cl = (0.523329)*sailStates.alpha + (0.388366)*sailStates.beta + (-0.472658)*sailStates.p + (2.610017)*sailStates.q + (-1.571140)*sailStates.r + (-0.000798)*sailStates.de;
	Cm = (-13.655623)*sailStates.alpha + (0.520426)*sailStates.beta + (6.101103)*sailStates.p + (-112.102478)*sailStates.q + (5.292832)*sailStates.r + (-0.067743)*sailStates.de;
	Cn = (-1.372260)*sailStates.alpha + (-0.028121)*sailStates.beta + (1.710065)*sailStates.p + (-6.743402)*sailStates.q + (-0.006995)*sailStates.r + (0.000295)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end