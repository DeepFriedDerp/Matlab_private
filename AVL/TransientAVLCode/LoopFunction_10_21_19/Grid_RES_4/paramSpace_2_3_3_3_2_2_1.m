function [aeroForces] = paramSpace_2_3_3_3_2_2_1(sailStates,airStates)

	CL = (4.041871)*sailStates.alpha + (0.018117)*sailStates.beta + (-2.306536)*sailStates.p + (32.852345)*sailStates.q + (-0.295198)*sailStates.r + (0.010933)*sailStates.de;
	CD = 0.028140;
	CY = (-0.001941)*sailStates.alpha + (-0.024997)*sailStates.beta + (-0.057603)*sailStates.p + (-0.065300)*sailStates.q + (-0.003778)*sailStates.r + (-0.000014)*sailStates.de;

	Cl = (1.091259)*sailStates.alpha + (0.037418)*sailStates.beta + (-0.979186)*sailStates.p + (7.611594)*sailStates.q + (-0.187872)*sailStates.r + (-0.000041)*sailStates.de;
	Cm = (-14.668753)*sailStates.alpha + (-0.056311)*sailStates.beta + (7.889454)*sailStates.p + (-130.047943)*sailStates.q + (0.991981)*sailStates.r + (-0.069357)*sailStates.de;
	Cn = (0.010266)*sailStates.alpha + (0.002157)*sailStates.beta + (0.084134)*sailStates.p + (-0.222242)*sailStates.q + (-0.002621)*sailStates.r + (0.000008)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end