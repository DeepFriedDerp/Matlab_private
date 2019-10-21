function [aeroForces] = paramSpace_1_2_1_1_2_1_1(sailStates,airStates)

	CL = (5.505053)*sailStates.alpha + (-0.799812)*sailStates.beta + (-6.101337)*sailStates.p + (55.617317)*sailStates.q + (2.529837)*sailStates.r + (0.010957)*sailStates.de;
	CD = -8.420120;
	CY = (2.813375)*sailStates.alpha + (-0.017232)*sailStates.beta + (1.424704)*sailStates.p + (4.419172)*sailStates.q + (0.188192)*sailStates.r + (0.001005)*sailStates.de;

	Cl = (-1.528911)*sailStates.alpha + (-1.028336)*sailStates.beta + (-4.202212)*sailStates.p + (36.103943)*sailStates.q + (2.745563)*sailStates.r + (0.005531)*sailStates.de;
	Cm = (8.102304)*sailStates.alpha + (3.378950)*sailStates.beta + (22.861551)*sailStates.p + (-240.364853)*sailStates.q + (-8.581351)*sailStates.r + (-0.082636)*sailStates.de;
	Cn = (-10.563505)*sailStates.alpha + (-0.103846)*sailStates.beta + (-3.867993)*sailStates.p + (16.414089)*sailStates.q + (-0.076744)*sailStates.r + (-0.000812)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end