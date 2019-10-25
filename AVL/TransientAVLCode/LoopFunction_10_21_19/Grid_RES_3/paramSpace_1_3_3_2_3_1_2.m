function [aeroForces] = paramSpace_1_3_3_2_3_1_2(sailStates,airStates)

	CL = (4.828084)*sailStates.alpha + (0.371981)*sailStates.beta + (-2.535632)*sailStates.p + (38.264229)*sailStates.q + (-2.078046)*sailStates.r + (0.011339)*sailStates.de;
	CD = -0.628060;
	CY = (0.104383)*sailStates.alpha + (-0.023105)*sailStates.beta + (-0.769442)*sailStates.p + (0.759374)*sailStates.q + (-0.135601)*sailStates.r + (0.000161)*sailStates.de;

	Cl = (1.577269)*sailStates.alpha + (0.470752)*sailStates.beta + (-1.134193)*sailStates.p + (10.169930)*sailStates.q + (-1.669312)*sailStates.r + (0.000172)*sailStates.de;
	Cm = (-13.106025)*sailStates.alpha + (-1.318464)*sailStates.beta + (7.444870)*sailStates.p + (-133.652283)*sailStates.q + (6.891550)*sailStates.r + (-0.067356)*sailStates.de;
	Cn = (-0.230019)*sailStates.alpha + (0.058096)*sailStates.beta + (1.571899)*sailStates.p + (-7.206968)*sailStates.q + (0.017789)*sailStates.r + (-0.000356)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end