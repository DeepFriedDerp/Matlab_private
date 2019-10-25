function [aeroForces] = paramSpace_2_4_3_2_1_3_2(sailStates,airStates)

	CL = (4.624118)*sailStates.alpha + (-0.204708)*sailStates.beta + (-2.528661)*sailStates.p + (33.444492)*sailStates.q + (0.883464)*sailStates.r + (0.010648)*sailStates.de;
	CD = -0.543790;
	CY = (-0.092272)*sailStates.alpha + (-0.025526)*sailStates.beta + (0.533639)*sailStates.p + (-0.769434)*sailStates.q + (0.034949)*sailStates.r + (-0.000165)*sailStates.de;

	Cl = (1.432432)*sailStates.alpha + (-0.292193)*sailStates.beta + (-1.146546)*sailStates.p + (8.775172)*sailStates.q + (0.896479)*sailStates.r + (0.000226)*sailStates.de;
	Cm = (-15.303910)*sailStates.alpha + (0.835565)*sailStates.beta + (9.004158)*sailStates.p + (-136.512222)*sailStates.q + (-2.994903)*sailStates.r + (-0.069038)*sailStates.de;
	Cn = (0.382017)*sailStates.alpha + (-0.012501)*sailStates.beta + (-1.232931)*sailStates.p + (6.328048)*sailStates.q + (-0.017133)*sailStates.r + (0.000316)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end