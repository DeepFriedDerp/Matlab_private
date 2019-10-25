function [aeroForces] = paramSpace_3_2_1_3_2_3_1(sailStates,airStates)

	CL = (4.274818)*sailStates.alpha + (0.061699)*sailStates.beta + (-2.323787)*sailStates.p + (33.616703)*sailStates.q + (0.939298)*sailStates.r + (0.011120)*sailStates.de;
	CD = -0.173180;
	CY = (-0.029625)*sailStates.alpha + (-0.024960)*sailStates.beta + (0.351030)*sailStates.p + (0.065300)*sailStates.q + (-0.023015)*sailStates.r + (0.000014)*sailStates.de;

	Cl = (1.211841)*sailStates.alpha + (-0.157749)*sailStates.beta + (-1.017336)*sailStates.p + (8.220875)*sailStates.q + (0.776741)*sailStates.r + (0.000046)*sailStates.de;
	Cm = (-14.422580)*sailStates.alpha + (-0.210131)*sailStates.beta + (7.747637)*sailStates.p + (-130.047943)*sailStates.q + (-3.155691)*sailStates.r + (-0.069357)*sailStates.de;
	Cn = (0.227730)*sailStates.alpha + (0.011868)*sailStates.beta + (-0.752321)*sailStates.p + (3.329639)*sailStates.q + (0.002530)*sailStates.r + (0.000056)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end