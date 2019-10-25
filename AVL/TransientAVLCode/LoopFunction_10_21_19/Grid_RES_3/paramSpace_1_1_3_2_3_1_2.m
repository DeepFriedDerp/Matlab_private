function [aeroForces] = paramSpace_1_1_3_2_3_1_2(sailStates,airStates)

	CL = (4.828084)*sailStates.alpha + (-0.371982)*sailStates.beta + (-2.535632)*sailStates.p + (38.264229)*sailStates.q + (-2.078046)*sailStates.r + (0.011339)*sailStates.de;
	CD = -0.628060;
	CY = (0.104383)*sailStates.alpha + (-0.026556)*sailStates.beta + (-0.769442)*sailStates.p + (0.759374)*sailStates.q + (-0.135601)*sailStates.r + (0.000161)*sailStates.de;

	Cl = (1.694074)*sailStates.alpha + (0.230892)*sailStates.beta + (-1.218845)*sailStates.p + (11.230802)*sailStates.q + (-1.684138)*sailStates.r + (0.000400)*sailStates.de;
	Cm = (-13.106025)*sailStates.alpha + (1.318464)*sailStates.beta + (7.444869)*sailStates.p + (-133.652283)*sailStates.q + (6.891549)*sailStates.r + (-0.067356)*sailStates.de;
	Cn = (-0.124572)*sailStates.alpha + (0.065623)*sailStates.beta + (1.556973)*sailStates.p + (-7.019907)*sailStates.q + (0.015175)*sailStates.r + (-0.000356)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end