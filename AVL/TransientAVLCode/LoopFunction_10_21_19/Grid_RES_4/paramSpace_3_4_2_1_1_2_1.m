function [aeroForces] = paramSpace_3_4_2_1_1_2_1(sailStates,airStates)

	CL = (3.863817)*sailStates.alpha + (-0.103998)*sailStates.beta + (-1.645462)*sailStates.p + (27.620476)*sailStates.q + (0.653593)*sailStates.r + (0.010497)*sailStates.de;
	CD = -0.040240;
	CY = (-0.297475)*sailStates.alpha + (-0.023372)*sailStates.beta + (0.305636)*sailStates.p + (-1.471502)*sailStates.q + (-0.019981)*sailStates.r + (-0.000310)*sailStates.de;

	Cl = (0.630952)*sailStates.alpha + (-0.131527)*sailStates.beta + (-0.416725)*sailStates.p + (2.430629)*sailStates.q + (0.478808)*sailStates.r + (-0.000964)*sailStates.de;
	Cm = (-13.669725)*sailStates.alpha + (0.339113)*sailStates.beta + (5.543507)*sailStates.p + (-111.058342)*sailStates.q + (-2.189058)*sailStates.r + (-0.066700)*sailStates.de;
	Cn = (0.674937)*sailStates.alpha + (0.004058)*sailStates.beta + (-0.629430)*sailStates.p + (4.007654)*sailStates.q + (0.011556)*sailStates.r + (0.000459)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end