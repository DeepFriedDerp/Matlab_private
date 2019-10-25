function [aeroForces] = paramSpace_1_4_1_3_3_1_3(sailStates,airStates)

	CL = (4.194628)*sailStates.alpha + (0.419980)*sailStates.beta + (-2.746271)*sailStates.p + (39.633030)*sailStates.q + (-1.879587)*sailStates.r + (0.010924)*sailStates.de;
	CD = -0.241870;
	CY = (0.019541)*sailStates.alpha + (-0.022395)*sailStates.beta + (-0.653414)*sailStates.p + (0.684400)*sailStates.q + (-0.130046)*sailStates.r + (0.000145)*sailStates.de;

	Cl = (1.442158)*sailStates.alpha + (0.420409)*sailStates.beta + (-1.319075)*sailStates.p + (11.862954)*sailStates.q + (-1.496739)*sailStates.r + (0.000497)*sailStates.de;
	Cm = (-12.399695)*sailStates.alpha + (-1.624311)*sailStates.beta + (8.303640)*sailStates.p + (-140.146637)*sailStates.q + (6.278963)*sailStates.r + (-0.067302)*sailStates.de;
	Cn = (0.161006)*sailStates.alpha + (0.056837)*sailStates.beta + (1.225458)*sailStates.p + (-5.067139)*sailStates.q + (-0.001962)*sailStates.r + (-0.000280)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end