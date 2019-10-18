function [aeroForces] = paramSpace_2_1_2_1_1_2_2(sailStates,airStates)

	CL = (5.806334)*sailStates.alpha + (-1.919493)*sailStates.beta + (-3.675148)*sailStates.p + (50.277210)*sailStates.q + (2.065207)*sailStates.r + (0.012652)*sailStates.de;
	CD = -5.479160;
	CY = (1.935586)*sailStates.alpha + (-0.134984)*sailStates.beta + (0.225979)*sailStates.p + (15.532762)*sailStates.q + (-0.022050)*sailStates.r + (0.003288)*sailStates.de;

	Cl = (-4.771649)*sailStates.alpha + (-0.991048)*sailStates.beta + (-1.861943)*sailStates.p + (16.030432)*sailStates.q + (2.303739)*sailStates.r + (0.001607)*sailStates.de;
	Cm = (2.095779)*sailStates.alpha + (8.661245)*sailStates.beta + (11.609658)*sailStates.p + (-164.508286)*sailStates.q + (-7.332742)*sailStates.r + (-0.068235)*sailStates.de;
	Cn = (-2.123534)*sailStates.alpha + (0.221701)*sailStates.beta + (-0.699293)*sailStates.p + (-9.793158)*sailStates.q + (-0.197683)*sailStates.r + (-0.004319)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end