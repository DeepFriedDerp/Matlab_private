function [aeroForces] = paramSpace_3_4_1_1_1_3_1(sailStates,airStates)

	CL = (7.236919)*sailStates.alpha + (-0.600573)*sailStates.beta + (-1.703607)*sailStates.p + (30.263487)*sailStates.q + (2.868260)*sailStates.r + (0.011050)*sailStates.de;
	CD = -2.909460;
	CY = (-0.688766)*sailStates.alpha + (-0.023682)*sailStates.beta + (1.341016)*sailStates.p + (-1.471504)*sailStates.q + (-0.087740)*sailStates.r + (-0.000310)*sailStates.de;

	Cl = (2.095977)*sailStates.alpha + (-0.790369)*sailStates.beta + (-0.435156)*sailStates.p + (3.131947)*sailStates.q + (2.534881)*sailStates.r + (-0.000964)*sailStates.de;
	Cm = (-13.914817)*sailStates.alpha + (2.237991)*sailStates.beta + (5.052541)*sailStates.p + (-111.058342)*sailStates.q + (-9.679746)*sailStates.r + (-0.066700)*sailStates.de;
	Cn = (2.707966)*sailStates.alpha + (0.035063)*sailStates.beta + (-2.965518)*sailStates.p + (14.707690)*sailStates.q + (0.029695)*sailStates.r + (0.000624)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end