function [aeroForces] = paramSpace_2_2_2_2_1_2_2(sailStates,airStates)

	CL = (5.163957)*sailStates.alpha + (-3.913235)*sailStates.beta + (-3.438440)*sailStates.p + (47.202091)*sailStates.q + (2.139001)*sailStates.r + (0.010355)*sailStates.de;
	CD = -5.775740;
	CY = (1.764335)*sailStates.alpha + (-0.272667)*sailStates.beta + (0.296736)*sailStates.p + (15.497581)*sailStates.q + (-0.028090)*sailStates.r + (0.002950)*sailStates.de;

	Cl = (-5.374928)*sailStates.alpha + (-1.216211)*sailStates.beta + (-1.665510)*sailStates.p + (14.110601)*sailStates.q + (2.402484)*sailStates.r + (0.001216)*sailStates.de;
	Cm = (5.361945)*sailStates.alpha + (17.960257)*sailStates.beta + (10.727796)*sailStates.p + (-151.213638)*sailStates.q + (-7.638810)*sailStates.r + (-0.055260)*sailStates.de;
	Cn = (-1.794105)*sailStates.alpha + (0.386886)*sailStates.beta + (-0.859698)*sailStates.p + (-9.089970)*sailStates.q + (-0.203583)*sailStates.r + (-0.003892)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end