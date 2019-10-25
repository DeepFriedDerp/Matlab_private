function [aeroForces] = paramSpace_1_2_3_2_1_3_1(sailStates,airStates)

	CL = (4.300254)*sailStates.alpha + (0.030097)*sailStates.beta + (-2.038129)*sailStates.p + (28.228405)*sailStates.q + (0.389795)*sailStates.r + (0.009789)*sailStates.de;
	CD = -0.448550;
	CY = (-0.192884)*sailStates.alpha + (-0.023888)*sailStates.beta + (0.422211)*sailStates.p + (-1.057312)*sailStates.q + (0.083945)*sailStates.r + (-0.000223)*sailStates.de;

	Cl = (1.198909)*sailStates.alpha + (-0.159007)*sailStates.beta + (-0.850454)*sailStates.p + (6.050890)*sailStates.q + (0.566137)*sailStates.r + (-0.000084)*sailStates.de;
	Cm = (-15.551534)*sailStates.alpha + (-0.131343)*sailStates.beta + (7.852565)*sailStates.p + (-125.069839)*sailStates.q + (-1.214142)*sailStates.r + (-0.066745)*sailStates.de;
	Cn = (0.712528)*sailStates.alpha + (-0.037074)*sailStates.beta + (-1.062015)*sailStates.p + (5.945290)*sailStates.q + (-0.064980)*sailStates.r + (0.000379)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end