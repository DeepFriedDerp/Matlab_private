function [aeroForces] = paramSpace_3_1_2_2_3_1_2(sailStates,airStates)

	CL = (4.624119)*sailStates.alpha + (-0.204708)*sailStates.beta + (-2.528661)*sailStates.p + (33.444492)*sailStates.q + (-0.883464)*sailStates.r + (0.010648)*sailStates.de;
	CD = -0.543790;
	CY = (0.092272)*sailStates.alpha + (-0.024046)*sailStates.beta + (-0.533639)*sailStates.p + (0.769434)*sailStates.q + (0.034949)*sailStates.r + (0.000165)*sailStates.de;

	Cl = (1.585431)*sailStates.alpha + (0.176375)*sailStates.beta + (-1.244244)*sailStates.p + (9.983734)*sailStates.q + (-0.890118)*sailStates.r + (0.000486)*sailStates.de;
	Cm = (-15.303910)*sailStates.alpha + (0.835565)*sailStates.beta + (9.004158)*sailStates.p + (-136.512222)*sailStates.q + (2.994903)*sailStates.r + (-0.069038)*sailStates.de;
	Cn = (-0.330245)*sailStates.alpha + (-0.018211)*sailStates.beta + (1.239335)*sailStates.p + (-6.407261)*sailStates.q + (-0.017550)*sailStates.r + (-0.000316)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end