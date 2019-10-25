function [aeroForces] = paramSpace_3_4_1_1_1_1_2(sailStates,airStates)

	CL = (5.436543)*sailStates.alpha + (0.419564)*sailStates.beta + (-2.472459)*sailStates.p + (32.112514)*sailStates.q + (-1.461607)*sailStates.r + (0.010384)*sailStates.de;
	CD = -1.746880;
	CY = (-0.200952)*sailStates.alpha + (-0.023516)*sailStates.beta + (-0.723421)*sailStates.p + (-1.693496)*sailStates.q + (0.047594)*sailStates.r + (-0.000362)*sailStates.de;

	Cl = (1.059806)*sailStates.alpha + (0.522663)*sailStates.beta + (-1.121225)*sailStates.p + (8.434210)*sailStates.q + (-1.529529)*sailStates.r + (0.000171)*sailStates.de;
	Cm = (-14.460781)*sailStates.alpha + (-1.776902)*sailStates.beta + (8.994143)*sailStates.p + (-135.354233)*sailStates.q + (5.008288)*sailStates.r + (-0.068922)*sailStates.de;
	Cn = (-0.241634)*sailStates.alpha + (-0.026076)*sailStates.beta + (1.724060)*sailStates.p + (-6.656314)*sailStates.q + (-0.008573)*sailStates.r + (0.000352)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end