function [aeroForces] = paramSpace_2_4_3_1_3_1_1(sailStates,airStates)

	CL = (7.260332)*sailStates.alpha + (0.621968)*sailStates.beta + (-1.703443)*sailStates.p + (30.279676)*sailStates.q + (-2.875614)*sailStates.r + (0.011021)*sailStates.de;
	CD = -2.941010;
	CY = (0.694148)*sailStates.alpha + (-0.023372)*sailStates.beta + (-1.355623)*sailStates.p + (1.471503)*sailStates.q + (-0.088800)*sailStates.r + (0.000310)*sailStates.de;

	Cl = (2.105875)*sailStates.alpha + (0.797019)*sailStates.beta + (-0.435066)*sailStates.p + (3.132713)*sailStates.q + (-2.557834)*sailStates.r + (-0.000964)*sailStates.de;
	Cm = (-13.854765)*sailStates.alpha + (-2.371757)*sailStates.beta + (5.049842)*sailStates.p + (-111.058342)*sailStates.q + (9.720922)*sailStates.r + (-0.066700)*sailStates.de;
	Cn = (-2.723704)*sailStates.alpha + (0.034818)*sailStates.beta + (2.987082)*sailStates.p + (-14.719384)*sailStates.q + (0.029929)*sailStates.r + (-0.000620)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end