function [aeroForces] = paramSpace_1_3_2_1_2_3_1(sailStates,airStates)

	CL = (5.420268)*sailStates.alpha + (-0.118400)*sailStates.beta + (-1.457734)*sailStates.p + (20.109297)*sailStates.q + (1.605125)*sailStates.r + (0.008657)*sailStates.de;
	CD = -2.047960;
	CY = (-0.413295)*sailStates.alpha + (-0.025703)*sailStates.beta + (0.908442)*sailStates.p + (-0.662190)*sailStates.q + (0.180724)*sailStates.r + (-0.000138)*sailStates.de;

	Cl = (0.978278)*sailStates.alpha + (-0.466379)*sailStates.beta + (-0.393860)*sailStates.p + (0.878184)*sailStates.q + (1.683664)*sailStates.r + (-0.000819)*sailStates.de;
	Cm = (-16.287697)*sailStates.alpha + (0.451223)*sailStates.beta + (6.887887)*sailStates.p + (-110.966957)*sailStates.q + (-5.208683)*sailStates.r + (-0.065509)*sailStates.de;
	Cn = (1.992982)*sailStates.alpha + (-0.081071)*sailStates.beta + (-2.106273)*sailStates.p + (9.975877)*sailStates.q + (-0.068507)*sailStates.r + (0.000342)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end