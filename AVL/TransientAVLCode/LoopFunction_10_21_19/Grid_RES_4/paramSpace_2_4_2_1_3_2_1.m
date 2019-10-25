function [aeroForces] = paramSpace_2_4_2_1_3_2_1(sailStates,airStates)

	CL = (3.852696)*sailStates.alpha + (0.125030)*sailStates.beta + (-1.645304)*sailStates.p + (27.636669)*sailStates.q + (-0.660842)*sailStates.r + (0.010468)*sailStates.de;
	CD = -0.037090;
	CY = (0.302858)*sailStates.alpha + (-0.023061)*sailStates.beta + (-0.320242)*sailStates.p + (1.471502)*sailStates.q + (-0.021042)*sailStates.r + (0.000310)*sailStates.de;

	Cl = (0.639472)*sailStates.alpha + (0.138164)*sailStates.beta + (-0.416636)*sailStates.p + (2.431396)*sailStates.q + (-0.501750)*sailStates.r + (-0.000964)*sailStates.de;
	Cm = (-13.609674)*sailStates.alpha + (-0.472879)*sailStates.beta + (5.540808)*sailStates.p + (-111.058342)*sailStates.q + (2.230236)*sailStates.r + (-0.066700)*sailStates.de;
	Cn = (-0.690839)*sailStates.alpha + (0.004012)*sailStates.beta + (0.651004)*sailStates.p + (-4.019357)*sailStates.q + (0.011621)*sailStates.r + (-0.000455)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end