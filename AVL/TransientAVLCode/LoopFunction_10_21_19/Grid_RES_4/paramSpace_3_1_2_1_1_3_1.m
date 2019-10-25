function [aeroForces] = paramSpace_3_1_2_1_1_3_1(sailStates,airStates)

	CL = (7.260332)*sailStates.alpha + (0.621968)*sailStates.beta + (-1.703443)*sailStates.p + (30.279676)*sailStates.q + (2.875615)*sailStates.r + (0.011021)*sailStates.de;
	CD = -2.941010;
	CY = (-0.694148)*sailStates.alpha + (-0.026201)*sailStates.beta + (1.355623)*sailStates.p + (-1.471503)*sailStates.q + (-0.088800)*sailStates.r + (-0.000310)*sailStates.de;

	Cl = (2.281691)*sailStates.alpha + (-0.427907)*sailStates.beta + (-0.532765)*sailStates.p + (4.341272)*sailStates.q + (2.564195)*sailStates.r + (-0.000709)*sailStates.de;
	Cm = (-13.854766)*sailStates.alpha + (-2.371758)*sailStates.beta + (5.049843)*sailStates.p + (-111.058342)*sailStates.q + (-9.720922)*sailStates.r + (-0.066700)*sailStates.de;
	Cn = (2.550069)*sailStates.alpha + (0.045468)*sailStates.beta + (-2.980678)*sailStates.p + (14.640170)*sailStates.q + (0.029512)*sailStates.r + (0.000620)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end