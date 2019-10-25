function [aeroForces] = paramSpace_1_1_1_3_3_1_3(sailStates,airStates)

	CL = (4.194629)*sailStates.alpha + (-0.419980)*sailStates.beta + (-2.746271)*sailStates.p + (39.633030)*sailStates.q + (-1.879587)*sailStates.r + (0.010924)*sailStates.de;
	CD = -0.241870;
	CY = (0.019541)*sailStates.alpha + (-0.027177)*sailStates.beta + (-0.653414)*sailStates.p + (0.684400)*sailStates.q + (-0.130046)*sailStates.r + (0.000145)*sailStates.de;

	Cl = (1.561271)*sailStates.alpha + (0.169365)*sailStates.beta + (-1.413432)*sailStates.p + (13.050836)*sailStates.q + (-1.515635)*sailStates.r + (0.000753)*sailStates.de;
	Cm = (-12.399693)*sailStates.alpha + (1.624312)*sailStates.beta + (8.303640)*sailStates.p + (-140.146637)*sailStates.q + (6.278963)*sailStates.r + (-0.067302)*sailStates.de;
	Cn = (0.265985)*sailStates.alpha + (0.060476)*sailStates.beta + (1.206689)*sailStates.p + (-4.830855)*sailStates.q + (-0.005721)*sailStates.r + (-0.000280)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end