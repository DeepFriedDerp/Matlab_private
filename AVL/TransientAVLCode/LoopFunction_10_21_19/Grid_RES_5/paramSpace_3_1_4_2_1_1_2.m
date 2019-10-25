function [aeroForces] = paramSpace_3_1_4_2_1_1_2(sailStates,airStates)

	CL = (4.062364)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.759164)*sailStates.p + (38.575665)*sailStates.q + (-1.379607)*sailStates.r + (0.011317)*sailStates.de;
	CD = -0.075250;
	CY = (-0.069347)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.385014)*sailStates.p + (-0.261303)*sailStates.q + (-0.067916)*sailStates.r + (-0.000056)*sailStates.de;

	Cl = (1.288333)*sailStates.alpha + (0.202933)*sailStates.beta + (-1.363982)*sailStates.p + (11.944980)*sailStates.q + (-1.048179)*sailStates.r + (0.000636)*sailStates.de;
	Cm = (-13.422338)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.813657)*sailStates.p + (-141.841248)*sailStates.q + (4.591701)*sailStates.r + (-0.069021)*sailStates.de;
	Cn = (0.230067)*sailStates.alpha + (0.035783)*sailStates.beta + (0.690875)*sailStates.p + (-2.267981)*sailStates.q + (-0.020824)*sailStates.r + (-0.000009)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end