function [aeroForces] = paramSpace_4_2_4_2_3_1_1(sailStates,airStates)

	CL = (4.189152)*sailStates.alpha + (-0.016714)*sailStates.beta + (-2.036966)*sailStates.p + (28.325020)*sailStates.q + (-0.374203)*sailStates.r + (0.009615)*sailStates.de;
	CD = -0.392390;
	CY = (0.187894)*sailStates.alpha + (-0.023742)*sailStates.beta + (-0.393442)*sailStates.p + (1.057313)*sailStates.q + (0.078374)*sailStates.r + (0.000223)*sailStates.de;

	Cl = (1.189592)*sailStates.alpha + (0.144762)*sailStates.beta + (-0.849828)*sailStates.p + (6.055373)*sailStates.q + (-0.519814)*sailStates.r + (-0.000084)*sailStates.de;
	Cm = (-15.139979)*sailStates.alpha + (0.043325)*sailStates.beta + (7.834495)*sailStates.p + (-125.069839)*sailStates.q + (1.123297)*sailStates.r + (-0.066745)*sailStates.de;
	Cn = (-0.699140)*sailStates.alpha + (-0.034480)*sailStates.beta + (1.018635)*sailStates.p + (-5.922753)*sailStates.q + (-0.065989)*sailStates.r + (-0.000393)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end