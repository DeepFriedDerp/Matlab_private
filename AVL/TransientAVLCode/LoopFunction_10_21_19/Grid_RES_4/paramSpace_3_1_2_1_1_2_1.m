function [aeroForces] = paramSpace_3_1_2_1_1_2_1(sailStates,airStates)

	CL = (3.863816)*sailStates.alpha + (0.103998)*sailStates.beta + (-1.645462)*sailStates.p + (27.620474)*sailStates.q + (0.653594)*sailStates.r + (0.010497)*sailStates.de;
	CD = -0.040240;
	CY = (-0.297475)*sailStates.alpha + (-0.026201)*sailStates.beta + (0.305636)*sailStates.p + (-1.471502)*sailStates.q + (-0.019981)*sailStates.r + (-0.000310)*sailStates.de;

	Cl = (0.815752)*sailStates.alpha + (-0.052396)*sailStates.beta + (-0.514424)*sailStates.p + (3.639189)*sailStates.q + (0.485169)*sailStates.r + (-0.000709)*sailStates.de;
	Cm = (-13.669727)*sailStates.alpha + (-0.339113)*sailStates.beta + (5.543508)*sailStates.p + (-111.058342)*sailStates.q + (-2.189059)*sailStates.r + (-0.066700)*sailStates.de;
	Cn = (0.638353)*sailStates.alpha + (0.007997)*sailStates.beta + (-0.623026)*sailStates.p + (3.928442)*sailStates.q + (0.011139)*sailStates.r + (0.000459)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end